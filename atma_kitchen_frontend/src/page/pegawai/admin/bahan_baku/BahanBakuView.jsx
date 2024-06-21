import { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import { useBahanBaku } from "./useBahanBaku";
import Table from "../../../../ui/Table";
import {
  Input,
  Button,
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
} from "@material-tailwind/react";
import BahanBakuRow from "./BahanBakuRow";
import Pagination from "../../../../ui/Pagination";
import { toast } from "sonner";
import DeleteDialog from "../../../../ui/DeleteDialog";

function BahanBakuView({ arrayBahan, onChangeBahan, idBahan }) {
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
  } = useBahanBaku(handleOpen, handleOpenDelete);

  const [input, setInput] = useState({
    nama: "",
    satuan: "",
  });
  const [id, setId] = useState(0);
  const [open, setOpen] = useState(false);
  const [openDelete, setOpenDelete] = useState(false);
  const [nama, setNama] = useState("");

  useEffect(() => {
    if (!open) {
      setInput({
        nama: "",
        satuan: "",
      });
    }
  }, [open]);

  const handleAdd = () => {
    if (input.nama === "" || input.satuan === "") {
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
      satuan: item.satuan,
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
      <h1 className="text-2xl font-semibold text-gray-800 mb-8">Bahan Baku</h1>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>
        {onChangeBahan || (
          <Button
            className="flex items-center gap-3 bg-pink-primary"
            size="sm"
            onClick={() => {
              handleOpen();
              setId(0);
            }}
          >
            Tambah Bahan Baku
          </Button>
        )}
      </div>
      <Table
        columns={
          onChangeBahan && idBahan == null
            ? `grid-cols-[4fr,2fr,2fr,2fr,3.2rem]`
            : `grid-cols-[4fr,2fr,2fr,3.2rem]`
        }
      >
        <Table.Header>
          <div>Nama Bahan</div>
          <div>Satuan</div>
          <div>Stok</div>
          {onChangeBahan && <div>Qty</div>}
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => (
            <BahanBakuRow
              key={item.name}
              item={item}
              idBahan={idBahan}
              handleEdit={handleEdit}
              handleDelete={openDeleteModal}
              arrayBahan={arrayBahan}
              onChangeBahan={onChangeBahan}
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
        <DialogHeader>{id == 0 ? "Tambah" : "Update"} Bahan Baku</DialogHeader>
        <DialogBody>
          <div className="flex flex-col gap-4">
            <Input
              label="Nama Bahan Baku"
              type="text"
              size="lg"
              placeholder="Masukan Nama Bahan baku"
              onChange={(e) => setInput({ ...input, nama: e.target.value })}
              value={input.nama}
            />
            <Input
              label="Satuan"
              type="text"
              size="lg"
              placeholder="Contoh: gr, kg, liter, dst"
              onChange={(e) => setInput({ ...input, satuan: e.target.value })}
              value={input.satuan}
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

export default BahanBakuView;
