import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import { getHistoryPenjualan } from "../../../api/ApiProfilCustomer";

export function useProfilCustomer() {
  const [dataHistory, setDataHistory] = useState([]);
  const [totalData, setTotalData] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
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
    getHistoryPenjualan(page, search)
      .then((res) => {
        setDataHistory(res.data);
        setTotalData(res.total);
        setIsLoading(false);
      })
      .catch(() => {
        setIsLoading(false);
      });
  };

  return {
    dataHistory,
    totalData,
    isLoading,
  };
}
