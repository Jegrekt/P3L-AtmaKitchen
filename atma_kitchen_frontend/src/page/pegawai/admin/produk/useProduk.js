import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import { getDataProduk, deleteProduk } from "../../../../api/ApiProduk";
import { toast } from "sonner";
import { PAGE_SIZE } from "../../../../utils/Constants";

export function useProduk(handleDelete) {
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
    getDataProduk(page, search)
      .then((res) => {
        setData(res.data);
        setTotalData(res.total);
        setIsLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };

  const handleDeleteProduk = (id) => {
    setIsProcessing(true);
    deleteProduk(id)
      .then(() => {
        handleDelete();
        toast.success("Produk berhasil dihapus");
        const dataLength = data.length - 1;
        if (dataLength % PAGE_SIZE === 0) {
          searchParams.set("page", Math.max(1, page - 1));
          setSearchParams(searchParams);
        } else {
          fetchData(page, search);
        }
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  return {
    data,
    totalData,
    isLoading,
    isProcessing,
    handleDeleteProduk,
  };
}
