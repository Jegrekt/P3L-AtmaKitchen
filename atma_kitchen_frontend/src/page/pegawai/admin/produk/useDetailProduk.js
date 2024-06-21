import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getProdukById } from "../../../../api/ApiProduk";

export function useDetailProduk() {
  const { produkId } = useParams();
  const [data, setData] = useState({});
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, [produkId]);

  const fetchData = () => {
    setIsLoading(true);
    getProdukById(produkId)
      .then((res) => {
        setData(res);
        setIsLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };

  return {
    data,
    isLoading,
    fetchData,
  };
}
