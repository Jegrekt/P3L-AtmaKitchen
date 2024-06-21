import { useEffect, useState } from "react";
import {
  getPendingOngkir,
  inputJarak,
} from "../../../../api/ApiPengirimanAdmin";
import { toast } from "sonner";

export function usePengirimanAdmin(handleOpen) {
  const [data, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = () => {
    setIsLoading(true);
    getPendingOngkir()
      .then((res) => {
        setData(res.data);
        setIsLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };

  const handleInputJarak = (id, jarak) => {
    setIsProcessing(true);
    inputJarak(id, jarak)
      .then(() => {
        setIsProcessing(false);
        fetchData();
        handleOpen();
        toast.success("Jarak berhasil diinput");
      })
      .catch((err) => {
        setIsProcessing(false);
        toast.error(err.message);
      });
  };

  return { data, isLoading, handleInputJarak, isProcessing };
}
