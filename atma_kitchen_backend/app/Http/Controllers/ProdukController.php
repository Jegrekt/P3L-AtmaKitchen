<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\DetailHamper;
use App\Models\PemesananProdukHarian;
use App\Models\Produk;
use App\Models\ProdukBahan;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class ProdukController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
            'id_kategori' => 'nullable|integer|min:1|max:5'
        ]);

        $produks = Produk::with(['penitip', 'kategori_produk', 'detail_hampers']);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $produks->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $produks->orderBy($sort);
        }

        // Filter by kategori
        if ($request->has('id_kategori')) {
            $id_kategori = $request->input('id_kategori');
            $produks->where('id_kategori', $id_kategori);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $produks = $produks->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($produks, "Berhasil menampilkan daftar produk");
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, Produk $produk = null)
    {
        $request->validate([
            'id_kategori' => 'required|integer|min:1|max:5',
            'nama' => 'required|string',
            'harga' => 'required|integer',
            // 'foto' => ($produk == null ? 'required' : 'nullable') . 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'deskripsi' => 'nullable|string',
        ]);

        // Proses upload gambar
        // $namaFoto = null;
        // if ($request->hasFile('foto')) {
        //     $foto = $request->file('foto');
        //     $nama_foto = time() . '.' . $foto->getClientOriginalExtension();
        //     $foto->move(public_path('images'), $nama_foto);
        //     $namaFoto = $nama_foto;
        // }

        // Kalau update, hapus foto lama
        // if ($produk != null) {
        // METHOD PUT: TIDAK ADA FILE UPLOAD (TIDAK BISA MULTIPART FORM DATA)
        // $namaFoto = $produk->foto;
        // if ($namaFoto != null && $produk->foto != null) {
        //     // Kalau ada foto baru dan foto lama juga masih ada, hapus foto lama
        //     $fotoLama = public_path('images') . '/' . $produk->foto;
        //     if (file_exists($fotoLama)) {
        //         unlink($fotoLama);
        //     }
        // } else {
        //     // Kalau tidak ada foto baru, pakai foto lama
        //     $namaFoto = $produk->foto;
        // }
        // }

        $id_kategori = $request->input("id_kategori");
        $data = [
            'id_kategori' => $id_kategori,
            'nama' => $request->input('nama'),
            'harga' => $request->input('harga'),
            // 'foto' => $namaFoto,
            'deskripsi' => $request->input('deskripsi')
        ];

        if ($produk == null) {
            $produk = new Produk($data);
        } else {
            $produk->fill($data);
        }

        $produk->harga_setengah_loyang = null;
        $produk->id_penitip = null;
        $produk->stok_ready = 0;
        $produk->kuota_harian = null;

        if ($id_kategori == 1) {
            // Kategory cake, harus ada harga setengah loyang
            $request->validate([
                'harga_setengah_loyang' => 'required|integer',
            ]);
            $produk->harga_setengah_loyang = $request->input('harga_setengah_loyang');
        } else if ($id_kategori == 4) {
            // Kategori titipan, harus ada id_penitip
            $request->validate([
                'id_penitip' => ($produk->id ? 'nullable' : 'required') . '|integer',
                'stok_ready' => 'required|integer|min:1' // harus ready stock, jadi minimal qty 1
            ]);
            $produk->id_penitip = $request->input('id_penitip') ?? $produk->id_penitip;
            $produk->stok_ready = $request->input('stok_ready');
        }

        if ($id_kategori != 4 && $id_kategori != 5) {
            // Kategori bukan titipan dan hampers, harus ada kuota harian
            $request->validate([
                'kuota_harian' => 'required|integer|min:1',
            ]);
            $produk->kuota_harian = $request->input('kuota_harian');
        }

        if ($produk->id == null) {
            $produk->save();
        } else {
            $produk->update();
        }

        // Detail hampers
        if ($id_kategori != 5) {
            // Kalau bukan kategori hampers, hapus dulu detail hampersnya
            $produk->detail_hampers()->delete();
        }

        // Hapus resep jika bukan ploduk buatan cendiry
        if ($id_kategori == 4 || $id_kategori == 5) {
            $produk->produk_bahans()->delete();
        }
        return $produk;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $produk = $this->createOrUpdate($request);

        $id_kategori = $request->input('id_kategori');
        if ($id_kategori == 5) {
            // Kategori hampers, harus ada detail hampers
            $request->validate([
                'hampers' => 'required|array',
                'hampers.*.id_produk' => 'required|integer',
                'hampers.*.qty' => 'required|integer',
            ]);

            $dataSemuaPH = [];
            foreach ($request->input('hampers') as $detailHampers) {
                $produkHampers = new DetailHamper([
                    'id_produk' => $detailHampers['id_produk'],
                    'id_hampers' => $produk->id,
                    'qty' => $detailHampers['qty'],
                ]);
                $produkHampers->save();
                $dataSemuaPH[] = $produkHampers;
            }
        }

        if ($id_kategori != 4 && $id_kategori != 5) {
            // Input resep
            $request->validate([
                'resep' => 'required|array',
                'resep.*.id_bahan_baku' => 'required|integer|min:1',
                'resep.*.qty' => 'required|integer|min:1',
            ]);

            $resepList = $request->input('resep');
            foreach ($resepList as $resep) {
                $produkBahan = new ProdukBahan([
                    'id_bahan_baku' => $resep['id_bahan_baku'],
                    'id_produk' => $produk->id,
                    'qty' => $resep['qty'],
                ]);
                $produkBahan->save();
            }
        }

        return new ApiResponse($produk, "Berhasil membuat produk " . $produk->nama);
    }

    /**
     * Display the specified resource.
     */
    public function show(Produk $produk)
    {
        $produk->load(['penitip', 'kategori_produk', 'detail_hampers.produk', 'produk_bahans.bahan_baku']);
        return new ApiResponse($produk, "Menampillkan detail produk " . $produk->nama);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Produk $produk)
    {
        $produk = $this->createOrUpdate($request, $produk);

        return new ApiResponse($produk, "Berhasil mengupdate produk " . $produk->nama);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Produk $produk)
    {
        $produk->detail_hampers()->delete();
        $produk->hampers_produk()->delete();
        $produk->produk_bahans()->delete();
        $produk->detail_penjualans()->delete();
        $produk->delete();
        return new ApiResponse(null, "Berhasil menghapus produk " . $produk->nama);
    }

    /**
     * Ganti foto produk
     */
    public function gantiFoto(Request $request, Produk $produk)
    {
        $request->validate([
            'foto' => 'required|image|mimes:jpeg,png,jpg|max:2048',
        ]);

        // Proses upload gambar
        $foto = $request->file('foto');
        $nama_foto = time() . '.' . $foto->getClientOriginalExtension();
        $foto->move(public_path('images'), $nama_foto);

        // Hapus foto lama
        if ($produk->foto != null) {
            $fotoLama = public_path('images') . '/' . $produk->foto;
            if (file_exists($fotoLama)) {
                unlink($fotoLama);
            }
        }

        $produk->foto = $nama_foto;
        $produk->update();

        return new ApiResponse($produk, "Berhasil mengganti foto produk " . $produk->nama);
    }

    public function storeAllDetailHampers(Request $request, Produk $produk)
    {
        $request->validate([
            'hampers' => 'required|array',
            'hampers.*.id_produk' => 'required|integer',
            'hampers.*.qty' => 'required|integer',
        ]);

        if ($produk->id_kategori != 5) {
            throw ValidationException::withMessages([
                'id_kategori' => 'Produk ini bukan hampers',
            ]);
        }

        $dataSemuaPH = [];
        $idProdukHampers = [];
        foreach ($request->input('hampers') as $detailHampers) {
            if ($produk->id == $detailHampers['id_produk']) {
                throw ValidationException::withMessages([
                    'id_produk' => 'Rekursi bjirr 🗿🗿🗿',
                ]);
            }
            // Cari dulu, apakah sudah ada hampers ini: kalau sudah ada, update qty, kalau belum ada, create
            $produkHampers = DetailHamper::where('id_hampers', $produk->id)
                ->where('id_produk', $detailHampers['id_produk'])
                ->first();
            if ($produkHampers == null) {
                $produkHampers = new DetailHamper([
                    'id_produk' => $detailHampers['id_produk'],
                    'id_hampers' => $produk->id,
                    'qty' => $detailHampers['qty'],
                ]);
                $produkHampers->save();
            } else {
                $produkHampers->qty = $detailHampers['qty'];
                $produkHampers->update();
            }

            $dataSemuaPH[] = $produkHampers;
            $idProdukHampers[] = $produkHampers->id;
        }

        // Hapus detail hampers yang tidak ada di request
        DetailHamper::whereRaw("id_hampers = $produk->id AND id NOT IN (" . implode(",", $idProdukHampers) . ")")->delete();

        return new ApiResponse($dataSemuaPH, "Berhasil menambahkan detail hampers untuk produk " . $produk->nama);
    }

    public function gantiPenitip(Request $request, Produk $produk)
    {
        $request->validate([
            'id_penitip' => 'required|integer'
        ]);

        if ($produk->id_kategori != 4) {
            throw ValidationException::withMessages([
                'id_kategori' => 'Produk ini bukan titipan',
            ]);
        }

        $produk->id_penitip = $request->input('id_penitip');
        $produk->update();

        return new ApiResponse($produk, "Berhasil mengganti penitip produk " . $produk->nama);
    }

    /**
     * Get list stok produk & kuota harian
     */
    public function getStokDanKuota(Request $request) {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
            'tanggal' => 'nullable|date'
        ]);

        $tanggal = $request->input('tanggal', date('Y-m-d'));

        $produks = Produk::with(['kategori_produk']);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $produks->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $produks->orderBy($sort);
        }

        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $produks = $produks->paginate($size, ['*'], 'page', $page);

        // for each produk, hitung stok dan kuota harian
        $produks->getCollection()->transform(function ($produk) use ($tanggal) {
            $stok = null;
            $kuota = null;

            if ($produk->id_kategori != 4 && $produk->id_kategori != 5) {
                // Get sisa kuota yang tersedia
                $PPH = PemesananProdukHarian::where('id_produk', $produk->id)
                    ->where('tanggal', $tanggal)
                    ->first();
                if ($PPH == null) {
                    $kuota = $produk->kuota_harian;
                } else {
                    $kuota = $PPH->kuota_hari_ini - $PPH->jumlah_dipesan;
                }
            } else {
                // Get stok ready
                $stok = $produk->stok_ready;
            }

            // $produks->items()[$key] = [
            //     'produk' => $produk,
            //     'stok' => $stok,
            //     'kuota' => $kuota
            // ];
            return [
                'produk' => $produk,
                'stok' => $stok,
                'kuota' => $kuota
            ];
        });

        return new ApiResponse($produks, "Berhasil menampilkan stok produk");
    }
}
