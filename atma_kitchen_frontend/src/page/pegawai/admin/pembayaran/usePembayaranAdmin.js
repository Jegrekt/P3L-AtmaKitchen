import { useEffect, useState } from "react";

import {
  getPendingPembayaran,
  konfirmasiPembayaran,
} from "../../../../api/ApiPembayaranAdmin";
import { toast } from "sonner";

export function usePembayaranAdmin(handleOpen) {
  const [data, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = () => {
    setIsLoading(true);
    getPendingPembayaran()
      .then((res) => {
        setData(res.data);
        setIsLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };

  const handleKonfirmasiPembayaran = (id, jumlahPembayaran) => {
    setIsProcessing(true);
    konfirmasiPembayaran(id, jumlahPembayaran)
      .then(() => {
        setIsProcessing(false);
        fetchData();
        handleOpen();
        toast.success("Pembayaran berhasil dikonfirmasi");
      })
      .catch((err) => {
        setIsProcessing(false);
        toast.error(err.message);
      });
  };

  return { data, isLoading, handleKonfirmasiPembayaran, isProcessing };
}
