import {
  Button,
  Card,
  CardBody,
  CardHeader,
  Input,
} from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import Table from "../../../../ui/Table";
import {
  getListTransaksiTerlambat,
  BulkCancelTransaksi,
} from "../../../../api/ApiSistem";
import { useSearchParams } from "react-router-dom";
import Pagination from "../../../../ui/Pagination";
import { toast } from "sonner";
import KonfirmasiDialog from "../../../../ui/KonfirmasiDialog";
import SistemBatalRow from "./SistemBatalRow";

function SistemBatal() {
  const [data, setData] = useState([]);
  const [totalData, setTotalData] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const page = !searchParams.get("page") ? 1 : Number(searchParams.get("page"));
  const search = !searchParams.get("search") ? "" : searchParams.get("search");
  const [open, setOpen] = useState(false);
  const handleOpen = () => {
    setOpen(!open);
  };
  const [openKonfirmasi, setOpenKonfirmasi] = useState(false);
  const handleOpenKonfirmasi = () => {
    setOpenKonfirmasi(!openKonfirmasi);
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };

  const fetchData = (page, search) => {
    setIsLoading(true);
    getListTransaksiTerlambat(page, search)
      .then((res) => {
        setData(res.data);
        console.log(res);
        setTotalData(res.total);
        setIsLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };
  useEffect(() => {
    fetchData(page, search);
  }, [page, search]);

  useEffect(() => {
    searchParams.set("page", 1);
    setSearchParams(searchParams);
  }, [search]);

  const konfirmasiPesan = () => {
    setIsProcessing(true);
    BulkCancelTransaksi()
      .then((res) => {
        console.log(res);
        toast.success(res.message);
        fetchData(page, search);
        handleOpenKonfirmasi();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
        handleOpenKonfirmasi();
      });
  };
  return (
    <>
      <div className="w-full">
        <Card>
          <CardHeader floated={false} shadow={false}>
            <h1 className="text-2xl font-semibold text-gray-800 mb-4">
              Data Pesanan diProses
            </h1>
          </CardHeader>
          <CardBody>
            <div className="flex justify-between items-center mb-4">
              <div className="w-full md:w-72">
                <Input label="Search" type="search" onChange={handleSearch} />
              </div>
              <Button
                className="bg-pink-primary"
                onClick={handleOpenKonfirmasi}
              >
                Bulk Cancel
              </Button>
            </div>
            <Table columns="grid-cols-[2fr,2fr,2fr,2fr,2fr,1fr]">
              <Table.Header>
                <div>No Nota</div>
                <div>Jenis Pengiriman</div>
                <div>Status</div>
                <div>Tanggap Siap</div>
                <div>Total Harga</div>
                <div>Tip</div>
              </Table.Header>
              <Table.Body
                data={data}
                isLoading={isLoading}
                render={(item) => (
                  <SistemBatalRow key={item.name} item={item} />
                )}
              />
              <Table.Footer>
                <Pagination count={totalData} />
              </Table.Footer>
            </Table>
          </CardBody>
        </Card>
      </div>

      <KonfirmasiDialog
        handleAdd={() => konfirmasiPesan()}
        handleOpen={handleOpen}
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        isProcessing={isProcessing}
        openKonfirmasi={openKonfirmasi}
        konfirmasi={"Menghapus"}
      />
    </>
  );
}

export default SistemBatal;
