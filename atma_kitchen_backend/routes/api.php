<?php

use App\Http\Controllers\AlamatController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BahanBakuController;
use App\Http\Controllers\CustomerDataController;
use App\Http\Controllers\HistorySaldoController;
use App\Http\Controllers\KetidakhadiranController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\PBBController;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\PenitipController;
use App\Http\Controllers\PenjualanController;
use App\Http\Controllers\PLLController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\PromoPoinController;
use App\Http\Controllers\ResepController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Data Publik
Route::get('/produk/stok-kuota', [ProdukController::class, 'getStokDanKuota']);

// Data Tidak Publik
Route::group(['middleware' => ['auth:sanctum']], function () {
    // ALL ROLES
    Route::get('/user', function (Request $request) {
        return $request->user()->load('pegawai', 'customer');
    });

    // Customer
    Route::prefix('customer')->middleware('ability:c')->group(function () {
        Route::get('/profile', [CustomerDataController::class, 'showProfile']);
        Route::put('/profile', [CustomerDataController::class, 'updateProfile']);
        Route::get('/history', [CustomerDataController::class, 'showHistoryPesanan4Customer']);
    });

    Route::post('change-password', [AuthController::class, 'changePassword']);
    Route::delete('/logout', [AuthController::class, 'logout']);

    Route::apiResource('promo-poin', PromoPoinController::class)->middleware('ability:adm');

    Route::apiResource('produk', ProdukController::class)->middleware('ability:adm');
    Route::apiResource('produk.resep', ResepController::class)->middleware('ability:adm');
    Route::prefix('produk/{produk}')->group(function () {
        Route::post('foto', [ProdukController::class, 'gantiFoto'])->middleware('ability:adm');
        Route::put('resep', [ResepController::class, 'storeAll'])->middleware('ability:adm');
        Route::put('hampers', [ProdukController::class, 'storeAllDetailHampers'])->middleware('ability:adm');
        Route::put('penitip', [ProdukController::class, 'gantiPenitip'])->middleware('ability:adm');
    });
    Route::prefix('bahan-baku')->group(function () {
        Route::get('/', [BahanBakuController::class, 'index'])->middleware('ability:adm,mo'); // [+] MO
        Route::post('/', [BahanBakuController::class, 'store'])->middleware('ability:adm');
        Route::get('/{bahanBaku}', [BahanBakuController::class, 'show'])->middleware('ability:adm,mo'); // [+] MO
        Route::put('/{bahanBaku}', [BahanBakuController::class, 'update'])->middleware('ability:adm');
        Route::delete('/{bahanBaku}', [BahanBakuController::class, 'destroy'])->middleware('ability:adm');
    });
    // Route::apiResource('bahan-baku', BahanBakuController::class)->middleware('ability:adm');

    Route::prefix('pegawai')->group(function () {
        Route::get('/', [PegawaiController::class, 'index'])->middleware('ability:mo,own'); // [+] Owner
        Route::post('/', [PegawaiController::class, 'store'])->middleware('ability:mo');
        Route::get('/{pegawai}', [PegawaiController::class, 'show'])->middleware('ability:mo,own'); // [+] Owner
        Route::put('/{pegawai}', [PegawaiController::class, 'update'])->middleware('ability:mo');
        Route::delete('/{pegawai}', [PegawaiController::class, 'destroy'])->middleware('ability:mo');
    });

    Route::prefix('penitip')->group(function () {
        Route::get('/', [PenitipController::class, 'index'])->middleware('ability:mo,adm'); // [+] Admin
        Route::post('/', [PenitipController::class, 'store'])->middleware('ability:mo');
        Route::get('/{penitip}', [PenitipController::class, 'show'])->middleware('ability:mo,adm'); // [+] Admin
        Route::put('/{penitip}', [PenitipController::class, 'update'])->middleware('ability:mo');
        Route::delete('/{penitip}', [PenitipController::class, 'destroy'])->middleware('ability:mo');
    });

    Route::apiResource('pbb', PBBController::class)->middleware('ability:mo');
    Route::apiResource('pll', PLLController::class)->middleware('ability:mo');

    Route::prefix('alamat')->group(function () {
        Route::get('/', [AlamatController::class, 'index'])->middleware('ability:c,adm');
        // Route::post('/', [AlamatController::class, 'store'])->middleware('ability:c,adm');
        // Route::get('/{alamat}', [AlamatController::class, 'show'])->middleware('ability:c');
        // Route::put('/{alamat}', [AlamatController::class, 'update'])->middleware('ability:c');
        // Route::delete('/{alamat}', [AlamatController::class, 'destroy'])->middleware('ability:c');
    });

    Route::prefix('customer')->group(function () {
        Route::get('/', [CustomerDataController::class, 'index'])->middleware('ability:adm');
        Route::get('/{customer}', [CustomerDataController::class, 'show'])->middleware('ability:adm');
        Route::get('/history/{customer}', [CustomerDataController::class, 'showHistoryPesanan4Pegawai'])->middleware('ability:adm');
    });

    Route::prefix('absensi')->group(function () {
        Route::get('/', [KetidakhadiranController::class, 'index'])->middleware('ability:mo');
        Route::post('/', [KetidakhadiranController::class, 'store'])->middleware('ability:mo');
        Route::delete('/{absensi}', [KetidakhadiranController::class, 'destroy'])->middleware('ability:mo');
    });

    Route::post('/pegawai/update-gaji/{jabatan}', [PegawaiController::class, 'updateGajiJabatan'])->middleware('ability:own');
    Route::post('/pegawai/update-bonus/{pegawai}', [PegawaiController::class, 'updateBonusKaryawan'])->middleware('ability:own');

    Route::prefix('penjualan')->group(function () {
        Route::post('/', [PenjualanController::class, 'buatPemesanan'])->middleware('ability:c');
        Route::get('/view/{trxPenjualan}', [PenjualanController::class, 'show'])->middleware('ability:c,mo,adm');

        Route::get('/pending-ongkir', [PenjualanController::class, 'listMenungguOngkosKirim'])->middleware('ability:adm');
        Route::put('/input-jarak/{alamat}', [PenjualanController::class, 'inputJarakPengiriman'])->middleware('ability:adm');

        Route::get('/pending-pembayaran', [PenjualanController::class, 'listMenungguPembayaran'])->middleware('ability:c');
        Route::post('/bukti-pembayaran/{trxPenjualan}', [PenjualanController::class, 'sendBuktiPembayaran'])->middleware('ability:c');

        Route::get('/pending-konfirmasi-pembayaran', [PenjualanController::class, 'listMenungguKonfirmasiPembayaran'])->middleware('ability:adm');
        Route::put('/konfirmasi-pembayaran/{trxPenjualan}', [PenjualanController::class, 'konfirmasiPembayaran'])->middleware('ability:adm');

        Route::get('/pending-konfirmasi-pembuatan', [PenjualanController::class, 'listMenungguKonfirmasiPembuatan'])->middleware('ability:mo');
        Route::put('/konfirmasi-pesanan/{trxPenjualan}', [PenjualanController::class, 'konfirmasiPesanan'])->middleware('ability:mo');
        Route::get('/bahan-baku/{trxPenjualan}', [PenjualanController::class, 'getListBahanBaku'])->middleware('ability:mo');

        Route::get('/proses-hari-ini', [PenjualanController::class, 'listPemrosesanHariIni'])->middleware('ability:mo');
        Route::put('/proses/{trxPenjualan}', [PenjualanController::class, 'prosesPemesanan'])->middleware('ability:mo');

        Route::get('/sedang-diproses', [PenjualanController::class, 'listPesananDiproses'])->middleware('ability:adm');
        Route::put('/update-status-proses/{trxPenjualan}', [PenjualanController::class, 'updateStatusPengiriman'])->middleware('ability:adm');

        Route::get('/siap-dipu', [PenjualanController::class, 'listPesananSiapDipickup'])->middleware('ability:adm');
        Route::put('/update-status-diambil/{trxPenjualan}', [PenjualanController::class, 'updateStatusPesananDiambilCustomer'])->middleware('ability:adm');

        Route::get('/sedang-dikirim', [PenjualanController::class, 'listPesananSudahDipickupAtauSudahDikirim'])->middleware('ability:c');
        Route::put('/konfirmasi-penerimaan/{trxPenjualan}', [PenjualanController::class, 'konfirmasiPenerimaanPesanan'])->middleware('ability:c');

        Route::get('/terlambat-bayar', [PenjualanController::class, 'listPesananTerlambatBayar'])->middleware('ability:adm');
        Route::post('/autocancel', [PenjualanController::class, 'autoCancelPesanan'])->middleware('ability:adm');
    });

    Route::prefix('history-saldo')->group(function () {
        Route::get('/admin', [HistorySaldoController::class, 'listAdmin'])->middleware('ability:adm');
        Route::put('/approve/{historySaldo}', [HistorySaldoController::class, 'approvePenarikanSaldo'])->middleware('ability:adm');

        Route::get('/customer', [HistorySaldoController::class, 'listCustomer'])->middleware('ability:c');
        Route::post('/ajukan-penarikan', [HistorySaldoController::class, 'requestPenarikanSaldo'])->middleware('ability:c');
    });

    Route::prefix('laporan')->group(function () {
        Route::get('/penjualan-bulanan', [LaporanController::class, 'laporanPenjualanBulanan']);
        Route::get('/per-produk', [LaporanController::class, 'laporanPenjualanBulananPerProduk']);
        Route::get('/stok-bahan-baku', [LaporanController::class, 'laporanStokBahanBaku']);
        Route::get('/penggunaan-bahan-baku', [LaporanController::class, 'laporanPenggunaanBahanBaku']);
        Route::get('/presensi-karyawan', [LaporanController::class, 'laporanPresensiKaryawan']);
        Route::get('/pemasukan-pengeluaran', [LaporanController::class, 'laporanPemasukanPengeluaran']);
        Route::get('/transaksi-penitip', [LaporanController::class, 'laporanTransaksiPenitip']);
    })->middleware('ability:own,mo');

    Route::prefix('notif')->group(function () {
        Route::post('/register-device', [AlamatController::class, 'registerDevice']);
        Route::post('/send', [AlamatController::class, 'testSendNotif']);
    })->middleware('ability:c');
});

// Password reset
Route::post('/forgot-password', [AuthController::class, 'sendPasswordReset']);
Route::post('/reset-password', [AuthController::class, 'resetPassword']);

Route::post('/login', [AuthController::class, 'login']);
Route::post("/register", [AuthController::class, 'register']);