import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import { getDataCustomer } from "../../../../api/ApiDataCustomer";
import { toast } from "sonner";
import { PAGE_SIZE } from "../../../../utils/Constants";

export function useDataCustomer() {
  const [data, setData] = useState([]);
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
    getDataCustomer(page, search)
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

  return {
    data,
    totalData,
    isLoading,
  };
}
