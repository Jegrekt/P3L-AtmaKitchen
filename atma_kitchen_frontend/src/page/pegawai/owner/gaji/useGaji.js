import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";

import {
  updateBonus,
  updateGaji,
  getKarayawan,
} from "../../../../api/ApiKaryawan";
import { toast } from "sonner";

export function useGaji(handleOpen, handleOpenBonus) {
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
    getKarayawan(page, search)
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

  const updateBonusKaryawan = (id, input) => {
    setIsProcessing(true);
    console.log(input);
    updateBonus(id, input)
      .then((res) => {
        console.log(res);
        setIsProcessing(false);
        fetchData(page, search);
        handleOpenBonus();
        toast.success("Data berhasil diupdate");
      })
      .catch((err) => {
        setIsProcessing(false);
        toast.error(err.message);
      });
  };

  const updateGajiKaryawan = (role, input) => {
    setIsProcessing(true);
    console.log(input);
    updateGaji(role, input)
      .then((res) => {
        console.log(res);
        setIsProcessing(false);
        fetchData(page, search);
        handleOpen();
        toast.success("Data berhasil diupdate");
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
    updateBonusKaryawan,
    updateGajiKaryawan,
  };
}
