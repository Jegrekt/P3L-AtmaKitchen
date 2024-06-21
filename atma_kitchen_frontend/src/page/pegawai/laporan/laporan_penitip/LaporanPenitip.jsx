import React, { useEffect, useState } from "react";
import { Button, Card, CardBody, Spinner } from "@material-tailwind/react";
import { getLaporanPenitip } from "../../../../api/ApiLaporan";
import Table from "../../../../ui/Table";
import ButtonBack from "../../../../ui/ButtonBack";
import LPRow from "./LPRow";
import { setDate } from "../../../../utils/setDate";
import { monthNames } from "../../../../utils/Constants";
import { rupiah } from "../../../../utils/rupiah";
function LaporanPenitip() {
  const currentYear = new Date().getFullYear();
  const startYear = currentYear - 6;
  const currentMonth = new Date().getMonth() + 1;

  const [data, setData] = useState([]);
  const [month, setMonth] = useState(currentMonth);
  const [year, setYear] = useState(currentYear);
  const [loading, setLoading] = useState(false);

  const years = [];
  for (let i = startYear; i <= currentYear; i++) {
    years.push(i);
  }

  useEffect(() => {
    setLoading(true);
    getLaporanPenitip(month, year)
      .then((res) => {
        setData(res);
        console.log(res);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  }, [month, year]);

  return (
    <div>
      <div className="flex justify-between items-center">
        <div className="flex gap-4">
          <ButtonBack />
          <h1 className="text-2xl font-semibold text-pink-primary uppercase print:hidden">
            Laporan Transaksi Penitip
          </h1>
        </div>
        <div className="flex gap-4">
          <select
            defaultValue={currentYear}
            value={year}
            onChange={(e) => {
              setYear(e.target.value);
              console.log(e.target.value);
            }}
            className="w-28 border border-black/30 active:border-black focus:border-black  rounded-lg p-2 mb-2 print:hidden"
          >
            {years.map((year) => (
              <option key={year} value={year}>
                {year}
              </option>
            ))}
          </select>
          <select
            defaultValue={currentMonth}
            value={month}
            onChange={(e) => {
              setMonth(e.target.value);
              console.log(e.target.value);
            }}
            className="w-28 border border-black/30 active:border-black focus:border-black  rounded-lg p-2 mb-2 print:hidden"
          >
            {monthNames.map((month, index) => (
              <option key={index} value={index + 1}>
                {month}
              </option>
            ))}
          </select>
        </div>
      </div>
      <hr className="border-2 my-4 border-pink-secondary print:hidden" />
      {loading ? (
        <div className="col-span-3 flex justify-center items-center">
          <Spinner color="red" className="h-16 w-16 text-pink-primary" />
        </div>
      ) : (
        data.map((item) => (
          <Card
            key={item.penitip.id}
            className="max-w-4xl mx-auto mt-10 print:shadow-none print:bg-transparent print:mt-0 LPP"
          >
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
                LAPORAN TRANSAKSI PENITIP
              </h1>
              <p>ID Penitip : {item.penitip.id}</p>
              <p>Nama Penitip : {item.penitip.nama}</p>
              <p>
                Bulan : <span>{monthNames[month - 1]}</span>
              </p>
              <p>
                Tahun : <span>{year}</span>
              </p>
              <p className="mb-2">
                Tanggal cetak : <span>{setDate(new Date())}</span>
              </p>
              <Table columns="grid-cols-[2fr,1fr,2fr,2fr,2fr,2fr]">
                <Table.Header>
                  <div>Nama</div>
                  <div>Qty</div>
                  <div>Harga Jual</div>
                  <div>Total</div>
                  <div>20% Komisi</div>
                  <div>Yang Diterima</div>
                </Table.Header>

                <Table.Body
                  data={item.detail}
                  render={(item) => <LPRow key={item.nama} item={item} />}
                />
              </Table>
              <div className="flex justify-between mt-4">
                <p className="text-right font-medium">Total : </p>
                <p>
                  {rupiah(
                    item.detail.reduce(
                      (acc, item) => acc + item.yang_diterima,
                      0
                    )
                  )}
                </p>
              </div>
            </CardBody>
          </Card>
        ))
      )}
    </div>
  );
}

export default LaporanPenitip;
