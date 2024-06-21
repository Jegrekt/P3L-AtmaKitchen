import { useState, useEffect } from "react";
import React from "react";

import { useSearchParams, useNavigate } from "react-router-dom";
import { useProduk } from "./useProduk";
import { Input, Button } from "@material-tailwind/react";
import Table from "../../../../ui/Table";
import ProdukRow from "./ProdukRow";
import Pagination from "../../../../ui/Pagination";
import DeleteDialog from "../../../../ui/DeleteDialog";

function ProdukView({ arrayProduk, onChangeProduk }) {
  const navigate = useNavigate();
  const [openDelete, setOpenDelete] = useState(false);
  const [namaProduk, setNamaProduk] = useState("");

  const [searchParams, setSearchParams] = useSearchParams();

  const [id, setId] = useState(0);

  const handleOpenDelete = (id) => {
    const produk = data.find((item) => item.id === id);
    if (!openDelete) {
      setNamaProduk(produk.nama);
      setId(id);
    }
    setOpenDelete((prev) => !prev);
  };

  const { data, totalData, isLoading, isProcessing, handleDeleteProduk } =
    useProduk(handleOpenDelete);
  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };

  const goToDetailProduk = (id) => {
    navigate(`${id}`);
  };
  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-800 mb-4">Data Produk</h1>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input
            label="Search"
            type="search"
            onChange={handleSearch}
            value={searchParams.get("search")}
          />
        </div>
        {onChangeProduk || (
          <Button
            className="flex items-center gap-3 bg-pink-primary"
            size="sm"
            onClick={() => {
              navigate("/add-produk");
            }}
          >
            Tambah Produk
          </Button>
        )}
      </div>
      <Table
        columns={
          onChangeProduk
            ? `grid-cols-[2fr,1fr,1.5fr,1fr,2fr,3.2rem]`
            : `grid-cols-[2fr,1fr,1fr,1fr,1fr,1fr,3.2rem]`
        }
      >
        <Table.Header>
          <div>Nama</div>
          <div>Kategori</div>
          {onChangeProduk || <div>Penitip</div>}
          <div>Harga</div>
          {onChangeProduk || <div>Harga 1/2 Loyang</div>}
          <div>Stok Ready</div>
          {onChangeProduk && <div>Qty</div>}
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => (
            <ProdukRow
              key={item.name}
              item={item}
              goToDetailProduk={goToDetailProduk}
              arrayProduk={arrayProduk}
              onChangeProduk={onChangeProduk}
              handleOpenDelete={handleOpenDelete}
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
        handleDelete={() => handleDeleteProduk(id)}
        nama={namaProduk}
        isProcessing={isProcessing}
      />
    </div>
  );
}

export default ProdukView;
