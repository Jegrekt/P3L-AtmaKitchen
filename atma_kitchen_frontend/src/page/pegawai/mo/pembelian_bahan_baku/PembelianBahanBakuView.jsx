import {
  Input,
  Button,
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
  Textarea,
} from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import Table from "../../../../ui/Table";
import { usePembelianBahanBaku } from "./usePembelianBahanBaku";
import { toast } from "sonner";
import { useNavigate, useSearchParams } from "react-router-dom";
import Pagination from "../../../../ui/Pagination";
import DeleteDialog from "../../../../ui/DeleteDialog";
import PembelianBahanBakuRow from "./PembelianBahanBakuRow";
import { setDate } from "../../../../utils/setDate";

function PembelianBahanBakuView() {
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
  } = usePembelianBahanBaku(handleOpenDelete);

  //   const [input, setInput] = useState({
  //     tanggal: "",
  //     name: "",
  //     no_telp: "",
  //     alamat: "",
  //   });

  const [id, setId] = useState(0);
  const [open, setOpen] = useState(false);
  const [openDelete, setOpenDelete] = useState(false);
  const [nama, setNama] = useState("");
  const navigate = useNavigate();

  const openDeleteModal = (id) => {
    handleOpenDelete();
    setId(id);
    const findData = data.find((item) => item.id === id);
    setNama(findData.name);
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
        Data Pembelian Bahan Baku
      </h1>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>
        <Button
          className="flex items-center gap-3 bg-pink-primary"
          size="sm"
          onClick={() => {
            navigate("/add-pembelian-bahan/0");
          }}
        >
          Pembelian Bahan baku
        </Button>
      </div>
      <Table columns="grid-cols-[2fr,2fr,2fr,2fr,2fr,3.2rem]">
        <Table.Header>
          <div>Bahan Baku</div>
          <div>Tanggal Pembelian</div>
          <div>Harga Satuan</div>
          <div>Jumlah</div>
          <div>Total</div>
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => (
            <PembelianBahanBakuRow
              key={item.name}
              item={item}
              //   handleEdit={handleEdit}
              handleDelete={openDeleteModal}
            />
          )}
        />
        <Table.Footer>
          <Pagination count={totalData} />
        </Table.Footer>
      </Table>
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

export default PembelianBahanBakuView;
