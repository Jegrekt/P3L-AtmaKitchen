import { Button, Card, CardBody, Spinner } from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import Table from "../../../../ui/Table";
import ButtonBack from "../../../../ui/ButtonBack";
import { getLaporanPenjualanPerBulan } from "../../../../api/ApiLaporan";
import LPPRow from "./LPPRow";
import { setDate } from "../../../../utils/setDate";
import { rupiah } from "../../../../utils/rupiah";
import {
  BarChart,
  Bar,
  Rectangle,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";
function LaporanPenjualanPerbulan() {
  const [data, setData] = useState([]);
  const thisYear = new Date().getFullYear();
  const [loading, setLoading] = useState(false);
  const [year, setYear] = useState(thisYear);
  const currentYear = new Date().getFullYear();
  const startYear = currentYear - 6;

  const today = new Date();

  const years = [];
  for (let i = startYear; i <= thisYear; i++) {
    years.push(i);
  }

  const fetchData = () => {
    setLoading(true);
    getLaporanPenjualanPerBulan(year)
      .then((res) => {
        setData(res.data);
        console.log(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  };

  useEffect(() => {
    fetchData();
  }, [year]);

  const dataDummy = [
    {
      name: "Page A",
      uv: 4000,
      pv: 2400,
      amt: 2400,
    },
    {
      name: "Page B",
      uv: 3000,
      pv: 1398,
      amt: 2210,
    },
    {
      name: "Page C",
      uv: 2000,
      pv: 9800,
      amt: 2290,
    },
    {
      name: "Page D",
      uv: 2780,
      pv: 3908,
      amt: 2000,
    },
    {
      name: "Page E",
      uv: 1890,
      pv: 4800,
      amt: 2181,
    },
    {
      name: "Page F",
      uv: 2390,
      pv: 3800,
      amt: 2500,
    },
    {
      name: "Page G",
      uv: 3490,
      pv: 4300,
      amt: 2100,
    },
  ];

  const label = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];
  return (
    <div className="">
      <div className="flex justify-between items-center">
        <div className="flex gap-4">
          <ButtonBack />
          <h1 className="text-2xl font-semibold text-pink-primary uppercase print:hidden">
            Laporan Penjualan per-Bulan
          </h1>
        </div>
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
            <h1 className="text-xl font-semibold text-black mt-6 underline">
              LAPORAN PENJUALAN BULANAN
            </h1>
            <p>
              Tahun : <span>{year}</span>
            </p>
            <p className="mb-2">
              Tanggal cetak : <span>{setDate(today)}</span>
            </p>
            <Table columns="grid-cols-[2fr,2fr,2fr]">
              <Table.Header>
                <div>Bulan</div>
                <div>Jumlah Transaksi</div>
                <div>Jumlah Uang</div>
              </Table.Header>

              <Table.Body
                data={data}
                render={(item) => <LPPRow key={item.bulan} item={item} />}
              />
            </Table>
            <div className="flex justify-between mt-4">
              <p className="text-right font-medium">Total : </p>
              <p className="">
                {rupiah(data.reduce((acc, item) => acc + item.jumlah_uang, 0))}
              </p>
            </div>
            <div className="w-full h-[500px]">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart
                  data={data}
                  margin={{
                    top: 5,
                    right: 30,
                    left: 20,
                    bottom: 5,
                  }}
                >
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis
                    dataKey="bulan"
                    tickFormatter={(value) => label[value - 1].slice(0, 3)}
                  />
                  {/* <YAxis /> */}
                  <Tooltip labelFormatter={(value) => label[value - 1]} />
                  <Legend />
                  <Bar
                    name={"Jumlah Uang"}
                    dataKey="jumlah_uang"
                    fill="#8884d8"
                    activeBar={<Rectangle fill="pink" stroke="blue" />}
                  />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </CardBody>
        </Card>
      )}
    </div>
  );
}

export default LaporanPenjualanPerbulan;
