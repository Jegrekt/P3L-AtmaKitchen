import React, { useEffect, useState } from "react";
import {
  Button,
  Card,
  CardBody,
  Spinner,
  Input,
} from "@material-tailwind/react";
import { getLaporanPenggunaanBahanBaku } from "../../../../api/ApiLaporan";
import ButtonBack from "../../../../ui/ButtonBack";
import Table from "../../../../ui/Table";
import LPBBRow from "./LPBBRow";
import { setDate } from "../../../../utils/setDate";
const getFirstDayOfCurrentMonth = () => {
  const date = new Date();
  var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
  const formattedDate = firstDay.toISOString().split("T")[0];

  return formattedDate;
};

const getLastDayOfCurrentMonth = () => {
  const now = new Date();
  const date = new Date(now.getFullYear(), now.getMonth() + 1, 0);
  const formattedDate = date.toISOString().split("T")[0];

  return formattedDate;
};

function LaporanPenggunaanBahanBaku() {
  const [data, setData] = useState([]);
  const [startDate, setStartDate] = useState(getFirstDayOfCurrentMonth());
  const [endDate, setEndDate] = useState(getLastDayOfCurrentMonth());
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    getLaporanPenggunaanBahanBaku(startDate, endDate)
      .then((res) => {
        setData(res);
        console.log(res);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  }, [startDate, endDate]);

  return (
    <div>
      <div className="flex justify-between items-center">
        <div className="flex gap-4">
          <ButtonBack />
          <h1 className="text-2xl font-semibold text-pink-primary uppercase print:hidden">
            Laporan penggunaan bahan baku per-periode tertentu
          </h1>
        </div>
        <div className="flex gap-4">
          <Input
            label="Tanggal Awal"
            type="date"
            value={startDate}
            onChange={(e) => setStartDate(e.target.value)}
            className="border border-black/30 active:border-black focus:border-black  rounded-lg p-2 mb-2  print:hidden"
          />
          <Input
            label="Tanggal Akhir"
            type="date"
            value={endDate}
            onChange={(e) => setEndDate(e.target.value)}
            className="border border-black/30 active:border-black focus:border-black  rounded-lg p-2 mb-2 print:hidden"
          />
        </div>
      </div>
      <hr className="border-2 my-4 border-pink-secondary print:hidden" />
      {loading ? (
        <div className="col-span-3 flex justify-center items-center">
          <Spinner color="red" className="h-16 w-16 text-pink-primary" />
        </div>
      ) : (
        <Card className="max-w-4xl mx-auto mt-10 print:shadow-none print:bg-transparent print:mt-0 LPP">
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
              LAPORAN Penggunaan Bahan Baku
            </h1>
            <p>
              Periode : {setDate(startDate)} - {setDate(endDate)}
            </p>
            <p className="mb-2">
              Tanggal cetak : <span>{setDate(new Date())}</span>
            </p>
            <Table columns="grid-cols-[2fr,2fr,2fr]">
              <Table.Header>
                <div>Nama Bahan</div>
                <div>Satuan</div>
                <div>Digunakan</div>
              </Table.Header>

              <Table.Body
                data={data}
                render={(item) => <LPBBRow key={item.nama_bahan} item={item} />}
              />
            </Table>
          </CardBody>
        </Card>
      )}
    </div>
  );
}

export default LaporanPenggunaanBahanBaku;
