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
import { useDataCustomer } from "./useDataCustomer";

import { useSearchParams } from "react-router-dom";
import Pagination from "../../../../ui/Pagination";
import DataCustomerRow from "./DataCustomerRow";
function DataCustomer() {
  const [searchParams, setSearchParams] = useSearchParams();
  const { data, totalData, isLoading } = useDataCustomer();

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };
  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-800 mb-4">
        Data Customer
      </h1>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>
      </div>
      <Table columns="grid-cols-[2fr,3fr,2fr,2fr,1fr,3.2rem]">
        <Table.Header>
          <div>Nama</div>
          <div>Email</div>
          <div>No Telp</div>
          <div>Saldo</div>
          <div>Poin</div>
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => <DataCustomerRow key={item.name} item={item} />}
        />
        <Table.Footer>
          <Pagination count={totalData} />
        </Table.Footer>
      </Table>
    </div>
  );
}

export default DataCustomer;
