import React from "react";
import {
  Card,
  CardBody,
  CardFooter,
  Typography,
  Button,
} from "@material-tailwind/react";
import CardCustom from "../../../ui/CardCustom";
function Laporan() {
  return (
    <div>
      <h1 className="text-3xl font-semibold text-pink-primary uppercase">
        Laporan - laporan
      </h1>
      <hr className="border-2 my-4 border-pink-secondary" />
      <div className="grid grid-cols-3 gap-4">
        {/* Laporan Penjualan per-Bulan */}
        <div>
          <CardCustom
            title={"Laporan Penjualan per-Bulan"}
            desc={
              "Laporan ini berisikan hasil pejualan dalam Atma Kithcen setiap perbulan"
            }
            link={"/laporan-penjualan-perbulan"}
          />
        </div>
        {/* 'Laporan penjualan bulanan per produk */}
        <div>
          <CardCustom
            title={"Laporan penjualan bulanan per-produk"}
            desc={
              "Laporan ini berisikan hasil pejualan produk per bulan perbulan"
            }
            link={"/laporan-penjualan-perproduk"}
          />
        </div>
        {/* Laporan Stok Bahan baku  */}
        <div>
          <CardCustom
            title={"Laporan stok bahan baku"}
            desc={"Laporan ini berisikan stok bahan baku hari ini"}
            link={"/laporan-stok-bahan-baku"}
          />
        </div>
        {/* Laporan penggunaan bahan baku per periode tertentu */}
        <div>
          <CardCustom
            title={"Laporan penggunaan bahan baku per periode tertentu"}
            desc={
              "Laporan ini berisikan pengunaan bahan baku pada tanggal tertentu"
            }
            link={"/laporan-penggunaan-bahan-baku"}
          />
        </div>
        {/* Laporan presensi dan gaji pegawai bulanan */}
        <div>
          <CardCustom
            title={"Laporan presensi dan gaji pegawai bulanan"}
            desc={
              "Laporan ini berisikan Hasil Presensi dan gaji berdasarkan bulan"
            }
            link={"/laporan-presensi-dan-gaji"}
          />
        </div>
        {/* Laporan yang berisi pemasukan dan pengeluaran bulanan */}
        <div>
          <CardCustom
            title={"Laporan yang berisi pemasukan dan pengeluaran bulanan"}
            desc={"Laporan Berisikan pemasukan dan pengeluaran Atma Kitchen "}
            link={"/laporan-pemasukan-dan-pengeluaran"}
          />
        </div>
        {/* Laporan rekap transaksi penitip */}
        <div>
          <CardCustom
            title={"Laporan rekap transaksi penitip"}
            desc={"Laporan berisikan hasil rekap transaksi penitipan "}
            link={"/laporan-penitip"}
          />
        </div>
      </div>
    </div>
  );
}

export default Laporan;
