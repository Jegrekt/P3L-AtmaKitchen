import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import {
  getPengeluaranLain,
  addPengeluaranLain,
  updatePengeluaranLain,
  deletePengeluaranLain,
} from "../../../../api/ApiPengeluaranLain";
import { toast } from "sonner";
import { PAGE_SIZE } from "../../../../utils/Constants";

export function usePengeluaranLain(
  handleOpen,
  handleOpenDelete,
  handleOpenKonfirmasi
) {
  const [data, setData] = useState([]);
  const [totalData, setTotalData] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();

  const page = !searchParams.get("page") ? 1 : Number(searchParams.get("page"));
  const search = !searchParams.get("search") ? "" : searchParams.get("search");

  useEffect(() => {
    fetchData(page, search);
  }, [page, search]);

  useEffect(() => {
    searchParams.set("page", 1);
    setSearchParams(searchParams);
  }, [search]);

  const fetchData = (page, search) => {
    setIsLoading(true);
    getPengeluaranLain(page, search)
      .then((res) => {
        console.log(res.data);
        setData(res.data);

        setTotalData(res.total);
        setIsLoading(false);
      })
      .catch((err) => {
        // console.log(err);
        setIsLoading(false);
      });
  };

  const createData = (input) => {
    setIsProcessing(true);
    addPengeluaranLain(input)
      .then(() => {
        setIsProcessing(false);
        fetchData(page, search);
        handleOpen();
        toast.success("Data berhasil ditambahkan");
      })
      .catch((err) => {
        setIsProcessing(false);
        toast.error(err.message);
      });
  };

  const updateData = (id, input) => {
    setIsProcessing(true);
    console.log(input);
    updatePengeluaranLain(id, input)
      .then((res) => {
        console.log(res);
        setIsProcessing(false);
        fetchData(page, search);
        toast.success("Data berhasil diupdate");
        handleOpenKonfirmasi();
      })
      .catch((err) => {
        setIsProcessing(false);
        toast.error(err.message);
      });
  };

  const deleteData = (id) => {
    setIsProcessing(true);
    deletePengeluaranLain(id)
      .then(() => {
        setIsProcessing(false);
        const dataLength = data.length - 1;
        if (dataLength % PAGE_SIZE === 0) {
          searchParams.set("page", Math.max(1, page - 1));
          setSearchParams(searchParams);
        } else {
          fetchData(page, search);
        }
        handleOpenDelete();
        toast.success("Data berhasil dihapus");
      })
      .catch((err) => {
        setIsProcessing(false);
        toast.error(err.message);
      });
  };

  return {
    data,
    totalData,
    isLoading,
    isProcessing,
    createData,
    updateData,
    deleteData,
  };
}
