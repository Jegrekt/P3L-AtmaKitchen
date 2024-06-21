import { useState } from "react";
import {
  updateFotoProduk,
  updateDataProduk,
  updateResepProduk,
  updateHampersProduk,
  updatePenitipProduk,
} from "../../../../api/ApiProduk";
import { toast } from "sonner";

export function useUpdateProduk(openModal, refetchProduk, setChecked) {
  const [isProcessing, setIsProcessing] = useState(false);

  const updateFoto = (id, data) => {
    setIsProcessing(true);
    updateFotoProduk(id, data)
      .then((res) => {
        console.log(res);
        toast.success("Foto produk berhasil diubah");
        openModal(false);
        refetchProduk();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  const updateProduk = (id, data) => {
    setIsProcessing(true);
    updateDataProduk(id, data)
      .then((res) => {
        console.log(res);
        toast.success("Data produk berhasil diubah");
        setChecked(false);
        openModal(false);
        refetchProduk();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  const updateResep = (id, data) => {
    setIsProcessing(true);
    updateResepProduk(id, data)
      .then((res) => {
        console.log(res);
        toast.success("Resep produk berhasil diubah");
        setChecked(false);
        openModal(false);
        refetchProduk();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  const updateHampers = (id, data) => {
    setIsProcessing(true);
    updateHampersProduk(id, data)
      .then((res) => {
        console.log(res);
        toast.success("Hampers produk berhasil diubah");
        setChecked(false);
        openModal(false);
        refetchProduk();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  const updatePenitip = (id, data) => {
    setIsProcessing(true);
    updatePenitipProduk(id, data)
      .then((res) => {
        console.log(res);
        toast.success("Penitip produk berhasil diubah");
        setChecked(false);
        openModal(false);
        refetchProduk();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        setIsProcessing(false);
      });
  };

  return {
    isProcessing,
    updateFoto,
    updateProduk,
    updateResep,
    updateHampers,
    updatePenitip,
  };
}
