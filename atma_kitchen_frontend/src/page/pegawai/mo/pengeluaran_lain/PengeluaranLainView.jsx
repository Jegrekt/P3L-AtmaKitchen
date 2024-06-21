import React, { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import {
  Button,
  Dialog,
  DialogBody,
  DialogFooter,
  DialogHeader,
  Input,
  Textarea,
} from "@material-tailwind/react";
import Table from "../../../../ui/Table";
import Pagination from "../../../../ui/Pagination";
import { toast } from "sonner";
import DeleteDialog from "../../../../ui/DeleteDialog";
import { usePengeluaranLain } from "./usePengeluaranLain";
import PengeluaranLainRow from "./PengeluaranLainRow";
import KonfirmasiDialog from "../../../../ui/KonfirmasiDialog";
function PengeluaranLainView() {
  const handleOpen = () => setOpen(!open);
  const handleOpenKonfirmasi = () => setOpenKonfirmasi(!openKonfirmasi);
  const handleOpenDelete = () => setOpenDelete(!openDelete);
  const [searchParams, setSearchParams] = useSearchParams();
  const {
    data,
    totalData,
    isLoading,
    isProcessing,
    createData,
    updateData,
    deleteData,
  } = usePengeluaranLain(handleOpen, handleOpenDelete, handleOpenKonfirmasi);

  const [input, setInput] = useState({
    nama: "",
    nominal: "",
    tanggal_pengeluaran: "",
  });

  const [id, setId] = useState(0);
  const [open, setOpen] = useState(false);
  const [openDelete, setOpenDelete] = useState(false);
  const [openKonfirmasi, setOpenKonfirmasi] = useState(false);
  const [nama, setNama] = useState("");

  const handleAdd = () => {
    if (
      input.nama === "" ||
      input.nominal === "" ||
      input.tanggal_pengeluaran === ""
    ) {
      toast.error("Data tidak boleh kosong");
      return;
    }
    if (id == 0) {
      createData(input);
    } else {
      updateData(id, input);
    }
  };

  const handleEdit = (id) => {
    handleOpen();
    setId(id);
    const item = data.find((item) => item.id === id);
    setInput({
      nama: item.nama,
      nominal: item.nominal,
      tanggal_pengeluaran: item.tanggal_pengeluaran,
    });
  };

  const openDeleteModal = (id) => {
    handleOpenDelete();
    setId(id);
    const findData = data.find((item) => item.id === id);
    setNama(findData.nama);
  };

  const handleDelete = () => {
    deleteData(id);
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };

  const subStringDate = (date) => {
    return date.substring(0, 10);
  };
  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-800 mb-4">
        Pencatatan Pengeluaran Lain
      </h1>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>

        <Button
          className="flex items-center gap-3 bg-pink-primary"
          size="sm"
          onClick={() => {
            handleOpen();
            setId(0);
            setInput({
              nama: "",
              nominal: "",
              tanggal_pengeluaran: "",
            });
          }}
        >
          Tambah Pengeluaran
        </Button>
      </div>
      <Table columns="grid-cols-[2fr,2fr,2fr,3.2rem]">
        <Table.Header>
          <div>Nama</div>
          <div>Nominal</div>
          <div>Tanggal</div>
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item, index) => (
            <PengeluaranLainRow
              key={item.id}
              item={item}
              handleEdit={handleEdit}
              handleDelete={openDeleteModal}
            />
          )}
        />
        <Table.Footer>
          <Pagination count={totalData} />
        </Table.Footer>
      </Table>
      <Dialog
        open={open}
        size="md"
        handler={handleOpen}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>{id == 0 ? "Tambah" : "Update"} Pengeluaran Lain-Lain</DialogHeader>
        <DialogBody>
          <div className="flex flex-col gap-4">
            <Input
              label="Nama"
              type="text"
              size="lg"
              placeholder="Masukan Nama"
              onChange={(e) => setInput({ ...input, nama: e.target.value })}
              value={input.nama}
            />
            <Input
              label="Nomor Nominal"
              type="number"
              size="lg"
              placeholder="Masukan Nominal"
              onChange={(e) => setInput({ ...input, nominal: e.target.value })}
              value={input.nominal}
            />
            <Input
              label="Tanggal Pengeluaran"
              type="date"
              size="lg"
              placeholder="Masukan Nominal"
              max={new Date().toJSON().slice(0, 10)}
              onChange={(e) =>
                setInput({ ...input, tanggal_pengeluaran: e.target.value })
              }
              value={subStringDate(input.tanggal_pengeluaran)}
            />
          </div>
        </DialogBody>
        <DialogFooter>
          <Button
            variant="text"
            color="red"
            onClick={handleOpen}
            className="mr-1"
          >
            <span>Cancel</span>
          </Button>

          <Button
            className="bg-pink-primary"
            loading={isProcessing}
            onClick={() => {
              if (id == 0) {
                handleAdd();
              } else {
                handleOpenKonfirmasi();
                handleOpen();
              }
            }}
          >
            <span>Confirm</span>
          </Button>
        </DialogFooter>
      </Dialog>
      {/* Konfirmasi */}
      <KonfirmasiDialog
        handleAdd={handleAdd}
        handleOpen={handleOpen}
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        isProcessing={isProcessing}
        openKonfirmasi={openKonfirmasi}
      />
      <DeleteDialog
        openDelete={openDelete}
        handleOpenDelete={handleOpenDelete}
        handleDelete={handleDelete}
        nama={nama}
        isProcessing={isProcessing}
      />
    </div>
  );
}

export default PengeluaranLainView;
