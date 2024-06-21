<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\Alamat;
use App\Models\BahanBaku;
use App\Models\Customer;
use App\Models\DetailPenjualan;
use App\Models\HistorySaldo;
use App\Models\PemesananProdukHarian;
use App\Models\Produk;
use App\Models\TrxPemakaianBb;
use App\Models\TrxPenjualan;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Kreait\Firebase\Messaging\CloudMessage;

class PenjualanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    private function listPemesanan(Request $request, string $status, int $idCustomer = 0, string $tanggalSiap = null, string $orStatus = null, bool $tanggalKurangDariSamaDengan = false)
    {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $penjualans = TrxPenjualan::with('customer.user', 'alamat');
        if ($idCustomer) {
            $penjualans->where('id_customer', $idCustomer);
        }

        $penjualans->where(function ($query) use ($status, $orStatus) {
            $query->where('status_pesanan', $status);
            if ($orStatus) {
                $query->orWhere('status_pesanan', $orStatus);
            }
        });

        // Tanggal
        if ($tanggalSiap) {
            $penjualans->whereDate('tanggal_siap', $tanggalKurangDariSamaDengan ? '<' : '=', $tanggalSiap);
        }

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $penjualans->where('no_nota', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $penjualans->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $penjualans = $penjualans->paginate($size, ['*'], 'page', $page);

        return $penjualans;
    }

    private function generateNomorNota(int $id, Carbon $tanggalPesan)
    {
        // format YY.MM.ID
        return $tanggalPesan->format('y.m.') . $id;
    }

    private function getPoinDidapat(int $totalHarga)
    {
        $kelipatan1jt = floor($totalHarga / 1000000) * 200;
        $sisa = $totalHarga % 1000000;
        $kelipatan500rb = floor($sisa / 500000) * 75;
        $sisa = $sisa % 500000;
        $kelipatan100rb = floor($sisa / 100000) * 15;
        $sisa = $sisa % 100000;
        $kelipatan10rb = floor($sisa / 10000) * 1;
        return $kelipatan1jt + $kelipatan500rb + $kelipatan100rb + $kelipatan10rb;
    }

    private function converetPoinToRupiah(int $poin)
    {
        return $poin * 100;
    }

    private function updateStok(Produk $produk, Carbon $tanggalSiap, float $qty, int $depth = 0)
    {
        // kalau mau balikin stok, tinggal set qty jadi negatif
        // HARUS DALAM TRANSACTION AGAR BISA DIROLLBACK
        if ($depth > 5) {
            throw ValidationException::withMessages([
                'stok' => "stack overflow bjirr 🗿🗿🗿",
            ]);
        }

        if ($produk->id_kategori == 5) {
            // Hampers, ke function tetangga
            try {
                $this->updateStokHampers($produk, $tanggalSiap, $qty, $depth);
            } catch (ValidationException $e) {
                throw ValidationException::withMessages([
                    'stok' => "Pada hampers {$produk->nama}: " . $e->validator->errors()->first(),
                ]);
            }
        } else if ($produk->id_kategori == 4) {
            // Titipan, kurangi stok
            if ($produk->stok_ready - $qty < 0) {
                throw ValidationException::withMessages([
                    'stok' => "Produk titipan {$produk->nama} hanya tersisa {$produk->stok_ready}.",
                ]);
            }
            $produk->update([
                'stok_ready' => $produk->stok_ready - $qty,
            ]);
        } else {
            // Produk PO
            $pph = PemesananProdukHarian::where('id_produk', $produk->id)
                ->where('tanggal', $tanggalSiap)
                ->first();
            if ($pph) {
                $newJmlDipesan = $pph->jumlah_dipesan + $qty;
                if ($newJmlDipesan > $pph->kuota_hari_ini) {
                    throw ValidationException::withMessages([
                        'stok' => "Produk PO {$produk->nama} sudah melebihi kuota hari ini. Silakan kurangi jumlah pesanan atau ganti ke lain hari.",
                    ]);
                }

                $pph->update([
                    'jumlah_dipesan' => $newJmlDipesan,
                ]);
            } else {
                if ($qty > $produk->kuota_harian) {
                    throw ValidationException::withMessages([
                        'stok' => "Produk PO {$produk->nama} sudah melebihi kuota hari ini. Silakan kurangi jumlah pesanan atau ganti ke lain hari.",
                    ]);
                }
                $pph = new PemesananProdukHarian([
                    'id_produk' => $produk->id,
                    'tanggal' => $tanggalSiap,
                    'jumlah_dipesan' => $qty,
                    'kuota_hari_ini' => $produk->kuota_harian
                ]);
                $pph->save();
            }
        }
    }

    private function updateStokHampers(Produk $hampers, Carbon $tanggalSiap, float $qty, int $depth)
    {
        // HARUS DALAM TRANSACTION AGAR BISA DIROLLBACK
        $hampers->load('detail_hampers');
        foreach ($hampers->detail_hampers as $dh) {
            $produk = Produk::find($dh->id_produk);
            $this->updateStok($produk, $tanggalSiap, $dh->qty * $qty, $depth + 1);
        }
    }

    /**
     * PEMESANAN (COSTUMER)
     */
    public function buatPemesanan(Request $request)
    {
        $request->validate([
            'tanggal_siap' => 'required|date|after:tomorrow', // H+2
            'jenis_pengiriman' => 'required|in:Delivery,Pick-Up',
            'produks' => 'required|array|min:1',
            'poin' => 'nullable|integer|min:0',
            'produks.*.id_produk' => 'required|exists:produk,id',
            'produks.*.qty' => 'required|numeric|min:0.5',
            'produks.*.catatan' => 'nullable|string',
        ]);

        $idAlamat = null;
        if ($request->input('jenis_pengiriman') == 'Delivery') {
            $request->validate([
                'id_alamat' => 'required|exists:alamat,id',
            ]);
            $idAlamat = $request->input('id_alamat');
        }

        $poinDipakai = $request->input('poin', 0);
        $customer = $request->user()->customer;
        if ($request->input('poin', 0) > 0) {
            if ($customer->poin < $request->input('poin')) {
                throw ValidationException::withMessages([
                    'poin' => "Poin tidak cukup. Anda memiliki {$customer->poin} poin.",
                ]);
            }
        }

        $idCustomer = $request->user()->id;
        $tanggalPesan = now();
        $statusPesanan = "Menunggu Ongkos Kirim";
        if ($request->input('jenis_pengiriman') == 'Pick-Up') {
            $statusPesanan = "Menunggu Pembayaran";
        }

        $penjualan = new TrxPenjualan([
            "id_customer" => $idCustomer,
            "id_alamat" => $idAlamat,
            "tanggal_pesan" => $tanggalPesan,
            "tanggal_siap" => $request->input('tanggal_siap'),
            "harga_pesanan" => 0, // sementara
            "grand_total" => 0, // sementara
            "poin_dipakai" => $poinDipakai,
            "jenis_pengiriman" => $request->input('jenis_pengiriman'),
            "status_pesanan" => $statusPesanan,
        ]);

        $penjualan->save();

        // Simpan detail penjualan
        $totalHarga = 0;
        DB::beginTransaction();
        try {
            foreach ($request->input('produks') as $inP) {
                $produk = Produk::find($inP['id_produk']);
                $qty = $inP['qty'];
                if ($produk->id_kategori != 1) {
                    // tidak ada harga setengah loyang (bukan cake): pembulatan ke atas
                    $qty = ceil($qty);
                } else {
                    // harus kelipatan 0.5
                    $qty = round($qty * 2) / 2;
                }

                $subtotal = $produk->harga * floor($qty);
                if (floor($qty) != $qty) {
                    $subtotal += $produk->harga_setengah_loyang;
                }

                $totalHarga += $subtotal;

                DetailPenjualan::create([
                    'id_trx_penjualan' => $penjualan->id,
                    'id_produk' => $inP['id_produk'],
                    'qty' => $qty,
                    'subtotal' => $subtotal,
                    'catatan' => $inP['catatan'] ?? null,
                ]);

                // Untuk stok
                $this->updateStok($produk, $penjualan->tanggal_siap, $qty);
            }
            DB::commit();
        } catch (ValidationException $e) {
            DB::rollBack();
            $penjualan->delete();
            // Reset auto increment
            DB::statement("ALTER TABLE trx_penjualan AUTO_INCREMENT = " . (TrxPenjualan::max('id') + 1));
            throw $e;
        }

        $poinDidapat = $this->getPoinDidapat($totalHarga);

        // Cek double poin
        $dblPoinActive = false;
        $nextHUT = Carbon::parse($customer->tanggal_lahir);
        $nextHUT->year = Carbon::now()->year; // not valid if 1,2,3 Jan
        $tglUlangTahun = $nextHUT->format('Y-m-d');
        $now = time();
        $startTime = strtotime($tglUlangTahun . " -3 days");
        $endTime = strtotime($tglUlangTahun . " +3 days");
        if ($now >= $startTime && $now <= $endTime) {
            $poinDidapat *= 2;
            $dblPoinActive = true;
        }

        $customer->update([
            'poin' => $customer->poin - $poinDipakai,
        ]); // + $poinDidapat setelah dikonfirmasi MO

        $ongkosKirim = null;
        if ($idAlamat) {
            $alamat = Alamat::find($idAlamat);
            if ($alamat->jarak != null) {
                $ongkosKirim = TrxPenjualan::getOngkosKirim($alamat->jarak);
                $statusPesanan = "Menunggu Pembayaran";
            }
        }

        $penjualan->update([
            'no_nota' => $this->generateNomorNota($penjualan->id, $tanggalPesan),
            'harga_pesanan' => $totalHarga,
            'ongkos_kirim' => $ongkosKirim,
            'grand_total' => $totalHarga + ($ongkosKirim ?? 0) - $this->converetPoinToRupiah($poinDipakai ?? 0),
            'poin_didapat' => $poinDidapat,
            'status_pesanan' => $statusPesanan,
        ]);

        return new ApiResponse($penjualan, "Berhasil membuat pemesanan. Anda mendapat $poinDidapat poin" . ($dblPoinActive ? " (Double Poin Hari Ulang Tahun)" : ""));
    }

    /**
     * SHOW PEMESANAN (COSTUMER)
     */
    public function show(TrxPenjualan $trxPenjualan)
    {
        $trxPenjualan->load('customer.user', 'alamat', 'detail_penjualans.produk');
        return new ApiResponse($trxPenjualan);
    }

    /**
     * LIST MENUNGGU ONGKOS KIRIM (ADMIN)
     */
    public function listMenungguOngkosKirim(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Menunggu Ongkos Kirim");
        return new ApiResponse($penjualans);
    }

    /**
     * INPUT JARAK PENGIRIMAN (ADMIN)
     */
    public function inputJarakPengiriman(Request $request, Alamat $alamat)
    {
        $request->validate([
            'jarak' => 'required|numeric|min:0',
        ]);

        $alamat->jarak = $request->input('jarak');
        $alamat->save();

        // Update ongkir dan grand total di trx_penjualan
        $trx = TrxPenjualan::where('id_alamat', $alamat->id)->where('status_pesanan', 'Menunggu Ongkos Kirim')->get();
        $ongkir = TrxPenjualan::getOngkosKirim($alamat->jarak);
        foreach ($trx as $t) {
            $t->update([
                'ongkos_kirim' => $ongkir,
                'grand_total' => $t->harga_pesanan + $ongkir - $this->converetPoinToRupiah($t->poin_dipakai ?? 0),
                'status_pesanan' => 'Menunggu Pembayaran',
            ]);
        }

        return new ApiResponse($alamat, "Berhasil mengupdate jarak pengiriman");
    }

    /**
     * LIST MENUNGGU PEMBAYARAN (CUSTOMER)
     */
    public function listMenungguPembayaran(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Menunggu Pembayaran", $request->user()->id);
        return new ApiResponse($penjualans);
    }

    /**
     * KIRIM BUKTI PEMBAYARAN (COSTUMER)
     */
    public function sendBuktiPembayaran(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Menunggu Pembayaran') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Menunggu Pembayaran)",
            ]);
        } else if ($trxPenjualan->id_customer != $request->user()->id) {
            throw ValidationException::withMessages([
                'id_customer' => "Anda tidak memiliki akses ke pesanan ini",
            ]);
        }

        $request->validate([
            'bukti_pembayaran' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'metode_pembayaran' => 'required|string'
        ]);

        // Proses upload gambar
        $foto = $request->file('bukti_pembayaran');
        $nama_foto = time() . '.' . $foto->getClientOriginalExtension();
        $foto->move(public_path('images'), $nama_foto);

        $trxPenjualan->update([
            'bukti_pembayaran' => $nama_foto,
            'metode_pembayaran' => $request->input('metode_pembayaran'),
            'status_pesanan' => 'Menunggu Konfirmasi Pembayaran',
        ]);

        return new ApiResponse($trxPenjualan, "Berhasil mengirim bukti pembayaran");
    }

    /**
     * LIST MENUNGGU KONFIRMASI PEMBAYARAN (ADMIN)
     */
    public function listMenungguKonfirmasiPembayaran(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Menunggu Konfirmasi Pembayaran");
        return new ApiResponse($penjualans);
    }

    /**
     * KONFIRMASI PEMBAYARAN (ADMIN)
     */
    public function konfirmasiPembayaran(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Menunggu Konfirmasi Pembayaran') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Menunggu Konfirmasi Pembayaran)",
            ]);
        }

        $request->validate([
            'jumlah_pembayaran' => 'required|integer|min:0',
        ]);

        // Kalau kelebihan bayar, sisanya dikaasih ke tip
        $tip = 0;
        if ($request->input('jumlah_pembayaran') >= $trxPenjualan->grand_total) {
            $tip = $request->input('jumlah_pembayaran') - $trxPenjualan->grand_total;
        } else {
            // Pembayaran kurang
            throw ValidationException::withMessages([
                'jumlah_pembayaran' => "Jumlah pembayaran kurang. Minimal pembayaran adalah Rp " . $trxPenjualan->grand_total,
            ]);
        }

        $trxPenjualan->update([
            'jumlah_pembayaran' => $request->input('jumlah_pembayaran'),
            'tip' => $tip,
            'status_pesanan' => 'Menunggu Konfirmasi Pembuatan',
        ]);

        return new ApiResponse($trxPenjualan, "Berhasil menginput jumlah pembayaran");
    }

    /**
     * LIST MENUNGGU KONFIRMASI PEMBUATAN (MO)
     */
    public function listMenungguKonfirmasiPembuatan(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Menunggu Konfirmasi Pembuatan");
        return new ApiResponse($penjualans);
    }

    private function batalkanPesanan(TrxPenjualan $trxPenjualan, Customer $customer, bool $sudahBayar = false) {
        // Balikin stok
        DB::beginTransaction();
        $trxPenjualan->load('detail_penjualans.produk');
        foreach ($trxPenjualan->detail_penjualans as $dp) {
            $produk = $dp->produk;
            $this->updateStok($produk, $trxPenjualan->tanggal_siap, -$dp->qty);
        }

        // Balikin poin dipakai dan pembayaran ke saldo
        $customer->update([
            'poin' => $customer->poin + $trxPenjualan->poin_dipakai,
        ]);

        if ($sudahBayar) {
            $customer->update([
                'saldo' => $customer->saldo + $trxPenjualan->grand_total,
            ]);

            // Update history saldo
            $historySaldo = new HistorySaldo([
                'id_customer' => $customer->id,
                'timestamp' => now(),
                'nominal' => $trxPenjualan->grand_total,
                'saldo_akhir' => $customer->saldo,
                'catatan' => "Pembatalan pesanan " . $trxPenjualan->no_nota,
                'diproses' => 1,
            ]);

            $historySaldo->save();
        }

        DB::commit();
    }

    /**
     * KONFIRMASI PEMBUATAN (MO)
     */
    public function konfirmasiPesanan(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Menunggu Konfirmasi Pembuatan') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Menunggu Konfirmasi Pembuatan)",
            ]);
        }

        $request->validate([
            'status' => 'required|boolean',
        ]);

        $customer = $trxPenjualan->customer;
        $diterima = $request->input('status');
        if ($diterima) {
            $trxPenjualan->update([
                'status_pesanan' => 'Pesanan Dijadwalkan',
            ]);

            // Tambah poin
            $customer->update([
                'poin' => $customer->poin + $trxPenjualan->poin_didapat,
            ]);
        } else {
            $trxPenjualan->update([
                'status_pesanan' => 'Pesanan Ditolak',
            ]);

            $this->batalkanPesanan($trxPenjualan, $customer, true);
        }

        return new ApiResponse($trxPenjualan, "Berhasil mengkonfirmasi pesanan: Pesanan " . ($diterima ? "DITERIMA" : "DITOLAK"));
    }

    private function getListProdukDanQty(TrxPenjualan $trxPenjualan)
    {
        $listProduk = [];
        foreach ($trxPenjualan->detail_penjualans as $dp) {
            $produk = $dp->produk;
            $qty = $dp->qty;
            if ($produk->id_kategori == 5) {
                $listProduk = array_merge($listProduk, $this->getListProdukDariHampers($produk, $qty));
            } else {
                $listProduk[] = [
                    'produk' => $produk,
                    'qty' => $qty,
                ];
            }
        }

        return $listProduk;
    }

    private function getListProdukDariHampers(Produk $hampers, float $qtyHampers)
    {
        $listProduk = [];
        $hampers->load('detail_hampers.produk');
        foreach ($hampers->detail_hampers as $dh) {
            $produk = $dh->produk;
            $qtyProduk = $dh->qty;
            if ($produk->id_kategori == 5) {
                $listProduk = array_merge($listProduk, $this->getListProdukDariHampers($produk, $qtyProduk * $qtyHampers));
            } else {
                $listProduk[] = [
                    'produk' => $produk,
                    'qty' => $qtyProduk * $qtyHampers,
                ];
            }
        }

        return $listProduk;
    }

    private function getLBB(TrxPenjualan $trxPenjualan) {
        // Get List Bahan Baku
        $trxPenjualan->load('detail_penjualans.produk');
        $listProduk = $this->getListProdukDanQty($trxPenjualan);
        $groupProduk = [];
        $groupBB = [];
        foreach ($listProduk as $lp) {
            $produk = $lp['produk'];
            $qty = $lp['qty'];

            // if kategori == 4, titipan, skip
            if ($produk->id_kategori == 4) {
                continue;
            }

            if (!array_key_exists($produk->id, $groupProduk)) {
                $produk->load('produk_bahans.bahan_baku');
                $groupProduk[$produk->id] = [
                    'produk' => $produk,
                    'qty' => 0,
                ];
            }

            // Kalau cake, minimal 1 loyang
            if ($produk->id_kategori == 1 && $qty < 1) {
                $qty = 1;
            }
            $groupProduk[$produk->id]['qty'] += $qty;
        }

        foreach ($groupProduk as $gp) {
            $produk = $gp['produk'];
            $qty = $gp['qty'];
            foreach ($produk->produk_bahans as $pb) {
                $bb = $pb->bahan_baku;
                $stokDibutuhkan = $qty * $pb->qty;
                if (!array_key_exists($bb->id, $groupBB)) {
                    $groupBB[$bb->id] = array_merge($bb->toArray(), ['stok' => [
                        "dibutuhkan" => 0,
                        "tersedia" => $bb->stok,
                    ]]);
                }

                $groupBB[$bb->id]['stok']['dibutuhkan'] += $stokDibutuhkan;
            }
        }

        return [$groupProduk, $groupBB];
    }

    public function getListBahanBaku(Request $request, TrxPenjualan $trxPenjualan)
    {
        [$groupProduk, $groupBB] = $this->getLBB($trxPenjualan);

        return new ApiResponse([
            'produk_po' => $groupProduk,
            'rekap_bahan' => $groupBB,
        ], "Berhasil mendapatkan list bahan baku");
    }

    function listPemrosesanHariIni(Request $request)
    {
        // Tanggal = kalau diproses hari ini, berarti untuk besok
        // Atma Kitchen - alur pemrosesan pesanan.pdf
        $tanggal = now()->modify('+1 day')->toDateString();
        $penjualans = $this->listPemesanan($request, "Pesanan Dijadwalkan", 0, $tanggal);
        return new ApiResponse($penjualans);
    }

    function prosesPemesanan(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Pesanan Dijadwalkan') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Pesanan Dijadwalkan)",
            ]);
        }

        // Cek bahan baku: kalau ada yang kurang, error
        [$groupProduk, $groupBB] = $this->getLBB($trxPenjualan);
        $bbKurang = [];
        foreach ($groupBB as $bb) {
            if ($bb['stok']['dibutuhkan'] > $bb['stok']['tersedia']) {
                $bbKurang[] = $bb;
            }
        }

        if (count($bbKurang) > 0) {
            throw ValidationException::withMessages([
                'bahan_baku' => "Stok bahan baku tidak mencukupi. Silakan tambah stok bahan baku berikut: " . implode(", ", array_map(function ($bb) {
                    return $bb['nama'];
                }, $bbKurang)),
            ]);
        }

        foreach ($groupBB as $bb) {
            $bbModel = BahanBaku::find($bb['id']);

            // Mencatat pemakaian bahan baku
            $trxPemakaianBb = new TrxPemakaianBb([
                'id_bahan_baku' => $bbModel->id,
                'id_trx_penjualan' => $trxPenjualan->id,
                'tanggal' => now(),
                'qty' => $bb['stok']['dibutuhkan'],
            ]);

            $trxPemakaianBb->save();

            // Mengurangi stok bahan baku
            $bbModel->update([
                'stok' => $bbModel->stok - $bb['stok']['dibutuhkan'],
            ]);
        }

        $trxPenjualan->update([
            'status_pesanan' => 'Diproses'
        ]);

        return new ApiResponse($trxPenjualan, "Berhasil mengkonfirmasi pesanan: Pesanan DIPROSES");
    }

    function listPesananDiproses(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Diproses");
        return new ApiResponse($penjualans);
    }

    function updateStatusPengiriman(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Diproses') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Diproses)",
            ]);
        }

        // Cek apakah Pick-up atau Delivery
        $jenisPengiriman = $trxPenjualan->jenis_pengiriman;
        $statusPesanan = "";
        if ($jenisPengiriman == "Pick-Up") {
            $trxPenjualan->update([
                'status_pesanan' => 'Siap Di-Pick-Up',
            ]);
            $statusPesanan = "Siap Di-Pick-Up";
        } else {
            $trxPenjualan->update([
                'status_pesanan' => 'Sedang Dikirim',
            ]);
            $statusPesanan = "Sedang Dikirim";
        }

        // Notifikasi ke customer
        $firebase = app('firebase.messaging');

        $message = CloudMessage::withTarget('topic', "notif-{$trxPenjualan->id_customer}")
            ->withNotification([
                'title' => "Pesanan Anda $statusPesanan",
                'body' => "Pesanan deengan ID #{$trxPenjualan->no_nota} $statusPesanan. Terima kasih telah berbelanja di Atma Kitchen!"
            ]);

        $firebase->send($message);

        return new ApiResponse($trxPenjualan, "Berhasil mengupdate status pengiriman & mengirim notifikasi ke customer");
    }

    function listPesananSiapDipickup(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Siap Di-Pick-Up");
        return new ApiResponse($penjualans);
    }

    function updateStatusPesananDiambilCustomer(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Siap Di-Pick-Up') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Siap Di-Pick-Up)",
            ]);
        }

        $trxPenjualan->update([
            'status_pesanan' => 'Sudah Di-Pick-Up',
            'tanggal_ambil' => now(),
        ]);

        $firebase = app('firebase.messaging');

        $message = CloudMessage::withTarget('topic', "notif-{$trxPenjualan->id_customer}")
            ->withNotification([
                'title' => "Pesanan Anda Sudah Di-Pick-Up",
                'body' => "Pesanan dengan ID #{$trxPenjualan->no_nota} Sudah Di-Pick-Up. Pastikan pesanan sudah Anda terima, dan jangan lupa menyelesaikan pesanan ini di app!"
            ]);

        $firebase->send($message);

        return new ApiResponse($trxPenjualan, "Berhasil mengupdate status pesanan & mengirim notifikasi ke customer");
    }

    function listPesananSudahDipickupAtauSudahDikirim(Request $request)
    {
        $penjualans = $this->listPemesanan($request, "Sudah Di-Pick-Up", $request->user()->id, null, "Sedang Dikirim");
        return new ApiResponse($penjualans);
    }

    function konfirmasiPenerimaanPesanan(Request $request, TrxPenjualan $trxPenjualan)
    {
        if ($trxPenjualan->status_pesanan != 'Sudah Di-Pick-Up' && $trxPenjualan->status_pesanan != 'Sedang Dikirim') {
            throw ValidationException::withMessages([
                'status_pesanan' => "Status pesanan tidak valid (harus Sudah Di-Pick-Up atau Sedang Dikirim)",
            ]);
        }

        $trxPenjualan->update([
            'status_pesanan' => 'Selesai',
        ]);

        return new ApiResponse($trxPenjualan, "Berhasil mengkonfirmasi penerimaan pesanan");
    }

    function listPesananTerlambatBayar(Request $request)
    {
        $tanggal = now()->modify('+1 day')->toDateString(); // Batas pembayaran = H-1

        $penjualans = $this->listPemesanan($request, "Menunggu Pembayaran", 0, $tanggal, null, true);
        return new ApiResponse($penjualans);
    }

    function autoCancelPesanan(Request $request) {
        $tanggal = now()->modify('+1 day')->toDateString(); // Batas pembayaran = H-1
        $penjualans = TrxPenjualan::with('customer.user')
            ->where('status_pesanan', 'Menunggu Pembayaran')
            ->whereDate('tanggal_siap', '<=', $tanggal)
            ->get();

        foreach ($penjualans as $trx) {
            $customer = $trx->customer;
            $trx->update([
                'status_pesanan' => 'Pesanan Dibatalkan',
            ]);

            $this->batalkanPesanan($trx, $customer);
        }

        return new ApiResponse($penjualans, "Berhasil membatalkan {$penjualans->count()} pesanan yang terlambat bayar");
    }
}
