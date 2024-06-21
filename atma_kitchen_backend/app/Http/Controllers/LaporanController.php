<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    // https://stackoverflow.com/questions/6661530/php-multidimensional-array-search-by-value
    function searchBulan($id, $array) {
        foreach ($array as $key => $val) {
            if ($val->bulan === $id) {
                return $val;
            }
        }
        return null;
    }

    public function laporanPenjualanBulanan(Request $request)
    {
        $request->validate([
            'tahun' => 'required|integer'
        ]);

        $tahun = $request->tahun;

        $sql = DB::select("
            SELECT MONTH(tanggal_pesan) AS bulan, COUNT(*) AS jumlah_transaksi, SUM(grand_total) AS jumlah_uang FROM trx_penjualan WHERE YEAR(tanggal_pesan) = $tahun
            GROUP BY MONTH(tanggal_pesan);
        ");

        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $dataDb = $this->searchBulan($i, $sql);

            $data[] = [
                'bulan' => $i,
                'jumlah_transaksi' => $dataDb ? $dataDb->jumlah_transaksi : 0,
                'jumlah_uang' => $dataDb ? intval($dataDb->jumlah_uang) : 0
            ];

            // $data[] = [
            //     'bulan' => $i,
            //     'jumlah_transaksi' => $dataDb ? $dataDb->jumlah_transaksi : 0,
            //     'jumlah_uang' => $dataDb ? intval($dataDb->jumlah_uang) : 0
            // ];
        }

        return new ApiResponse($data);
    }

    public function laporanPenjualanBulananPerProduk(Request $request) {
        $request->validate([
            'tahun' => 'required|integer',
            'bulan' => 'required|integer|min:1|max:12'
        ]);

        $tahun = $request->tahun;
        $bulan = $request->bulan;

        $sql = DB::select("
            SELECT p.nama AS produk, SUM(dp.qty) AS kuantitas, p.harga AS harga, SUM(dp.subtotal) AS jumlah_uang FROM detail_penjualan dp
            JOIN trx_penjualan tp ON dp.id_trx_penjualan = tp.id
            JOIN produk p ON dp.id_produk = p.id
            WHERE YEAR(tp.tanggal_pesan) = $tahun AND MONTH(tp.tanggal_pesan) = $bulan
            GROUP BY p.id, p.nama, p.harga;
        ");

        return new ApiResponse($sql);
    }

    public function laporanStokBahanBaku(Request $request) {
        $sql = DB::select("
            SELECT bb.* FROM bahan_baku bb;
        ");

        return new ApiResponse($sql);
    }

    public function laporanPenggunaanBahanBaku(Request $request) {
        $request->validate([
            'tanggal_awal' => 'required|date',
            'tanggal_akhir' => 'required|date'
        ]);

        $tglAwal = $request->tanggal_awal;
        $tglAkhir = $request->tanggal_akhir;

        $sql = DB::select("
            SELECT bb.nama AS nama_bahan, bb.satuan AS satuan, SUM(tpb.qty) AS digunakan FROM trx_pemakaian_bb tpb
            JOIN bahan_baku bb ON tpb.id_bahan_baku = bb.id
            WHERE (tpb.tanggal >= '$tglAwal' AND tpb.tanggal <= '$tglAkhir')
            GROUP BY bb.id, bb.nama, bb.satuan;
        ");

        return new ApiResponse($sql);
    }

    public function laporanPresensiKaryawan(Request $request) {
        $request->validate([
            'tahun' => 'required|integer',
            'bulan' => 'required|integer|min:1|max:12'
        ]);

        $jumlahHari = date('t', strtotime("{$request->tahun}-{$request->bulan}-01"));

        $sqlKth = DB::select("
            SELECT u.name AS nama, COUNT(*) AS jumlah_bolos, r.gaji_dasar_harian AS honor_harian, p.bonus AS bonus_rajin FROM ketidakhadiran kth
            JOIN pegawai p ON kth.id_pegawai = p.id_user
            JOIN users u ON p.id_user = u.id
            JOIN roles r ON u.role = r.id
            WHERE YEAR(tanggal) = 2024 AND MONTH(tanggal) = 3
            GROUP BY kth.id_pegawai, u.name, r.gaji_dasar_harian, p.bonus;
        ");

        foreach ($sqlKth as $kth) {
            $jumlahHadir = $jumlahHari - $kth->jumlah_bolos;
            $kth->jumlah_hadir = $jumlahHadir;
            $kth->honor_harian = $jumlahHadir * $kth->honor_harian;
            if ($kth->jumlah_bolos > 4) {
                $kth->bonus_rajin = 0;
            }

            $kth->total = $kth->honor_harian + $kth->bonus_rajin;
        }

        return new ApiResponse($sqlKth);
    }

    public function laporanPemasukanPengeluaran(Request $request) {
        $request->validate([
            'tahun' => 'required|integer',
            'bulan' => 'required|integer|min:1|max:12'
        ]);

        $tahun = $request->tahun;
        $bulan = $request->bulan;

        $sqlPemasukan = DB::select("
            SELECT SUM(tp.grand_total) AS penjualan, SUM(tp.tip) AS tip FROM trx_penjualan tp
            WHERE YEAR(tp.tanggal_pesan) = $tahun AND MONTH(tp.tanggal_pesan) = $bulan;
        ");

        $gaji = $this->laporanPresensiKaryawan($request)->resource;
        $totalGaji = 0;
        foreach ($gaji as $g) {
            $totalGaji += $g->total;
        }

        $sqlBB = DB::select("
            SELECT SUM(tbb.total_harga) AS harga_bahan_baku FROM trx_pembelian_bb tbb
            WHERE YEAR(tbb.tanggal_pembelian) = $tahun AND MONTH(tbb.tanggal_pembelian) = $bulan;
        ");

        $sqlPengeluaranLain = DB::select("
            SELECT pll.nama, SUM(pll.nominal) AS nominal FROM pengeluaran_lain_lain pll
            WHERE YEAR(pll.tanggal_pengeluaran) = $tahun AND MONTH(pll.tanggal_pengeluaran) = $bulan
            GROUP BY pll.nama;
        ");

        $list = [
            [
                "nama" =>  "Penjualan",
                "pemasukan" => intval($sqlPemasukan[0]->penjualan),
                "pengeluaran" => 0
            ],
            [
                "nama" =>  "Tip",
                "pemasukan" => intval($sqlPemasukan[0]->tip),
                "pengeluaran" => 0
            ],
            [
                "nama" =>  "Gaji Karyawan",
                "pemasukan" => 0,
                "pengeluaran" => $totalGaji
            ],
            [
                "nama" =>  "Bahan Baku",
                "pemasukan" => 0,
                "pengeluaran" => intval($sqlBB[0]->harga_bahan_baku)
            ]
        ];

        foreach ($sqlPengeluaranLain as $pl) {
            $list[] = [
                "nama" => $pl->nama,
                "pemasukan" => 0,
                "pengeluaran" => intval($pl->nominal)
            ];
        }

        return new ApiResponse($list);
    }

    public function laporanTransaksiPenitip(Request $request) {
        $request->validate([
            'tahun' => 'required|integer',
            'bulan' => 'required|integer|min:1|max:12'
        ]);

        $tahun = $request->tahun;
        $bulan = $request->bulan;

        $penitip = DB::select("SELECT * FROM penitip");

        $data = [];
        foreach ($penitip as $p) {
            $sql = DB::select("
                SELECT p.nama, SUM(dp.qty) AS qty, SUM(dp.subtotal) / SUM(dp.qty) AS harga_jual, SUM(dp.subtotal) AS total, 0.2 * SUM(dp.subtotal) AS komisi, 0.8 * SUM(dp.subtotal) AS yang_diterima FROM detail_penjualan dp
                JOIN trx_penjualan tp ON dp.id_trx_penjualan = tp.id
                JOIN produk p ON dp.id_produk = p.id
                WHERE p.id_penitip = {$p->id}
                AND YEAR(tp.tanggal_pesan) = $tahun AND MONTH(tp.tanggal_pesan) = $bulan
                GROUP BY p.id, p.nama;
            ");

            $data[] = [
                'penitip' => $p,
                'detail' => $sql
            ];
        }

        return new ApiResponse($data);
    }
}
