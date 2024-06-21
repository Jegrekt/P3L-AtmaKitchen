import React from "react";
import "./App.css";

import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Login from "./page/Login";
import Register from "./page/Register";
import { Toaster } from "sonner";
import Sidebar from "./ui/sidebar_pegawai/Sidebar";
import ProdukView from "./page/pegawai/admin/produk/ProdukView";
import BahanBakuView from "./page/pegawai/admin/bahan_baku/BahanBakuView";
import ChangePassword from "./page/ChangePassword";
import KaryawanView from "./page/pegawai/mo/karyawan/KaryawanView";
import PenitipView from "./page/pegawai/mo/penitip/PenitipView";
import GajiView from "./page/pegawai/owner/gaji/GajiView";
import ProdukDetail from "./page/pegawai/admin/produk/ProdukDetail";
import ProdukAdd from "./page/pegawai/admin/produk/ProdukAdd";
import PembelianBahanBakuView from "./page/pegawai/mo/pembelian_bahan_baku/PembelianBahanBakuView";
import HeaderCustomer from "./ui/sidebar_customer/HeaderCustomer";
import Pemesanan from "./page/customer/pemesanan/Pemesanan";
import ProfilCustomer from "./ui/sidebar_customer/ProfilCustomer";
import ProfilCustomerView from "./page/customer/profil/ProfilCustomerView";
import PengeluaranLainView from "./page/pegawai/mo/pengeluaran_lain/PengeluaranLainView";
import DataCustomer from "./page/pegawai/admin/data_ customer/DataCustomer";
import CutomerHistoryPenjualan from "./page/pegawai/admin/data_ customer/CutomerHistoryPenjualan";
import AddPembelianBahanBaku from "./page/pegawai/mo/pembelian_bahan_baku/AddPembelianBahanBaku";
import ViewPemesanan from "./page/customer/pemesanan/ViewPemesanan";
import PendingView from "./page/customer/pending_pembayaran/PendingView";
import Index from "./page/Index";
import NavbarUmum from "./ui/navbar_umum/NavbarUmum";
import LandingPage from "./page/umum/LandingPage";
import PengirimanAdminView from "./page/pegawai/admin/pengiriman/PengirimanAdminView";
import PembayaranAdminView from "./page/pegawai/admin/pembayaran/PembayaranAdminView";
import Konfirmasi from "./page/pegawai/mo/konfirmasi/Konfirmasi";
import ListBahanBaku from "./page/pegawai/mo/list_bahan_baku/ListBahanBaku";
import KonfirmasiProsesView from "./page/pegawai/mo/konfirmasi_proses/KonfirmasiProsesView";
import KonfirmasiSiap from "./page/pegawai/admin/konfirmasi_siap/KonfirmasiSiap";
import KonfirmasiAkhir from "./page/pegawai/admin/konfirmasi_akhir/KonfirmasiAkhir";
import KonfirmasiCustomer from "./page/customer/konfirmasi_customer/KonfirmasiCustomer";
import KonfirmasiSaldo from "./page/pegawai/admin/konfirmasi_saldo/KonfirmasiSaldo";
import SistemBatal from "./page/pegawai/admin/sistem_batal/SistemBatal";
import Laporan from "./page/pegawai/laporan/Laporan";
import LaporanPenjualanPerbulan from "./page/pegawai/laporan/laporan_penjualan_perbulan/LaporanPenjualanPerbulan";
import LaporanPenjualanPerProduk from "./page/pegawai/laporan/laporan_penjualan_perproduk/LaporanPenjualanPerProduk";
import LaporanPenggunaanBahanBaku from "./page/pegawai/laporan/laporan_penggunaan_bahan_baku/LaporanPenggunaanBahanBaku";
import LaporanPresensiDanGaji from "./page/pegawai/laporan/laporan_presensi_dan_gaji/LaporanPresensiDanGaji";
import LaporanPemasukanDanPengeluaran from "./page/pegawai/laporan/laporan_pemasukan_dan_pengeluaran/LaporanPemasukanDanPengeluaran";
import LaporanStokBahanBaku from "./page/pegawai/laporan/laporan_stok_bahan_baku/LaporanStokBahanBaku";
import LaporanPenitip from "./page/pegawai/laporan/laporan_penitip/LaporanPenitip";
function App() {
  return (
    <div>
      <Toaster position="top-right" richColors expand={true} />
      <Router>
        <Routes>
          <Route path="/*" element={<Index />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/reset-password" element={<ChangePassword />} />
          <Route element={<NavbarUmum />}>
            <Route path="/Umum" element={<LandingPage />} />
          </Route>
          <Route element={<Sidebar />}>
            {/* Role ADMIN */}
            <Route path="produk" element={<ProdukView />} />
            <Route path="add-produk" element={<ProdukAdd />} />
            <Route path="produk/:produkId" element={<ProdukDetail />} />
            <Route path="bahan-baku" element={<BahanBakuView />} />
            <Route path="data-customer" element={<DataCustomer />} />
            <Route path="sistem-batal" element={<SistemBatal />} />
            <Route
              path="data-customer/history/:idCustomer"
              element={<CutomerHistoryPenjualan />}
            />
            <Route path="pengiriman-admin" element={<PengirimanAdminView />} />
            <Route path="konfirmasi-siap" element={<KonfirmasiSiap />} />
            <Route path="konfirmasi-akhir" element={<KonfirmasiAkhir />} />
            <Route path="konfirmasi-saldo" element={<KonfirmasiSaldo />} />
            {/* Role MO */}
            <Route path="karyawan" element={<KaryawanView />} />
            <Route path="penitip" element={<PenitipView />} />
            <Route
              path="pembelian-bahan-baku"
              element={<PembelianBahanBakuView />}
            />
            <Route
              path="add-pembelian-bahan/:idPBB"
              element={<AddPembelianBahanBaku />}
            />
            <Route path="pengeluaran-lain" element={<PengeluaranLainView />} />
            <Route path="Konfirmasi-mo" element={<Konfirmasi />} />
            <Route
              path="konfirmasi-proses"
              element={<KonfirmasiProsesView />}
            />
            <Route path="list-bahan-baku" element={<ListBahanBaku />} />
            {/* Role Owner */}
            <Route path="gaji" element={<GajiView />} />
            <Route
              path="pending-pembayaran"
              element={<PembayaranAdminView />}
            />

            {/* Laporan */}
            <Route path="laporan" element={<Laporan />} />
            <Route
              path="laporan-penjualan-perbulan"
              element={<LaporanPenjualanPerbulan />}
            />
            <Route
              path="laporan-penjualan-perproduk"
              element={<LaporanPenjualanPerProduk />}
            />
            <Route
              path="laporan-stok-bahan-baku"
              element={<LaporanStokBahanBaku />}
            />
            <Route
              path="laporan-penggunaan-bahan-baku"
              element={<LaporanPenggunaanBahanBaku />}
            />
            <Route
              path="laporan-presensi-dan-gaji"
              element={<LaporanPresensiDanGaji />}
            />
            <Route
              path="laporan-pemasukan-dan-pengeluaran"
              element={<LaporanPemasukanDanPengeluaran />}
            />
            <Route path="laporan-penitip" element={<LaporanPenitip />} />
          </Route>

          {/* Route Customer */}
          <Route element={<HeaderCustomer />}>
            <Route path="pemesanan" element={<Pemesanan />} />
            <Route path="view-pemesanan/:id" element={<ViewPemesanan />} />
            <Route path="profil" element={<ProfilCustomerView />} />
            <Route
              path="konfirmasi-customer"
              element={<KonfirmasiCustomer />}
            />
            <Route
              path="pending-pembayaran-customer"
              element={<PendingView />}
            />
          </Route>
        </Routes>
      </Router>
    </div>
  );
}

export default App;
