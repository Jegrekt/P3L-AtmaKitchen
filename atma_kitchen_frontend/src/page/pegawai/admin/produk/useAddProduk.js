import { useState } from "react";
import { addDataProduk } from "../../../../api/ApiProduk";
import { toast } from "sonner";
import { useNavigate } from "react-router-dom";

export function useAddProduk() {
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const addProduk = (input) => {
    setIsLoading(true);
    addDataProduk(input)
      .then(() => {
        setIsLoading(false);
        navigate("/produk", { replace: true });
        toast.success("Data berhasil ditambahkan");
      })
      .catch((err) => {
        setIsLoading(false);
        toast.error(err.message);
      });
  };

  return {
    isLoading,
    addProduk,
  };
}
