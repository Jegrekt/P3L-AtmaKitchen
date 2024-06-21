import {
  Button,
  Dialog,
  DialogFooter,
  DialogHeader,
  Input,
} from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import Table from "../../../../ui/Table";
import {
  getListSedangDiProses,
  updateStatusDiproses,
} from "../../../../api/ApiKonfirmasiAdmin";
import { useSearchParams } from "react-router-dom";
import Pagination from "../../../../ui/Pagination";

import { toast } from "sonner";
import KonfirmasiDialog from "../../../../ui/KonfirmasiDialog";
import KonfirmasiSiapRow from "./KonfirmasiSiapRow";
function KonfirmasiSiap() {
  const [data, setData] = useState([]);
  const [totalData, setTotalData] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const [id, setId] = useState(0);
  const page = !searchParams.get("page") ? 1 : Number(searchParams.get("page"));
  const search = !searchParams.get("search") ? "" : searchParams.get("search");
  const [open, setOpen] = useState(false);
  const handleOpen = (id) => {
    setOpen(!open);
    if (id) setId(id);
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
    getListSedangDiProses(page, search)
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
    updateStatusDiproses(id)
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
        <div className="flex w-full justify-between mb-4">
          <h1 className="text-2xl font-semibold text-gray-800 mb-4">
            Data Pesanan diProses
          </h1>
          <div className="w-full md:w-72">
            <Input label="Search" type="search" onChange={handleSearch} />
          </div>
        </div>
        <Table columns="grid-cols-[2fr,2fr,2fr,2fr,2fr,2fr,3.2rem]">
          <Table.Header>
            <div>No Nota</div>
            <div>Jenis Pengiriman</div>
            <div>Tanggap Siap</div>
            <div>Status</div>
            <div>Total Harga</div>
            <div>Tip</div>
            <div></div>
          </Table.Header>
          <Table.Body
            data={data}
            isLoading={isLoading}
            render={(item) => (
              <KonfirmasiSiapRow
                key={item.name}
                item={item}
                handleOpen={handleOpen}
              />
            )}
          />
          <Table.Footer>
            <Pagination count={totalData} />
          </Table.Footer>
        </Table>
      </div>
      <Dialog
        open={open}
        size="sm"
        handler={handleOpen}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>Konfirmasi Pemesanan</DialogHeader>
        <DialogFooter className="pt-0">
          <Button
            className="bg-pink-primary w-40"
            onClick={() => {
              handleOpenKonfirmasi();
            }}
          >
            <span>Update Status</span>
          </Button>
        </DialogFooter>
      </Dialog>
      <KonfirmasiDialog
        handleAdd={() => konfirmasiPesan()}
        handleOpen={handleOpen}
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        isProcessing={isProcessing}
        openKonfirmasi={openKonfirmasi}
        konfirmasi={"Mengkonfirmasi"}
      />
    </>
  );
}

export default KonfirmasiSiap;
