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
import { useParams, useSearchParams } from "react-router-dom";
import Pagination from "../../../../ui/Pagination";
import DataCustomerRow from "./DataCustomerRow";
import ButtonTo from "../../../../ui/ButtonTo";
import { getHistoryPenjualanCustomer } from "../../../../api/ApiDataCustomer";
import CustomerHistoryRow from "./CustomerHistoryRow";

function CutomerHistoryPenjualan() {
  const { idCustomer } = useParams();
  const [data, setData] = useState([]);
  const [totalData, setTotalData] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();

  const page = !searchParams.get("page") ? 1 : Number(searchParams.get("page"));
  const search = !searchParams.get("search") ? "" : searchParams.get("search");

  const fetchData = (page, search, id) => {
    setIsLoading(true);
    getHistoryPenjualanCustomer(page, search, id)
      .then((res) => {
        console.log(res.data);
        setData(res.data);

        setTotalData(res.total);
        setIsLoading(false);
      })
      .catch((err) => {
        setIsLoading(false);
      });
  };

  useEffect(() => {
    fetchData(page, search, idCustomer);
  }, []);

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };
  return (
    <div className="w-full">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-2xl font-semibold text-gray-800">
          History Pesanan Customer
        </h1>
        <ButtonTo path="/data-customer" />
      </div>
      <div className="flex w-full justify-between mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>
      </div>
      <Table columns="grid-cols-[2fr,2fr,2fr,2fr,2fr,2fr,3.2rem]">
        <Table.Header>
          <div>No Nota</div>
          <div>Pengiriman</div>
          <div>Pembayaran</div>
          <div>Tgl Pesan</div>
          <div>Tgl Siap</div>
          <div>status</div>
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => <CustomerHistoryRow key={item.name} item={item} />}
        />
        <Table.Footer>
          <Pagination count={totalData} />
        </Table.Footer>
      </Table>
    </div>
  );
}

export default CutomerHistoryPenjualan;
