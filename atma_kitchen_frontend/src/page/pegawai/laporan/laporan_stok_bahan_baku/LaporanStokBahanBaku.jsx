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
import { getLaporanStokBahanBaku } from "../../../../api/ApiLaporan";
import { setDate, toDateInputValue } from "../../../../utils/setDate";
import PSBKRow from "./PSBKRow";

function LaporanStokBahanBaku() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const currentDate = new Date();
  const thisYear = currentDate.getFullYear();
  const thisMonth = String(currentDate.getMonth() + 1).padStart(2, "0");

  const [dateInput, setDateInput] = useState(`${thisYear}-${thisMonth}`);
  const currentYear = new Date().getFullYear();
  const startYear = currentYear - 6;
  const today = new Date();

  const years = [];
  for (let i = startYear; i <= thisYear; i++) {
    years.push(i);
  }

  const fetchData = () => {
    setLoading(true);

    const [year, month] = dateInput.split("-");
    console.log(year + "-" + month);
    getLaporanStokBahanBaku()
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
  }, []);
  return (
    <div className="">
      <div className="flex justify-between items-center">
        <div className="flex gap-4">
          <ButtonBack />
          <h1 className="text-2xl font-semibold text-pink-primary uppercase print:hidden">
            Laporan Stok Bahan Baku
          </h1>
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
              LAPORAN Penggunaan Bahan Baku
            </h1>
            <p className="mb-2">
              Tanggal cetak : <span>{setDate(today)}</span>
            </p>
            <Table columns="grid-cols-[3fr,1fr,1fr]">
              <Table.Header>
                <div>Nama Bahan</div>
                <div>Satuan</div>
                <div>Stok</div>
              </Table.Header>
              <Table.Body
                data={data}
                render={(item) => <PSBKRow key={item.bulan} item={item} />}
              />
            </Table>
          </CardBody>
        </Card>
      )}
    </div>
  );
}

export default LaporanStokBahanBaku;
