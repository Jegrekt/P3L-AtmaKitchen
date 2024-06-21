import {
  Button,
  Card,
  CardBody,
  Input,
  Spinner,
} from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import Table from "../../../../ui/Table";
import ButtonBack from "../../../../ui/ButtonBack";
import { getLaporanPenjualanPerProduk } from "../../../../api/ApiLaporan";
import { setDate, toDateInputValue } from "../../../../utils/setDate";
import LPPPRow from "./LPPPRow";
import { rupiah } from "../../../../utils/rupiah";

function LaporanPenjualanPerProduk() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const currentDate = new Date();
  const thisYear = currentDate.getFullYear();
  const thisMonth = String(currentDate.getMonth() + 1).padStart(2, "0");

  const [dateInput, setDateInput] = useState(`${thisYear}-${thisMonth}`);
  const currentYear = new Date().getFullYear();
  const startYear = currentYear - 6;
  const [tahun, bulan] = dateInput.split("-");
  const today = new Date();

  const years = [];
  for (let i = startYear; i <= thisYear; i++) {
    years.push(i);
  }

  const fetchData = () => {
    setLoading(true);

    const [year, month] = dateInput.split("-");
    console.log(year + "-" + month);
    getLaporanPenjualanPerProduk(year, parseInt(month))
      .then((res) => {
        setData(res);
        console.log(res);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  };

  useEffect(() => {
    fetchData();
  }, [dateInput]);
  return (
    <div className="">
      <div className="flex justify-between items-center">
        <div className="flex gap-4">
          <ButtonBack />
          <h1 className="text-2xl font-semibold text-pink-primary uppercase print:hidden">
            Laporan Penjualan per-Produk
          </h1>
        </div>
        <div className="print:hidden">
          <Input
            label="Tanggal"
            type="month"
            value={dateInput}
            onChange={(e) => {
              setDateInput(e.target.value);
              console.log(e);
            }}
          />
        </div>
      </div>
      <hr className="border-2 my-4 border-pink-secondary print:hidden" />
      {loading ? (
        <div className="col-span-3 flex justify-center items-center">
          <Spinner color="red" className="h-16 w-16 text-pink-primary" />
        </div>
      ) : (
        <Card className="max-w-4xl mx-auto mt-10 LPP">
          <CardBody>
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-xl font-semibold text-black">
                  Atma Kitchen
                </h1>
                <p>Jl. Centralpark No. 10 Yogyakarta</p>
              </div>
              <Button
                className="bg-pink-primary print:hidden"
                onClick={() => window.print()}
              >
                Print
              </Button>
            </div>

            <h1 className="text-xl font-semibold text-black mt-10 underline">
              LAPORAN PENJUALAN BULANAN
            </h1>
            <p>
              Tahun : <span>{tahun}</span>
            </p>
            <p className="mb-2">
              Tanggal cetak : <span>{setDate(today)}</span>
            </p>
            <Table columns="grid-cols-[2fr,1fr,2fr,2fr]">
              <Table.Header>
                <div>Produk</div>
                <div>QTY</div>
                <div>Harga</div>
                <div>Jumlah Uang</div>
              </Table.Header>
              <Table.Body
                data={data}
                render={(item) => <LPPPRow key={item.bulan} item={item} />}
              />
            </Table>
            <div className="flex justify-between mt-4">
              <p className="text-right font-medium">Total : </p>
              <p className="">
                {rupiah(
                  data.reduce((acc, item) => acc + Number(item.jumlah_uang), 0)
                )}
              </p>
            </div>
          </CardBody>
        </Card>
      )}
    </div>
  );
}

export default LaporanPenjualanPerProduk;
