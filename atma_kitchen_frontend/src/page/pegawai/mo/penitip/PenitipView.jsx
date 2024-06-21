import React, { useEffect, useState } from "react";
import { usePenitip } from "./usePenitip";
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
import PenitipRow from "./PenitipRow";
import Pagination from "../../../../ui/Pagination";
import { toast } from "sonner";
import DeleteDialog from "../../../../ui/DeleteDialog";

function PenitipView({ onChangePenitip, idPenitip }) {
  const handleOpen = () => setOpen(!open);
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
  } = usePenitip(handleOpen, handleOpenDelete);

  const [input, setInput] = useState({
    nama: "",
    no_telp: "",
    alamat: "",
  });

  const [id, setId] = useState(0);
  const [open, setOpen] = useState(false);
  const [openDelete, setOpenDelete] = useState(false);
  const [nama, setNama] = useState("");

  useEffect(() => {
    if (!open) {
      setInput({
        nama: "",
        no_telp: "",
        alamat: "",
      });
    }
  }, [open]);

  const handleAdd = () => {
    if (input.nama === "" || input.no_telp === "" || input.alamat === "") {
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
      no_telp: item.no_telp,
      alamat: item.alamat,
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

  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-800 mb-4">
        Data Penitip
      </h1>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>
        {!onChangePenitip && (
          <Button
            className="flex items-center gap-3 bg-pink-primary"
            size="sm"
            onClick={() => {
              handleOpen();
              setId(0);
            }}
          >
            Tambah Penitip
          </Button>
        )}
      </div>
      <Table columns="grid-cols-[2fr,2fr,2fr,3.2rem]">
        <Table.Header>
          <div>Nama Penitip</div>
          <div>Alamat</div>
          <div>No Telp</div>
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => (
            <PenitipRow
              idPenitip={idPenitip}
              onChangePenitip={onChangePenitip}
              key={item.nama}
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
        <DialogHeader>{id == 0 ? "Tambah" : "Update"} Penitip</DialogHeader>
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
              label="Nomor Telepon"
              type="text"
              size="lg"
              placeholder="Masukan Nomor Telepon"
              onChange={(e) => setInput({ ...input, no_telp: e.target.value })}
              value={input.no_telp}
            />
            <Textarea
              label="Masukan Alamat Anda"
              rows={1}
              resize={true}
              onChange={(e) => setInput({ ...input, alamat: e.target.value })}
              value={input.alamat}
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
            onClick={handleAdd}
          >
            <span>Confirm</span>
          </Button>
        </DialogFooter>
      </Dialog>
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

export default PenitipView;
