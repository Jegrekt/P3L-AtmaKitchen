import { useState } from "react";
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
import PenitipView from "../../mo/penitip/PenitipView";
import { useAddProduk } from "./useAddProduk";
import { toast } from "sonner";
import ButtonTo from "../../../../ui/ButtonTo";
import ProdukView from "./ProdukView";
import BahanBakuView from "../bahan_baku/BahanBakuView";
import { kategoriProduk } from "../../../../utils/Constants";

function ProdukAdd() {
  const { isLoading, addProduk } = useAddProduk();
  const [input, setInput] = useState({
    nama: "",
    harga: "",
    stok_ready: 0,
    deskripsi: "",
    kuota_harian: 0,
  });

  const [inputKategori, setInputKategori] = useState({
    harga_setengah_loyang: "",
  });

  const [kategori, setKategori] = useState(1);

  const [id_penitip, setIdPenitip] = useState(0);

  const [arrayProduk, setArrayProduk] = useState([]);
  const [arrayBahan, setArrayBahan] = useState([]);

  const onChangePenitip = (id) => {
    setIdPenitip(id);
  };

  const onChangeKategori = (id) => {
    setKategori(id);
    setInputKategori({ harga_setengah_loyang: "" });
    if (id === 5) {
      setArrayProduk([]);
    }
    if (id != 4 && id != 5) {
      setArrayBahan([]);
    }
  };

  const onChangeArray = (id, checked, qty, isEdit) => {
    if (checked) {
      if (isEdit) {
        if (kategori === 5) {
          setArrayProduk((prevState) =>
            prevState.map((item) =>
              item.id_produk === id ? { ...item, qty: parseInt(qty) } : item
            )
          );
          return;
        } else {
          setArrayBahan((prevState) =>
            prevState.map((item) =>
              item.id_bahan_baku === id ? { ...item, qty: parseInt(qty) } : item
            )
          );
          return;
        }
      }
      if (kategori === 5) {
        setArrayProduk((prevState) => [
          ...prevState,
          { id_produk: id, qty: 1 },
        ]);
      } else {
        setArrayBahan((prevState) => [
          ...prevState,
          { id_bahan_baku: id, qty: 1 },
        ]);
      }
    } else {
      if (kategori === 5) {
        setArrayProduk((prevState) =>
          prevState.filter((item) => item.id_produk !== id)
        );
      } else {
        setArrayBahan((prevState) =>
          prevState.filter((item) => item.id_bahan_baku !== id)
        );
      }
    }
  };

  const onAddProduk = () => {
    let data = {
      ...input,
      stok_ready: parseInt(input.stok_ready),
      id_kategori: kategori,
    };
    if (input.nama === "" || input.harga === "" || input.stok_ready === "") {
      toast.error("Data tidak boleh kosong");
      return;
    }

    if (kategori === 4) {
      if (id_penitip === 0) {
        toast.error("Penitip tidak boleh kosong");
        return;
      }

      data = {
        ...data,
        id_penitip,
      };
    }

    if (kategori != 4 && kategori != 5) {
      if (kategori === 1) {
        if (inputKategori.harga_setengah_loyang === "") {
          toast.error("Harga setengah loyang tidak boleh kosong");
          return;
        }

        data = {
          ...data,
          ...inputKategori,
        };
      }

      data = {
        ...data,
        resep: arrayBahan,
      };
    }

    if (kategori === 5) {
      if (arrayProduk.length === 0) {
        toast.error("Produk tidak boleh kosong");
        return;
      }
      data = {
        ...data,
        hampers: arrayProduk,
      };
    }

    addProduk(data);
  };
  return (
    <div className="w-full">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-semibold text-gray-800 mb-4">
          Add Produk
        </h1>
        <ButtonTo path="/produk" />
      </div>
      <Card className="mb-8">
        <CardHeader
          color="transparent"
          floated={false}
          shadow={false}
          className="m-0 px-6 pt-4 rounded-none"
        >
          <h1 className="text-sm text-pink-primary mb-2">Informasi Produk</h1>
        </CardHeader>
        <CardBody className="pt-2">
          <div className="flex flex-col gap-4 w-full">
            <Input
              label="Nama Produk"
              placeholder="Nama Produk"
              onChange={(e) => setInput({ ...input, nama: e.target.value })}
              value={input.nama}
            />

            <Input
              label="Harga"
              placeholder="Harga"
              type="number"
              onChange={(e) => setInput({ ...input, harga: e.target.value })}
              value={input.harga}
            />

            <Textarea
              label="Deskripsi"
              rows={1}
              resize={true}
              onChange={(e) =>
                setInput({ ...input, deskripsi: e.target.value })
              }
              value={input.alamat}
            />

            <h1 className="text-sm text-pink-primary mt-2">Kategori Produk</h1>
            <Tabs value={kategori}>
              <TabsHeader>
                {kategoriProduk.map(({ label, value }) => (
                  <Tab
                    key={value}
                    value={value}
                    onClick={() => onChangeKategori(value)}
                  >
                    {label}
                  </Tab>
                ))}
              </TabsHeader>
              <TabsBody>
                {kategoriProduk.map(({ value }) => (
                  <TabPanel
                    className="p-0 pt-4 flex flex-col gap-2"
                    key={value}
                    value={value}
                  >
                    {value === 1 && (
                      <Input
                        label="Harga Setengah Loyang"
                        placeholder="Harga Setengah Loyang"
                        type="number"
                        onChange={(e) =>
                          setInputKategori({
                            harga_setengah_loyang: e.target.value,
                          })
                        }
                        value={inputKategori.stok_ready}
                      />
                    )}

                    {(value === 1 || value === 2 || value === 3) && (
                      <Input
                        label="Kuota Harian"
                        placeholder="Harga"
                        type="number"
                        onChange={(e) =>
                          setInput({ ...input, kuota_harian: e.target.value })
                        }
                        value={input.kuota_harian}
                      />
                    )}

                    {value === 4 && (
                      <Input
                        label="Stok Ready"
                        placeholder="Stok Ready"
                        type="number"
                        onChange={(e) =>
                          setInput({ ...input, stok_ready: e.target.value })
                        }
                        value={input.stok_ready}
                      />
                    )}
                  </TabPanel>
                ))}
                {kategori === 4 && (
                  <PenitipView
                    onChangePenitip={onChangePenitip}
                    idPenitip={id_penitip}
                  />
                )}
                {kategori === 5 && (
                  <ProdukView
                    arrayProduk={arrayProduk}
                    onChangeProduk={onChangeArray}
                  />
                )}
                {kategori != 4 && kategori != 5 && (
                  <div className="mt-4">
                    <BahanBakuView
                      arrayBahan={arrayBahan}
                      onChangeBahan={onChangeArray}
                    />
                  </div>
                )}
              </TabsBody>
            </Tabs>
            <div className="flex justify-end">
              <Button
                loading={isLoading}
                onClick={onAddProduk}
                className="bg-pink-primary"
              >
                Simpan
              </Button>
            </div>
          </div>
        </CardBody>
      </Card>
    </div>
  );
}

export default ProdukAdd;
