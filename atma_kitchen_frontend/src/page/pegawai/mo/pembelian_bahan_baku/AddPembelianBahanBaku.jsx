import React, { useEffect, useState } from "react";
import ButtonTo from "../../../../ui/ButtonTo";
import {
  Card,
  CardBody,
  Input,
  CardHeader,
  Tabs,
  TabsHeader,
  TabsBody,
  Tab,
  TabPanel,
  Button,
  Textarea,
} from "@material-tailwind/react";
import { usePembelianBahanBaku } from "./usePembelianBahanBaku";
import BahanBakuView from "../../admin/bahan_baku/BahanBakuView";
import { toast } from "sonner";
import { useParams } from "react-router-dom";
import { getPembelianBahanBakuById } from "../../../../api/ApiPembelianBahanBaku";
import { toDateInputValue } from "../../../../utils/setDate";
import KonfirmasiDialog from "../../../../ui/KonfirmasiDialog";
("./usePembelianBahanBaku");
function AddPembelianBahanBaku() {
  const [idBahan, setIdBahan] = useState(0);
  const [openKonfirmasi, setOpenKonfirmasi] = useState(false);
  const handleOpenKonfirmasi = () => setOpenKonfirmasi(!openKonfirmasi);
  const [input, setInput] = useState({
    tanggal_pembelian: "",
    harga_satuan: 0,
    qty: 0,
  });
  const { idPBB } = useParams();
  const { isLoading, isProcessing, createData, updateData } =
    usePembelianBahanBaku();

  const onChangeBahan = (id) => {
    setIdBahan(id);
  };

  const onAddPBB = () => {
    if (idBahan == 0 || input.tanggal == "" || input.harga == 0) {
      toast.error("Data tidak boleh kosong");
      return;
    }
    if (idPBB != "0") {
      updateData(idPBB, {
        ...input,
        id_bahan_baku: idBahan,
        harga_satuan: Number(input.harga_satuan),
        qty: Number(input.qty),
      });
    } else {
      createData({
        ...input,
        id_bahan_baku: idBahan,
        harga_satuan: Number(input.harga_satuan),
        qty: Number(input.qty),
      });
    }
  };

  useEffect(() => {
    if (idPBB != "0") {
      getPembelianBahanBakuById(idPBB)
        .then((res) => {
          console.log(res);
          setInput({
            tanggal_pembelian: toDateInputValue(res.tanggal_pembelian),
            harga_satuan: res.harga_satuan,
            qty: res.qty,
          });
          setIdBahan(res.id_bahan_baku);
        })
        .catch((err) => {});
    }
  }, []);

  return (
    <>
      <div className="w-full">
        <div className="flex items-center justify-between">
          <h1 className="text-2xl font-semibold text-gray-800 mb-4">
            Tambah Pembelian Bahan Baku
          </h1>
          <ButtonTo path="/pembelian-bahan-baku" />
        </div>
        <Card className="mb-8">
          <CardHeader
            color="transparent"
            floated={false}
            shadow={false}
            className="m-0 px-6 pt-4 rounded-none"
          >
            <h1 className="text-sm text-pink-primary mb-2">
              Informasi Pembelian Bahan Baku
            </h1>
          </CardHeader>
          <CardBody className="pt-2">
            <div className="flex flex-col gap-4 w-full">
              <div className="flex gap-4">
                <Input
                  label="Tanggal Pembelian"
                  placeholder="Harga"
                  type="date"
                  max={new Date().toJSON().slice(0, 10)}
                  onChange={(e) =>
                    setInput({ ...input, tanggal_pembelian: e.target.value })
                  }
                  value={input.tanggal_pembelian}
                />

                <Input
                  label="harga Satuan"
                  placeholder="Stok Ready"
                  type="number"
                  onChange={(e) =>
                    setInput({ ...input, harga_satuan: e.target.value })
                  }
                  value={input.harga_satuan}
                />

                <Input
                  label="Jumlah"
                  placeholder="Stok Ready"
                  type="number"
                  onChange={(e) => setInput({ ...input, qty: e.target.value })}
                  value={input.qty}
                />
              </div>
              <h1 className="text-sm text-pink-primary mt-2">
                Kategori Bahan baku
              </h1>
              <div className="mt-4">
                <BahanBakuView
                  // arrayBahan={arrayBahan}
                  onChangeBahan={onChangeBahan}
                  idBahan={idBahan}
                />
              </div>
              <div className="flex justify-end">
                <Button
                  loading={isLoading}
                  onClick={() => {
                    if (idPBB != "0") handleOpenKonfirmasi();
                    else onAddPBB();
                  }}
                  className="bg-pink-primary"
                >
                  Simpan
                </Button>
              </div>
              ``
            </div>
          </CardBody>
        </Card>
      </div>

      <KonfirmasiDialog
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        isProcessing={isLoading}
        openKonfirmasi={openKonfirmasi}
        handleAdd={onAddPBB}
      />
    </>
  );
}

export default AddPembelianBahanBaku;
