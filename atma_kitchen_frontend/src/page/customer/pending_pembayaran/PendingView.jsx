import {
  Button,
  Card,
  CardBody,
  CardHeader,
  Dialog,
  DialogBody,
  DialogFooter,
  DialogHeader,
  Input,
} from "@material-tailwind/react";
import React, { useEffect, useRef, useState } from "react";
import Table from "../../../ui/Table";
import {
  getPendingPembayaran,
  uploadBuktiPembayaran,
} from "../../../api/ApiPendingPembayaran";
import { useSearchParams } from "react-router-dom";
import PendingRow from "./PendingRow";
import Pagination from "../../../ui/Pagination";
import { toast } from "sonner";
import KonfirmasiDialog from "../../../ui/KonfirmasiDialog";

function PendingView() {
  const [data, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [totalData, setTotalData] = useState(0);
  const [searchParams, setSearchParams] = useSearchParams();
  const [isProcessing, setIsProcessing] = useState(false);
  const [id, setId] = useState(0);
  const [input, setInput] = useState({
    metode_pembayaran: "",
    bukti_pembayaran: null,
  });
  const [open, setOpen] = useState(false);
  const handleBayar = () => {
    setOpen(!open);
    // if (open == true) {
    //   resetData();
    // }
  };

  const [openKonfirmasi, setOpenKonfirmasi] = useState(false);
  const handleOpenKonfirmasi = () => {
    setOpenKonfirmasi(!openKonfirmasi);
  };

  const page = !searchParams.get("page") ? 1 : Number(searchParams.get("page"));
  const search = !searchParams.get("search") ? "" : searchParams.get("search");

  const resetData = () => {
    setInput({
      metode_pembayaran: "",
      bukti_pembayaran: null,
    });
  };

  const fetchData = (page, search) => {
    setIsLoading(true);
    getPendingPembayaran(page, search)
      .then((res) => {
        setData(res.data);
        setTotalData(res.total);
        setIsLoading(false);
        console.log(res);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };
  useEffect(() => {
    fetchData(page, search);
  }, [page, search]);

  const handlePembayaran = () => {
    setIsProcessing(true);
    console.log(input);
    uploadBuktiPembayaran(id, input)
      .then((res) => {
        console.log(res);
        fetchData(page, search);
        handleOpenKonfirmasi();
        setIsProcessing(false);
        toast.success("Berhasil membayar");
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };
  return (
    <div className="h-svh">
      <div className="w-full">
        <Card>
          <CardHeader floated={false} shadow={false}>
            <h1 className="text-2xl font-semibold text-gray-800 mb-4">
              Pending Pembayaran
            </h1>
            <div className="flex w-full justify-between mb-2">
              <div className="w-full md:w-72">
                <Input label="Search" type="search" onChange={handleSearch} />
              </div>
            </div>
          </CardHeader>

          <CardBody>
            <Table columns="grid-cols-[2fr,2fr,2fr,2fr,3.2rem]">
              <Table.Header>
                <div>No Nota</div>
                <div>Jenis Pengiriman</div>
                <div>Poin didapat</div>
                <div>Total</div>
                <div></div>
              </Table.Header>
              <Table.Body
                data={data}
                isLoading={isLoading}
                render={(item) => (
                  <PendingRow
                    key={item.name}
                    item={item}
                    handleBayar={handleBayar}
                    setId={setId}
                  />
                )}
              />
              <Table.Footer>
                <Pagination count={totalData} />
              </Table.Footer>
            </Table>
          </CardBody>
        </Card>
      </div>
      <Dialog
        open={open}
        size="md"
        handler={handleBayar}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>Kirim Bukti pembayaran</DialogHeader>
        <DialogBody>
          <div className="flex flex-col gap-4">
            <select
              className="w-full border border-black/30 active:border-black focus:border-black  rounded-md p-2 "
              value={input.metode_pembayaran}
              onChange={(e) => {
                setInput({ ...input, metode_pembayaran: e.target.value });
              }}
            >
              <option value="" disabled hidden>
                Pilih Metode Pembayaran
              </option>
              <option value="Delivery">Cash</option>
              <option value="Pick-Up">Transfer</option>
              <option value="E-Money">E-Money</option>
            </select>
            <div>
              <input
                type="file"
                className="w-full border border-black/30 active:border-black focus:border-black rounded-md p-1"
                onChange={(e) => {
                  setInput({ ...input, bukti_pembayaran: e.target.files[0] });
                }}
              />
            </div>
          </div>
        </DialogBody>
        <DialogFooter>
          <Button
            variant="text"
            color="red"
            onClick={handleBayar}
            className="mr-1"
          >
            <span>Cancel</span>
          </Button>

          <Button className="bg-pink-primary" onClick={handleOpenKonfirmasi}>
            <span>Submit</span>
          </Button>
        </DialogFooter>
      </Dialog>
      <KonfirmasiDialog
        handleAdd={handlePembayaran}
        handleOpen={handleBayar}
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        openKonfirmasi={openKonfirmasi}
        isProcessing={isProcessing}
        konfirmasi="Membayar"
      />
    </div>
  );
}

export default PendingView;
