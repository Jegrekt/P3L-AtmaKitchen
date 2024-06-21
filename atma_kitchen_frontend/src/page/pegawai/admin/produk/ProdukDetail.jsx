import { useState, useEffect } from "react";
import {
  Card,
  CardHeader,
  CardBody,
  Chip,
  Spinner,
  Button,
  Dialog,
  DialogHeader,
  DialogBody,
  Input,
  Switch,
  CardFooter,
  Tabs,
  TabsHeader,
  Tab,
} from "@material-tailwind/react";
import { useDetailProduk } from "./useDetailProduk";
import { rupiah } from "../../../../utils/rupiah";
import BahanBakuView from "../bahan_baku/BahanBakuView";
import ProdukView from "./ProdukView";
import Table from "../../../../ui/Table";
import { baseImageUrl, kategoriProduk } from "../../../../utils/Constants";

import { FaPencil } from "react-icons/fa6";
import { useUpdateProduk } from "./useUpdateProduk";
import ButtonTo from "../../../../ui/ButtonTo";
import PenitipView from "../../mo/penitip/PenitipView";
import { toast } from "sonner";

function ProdukDetail() {
  const { data, isLoading, fetchData } = useDetailProduk();
  const [open, setOpen] = useState(false);
  const [checked, setChecked] = useState(false);
  const {
    isProcessing,
    updateFoto,
    updateProduk,
    updateResep,
    updateHampers,
    updatePenitip,
  } = useUpdateProduk(setOpen, fetchData, setChecked);
  const [image, setImage] = useState(null);
  const [kategori, setKategori] = useState(1);
  const [id_penitip, setIdPenitip] = useState(0);
  const [informasiProduk, setInformasiProduk] = useState({
    nama: "",
    harga: "",
    harga_setengah_loyang: "",
    stok_ready: "",
    kuota_harian: "",
  });
  const [arrayBahan, setArrayBahan] = useState([]);
  const [arrayProduk, setArrayProduk] = useState([]);

  const fillInformasi = () => {
    setInformasiProduk({
      nama: data.nama,
      harga: data.harga,
      harga_setengah_loyang: data.harga_setengah_loyang,
      stok_ready: data.stok_ready,
      kuota_harian: data.kuota_harian,
    });
    setKategori(data.id_kategori);
    setIdPenitip(data.id_penitip);
  };

  useEffect(() => {
    fillInformasi();
  }, [data]);

  const handleOpen = () => {
    fillInformasi();
    setOpen(!open);
    setImage(null);
  };
  const handleImageChange = (e) => {
    setImage(e.target.files[0]);
  };

  const onSubmitFoto = () => {
    const formData = new FormData();
    formData.append("foto", image);
    updateFoto(data.id, formData);
  };

  const onChangePenitip = (id) => {
    setIdPenitip(id);
  };

  const onSubmitProduk = () => {
    updateProduk(data.id, {
      ...informasiProduk,
      harga: parseInt(informasiProduk.harga),
      harga_setengah_loyang: parseInt(informasiProduk.harga_setengah_loyang),
      id_kategori: kategori,
      id_penitip: data.id_penitip,
    });
  };

  const onSubmitData = () => {
    if (data.id_kategori != 5) {
      updateResep(data.id, {
        resep: arrayBahan,
      });
      return;
    }
    updateHampers(data.id, {
      hampers: arrayProduk,
    });
  };

  const onUpdatePenitip = () => {
    if (id_penitip === 0) {
      toast.error("Penitip tidak boleh kosong");
      return;
    }
    updatePenitip(data.id, {
      id_penitip,
    });
  };

  const onChangeSwitch = (e) => {
    setChecked(e.target.checked);
    if (e.target.checked) {
      if (data?.id_kategori === 5) {
        setArrayProduk(
          data?.detail_hampers.map((item) => ({
            id_produk: item.id_produk,
            qty: item.qty,
          }))
        );
      } else {
        setArrayBahan(
          data?.produk_bahans.map((item) => ({
            id_bahan_baku: item.bahan_baku.id,
            qty: item.qty,
          }))
        );
      }
    } else {
      setArrayBahan([]);
    }
  };

  const onChangeArray = (id, checked, qty, isEdit) => {
    if (checked) {
      if (isEdit) {
        if (data?.id_kategori === 5) {
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
      if (data?.id_kategori === 5) {
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
      if (data?.id_kategori === 5) {
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

  if (isLoading)
    return (
      <div className="flex justify-center items-center my-10">
        <Spinner color="red" className="h-16 w-16 text-pink-primary" />
      </div>
    );

  return (
    <div className="">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-2xl font-semibold ">Detail Produk</h1>
        <ButtonTo path="/produk" />
      </div>

      <div className="flex justify-between gap-4 mb-8">
        <Card className="w-1/3">
          <CardHeader
            color="transparent"
            floated={false}
            shadow={false}
            className="m-0 px-6 pt-4 rounded-none"
          >
            <div className="mb-4 flex items-center justify-between">
              <h1 className="text-sm text-pink-primary">Informasi Produk</h1>
              <FaPencil
                onClick={handleOpen}
                className="text-gray-600 hover:cursor-pointer"
              />
            </div>

            <img
              src={
                data?.foto
                  ? baseImageUrl + data?.foto
                  : `
            /blank_image.png`
              }
              alt="gambar"
              className="w-full h-80 mb-4 object-cover rounded-lg"
            />
            <div className="flex items-center justify-between">
              <h1 className="text-lg font-medium">{data.nama}</h1>
              <Chip
                color={kategoriProduk[data.id_kategori - 1]?.color}
                value={data?.kategori_produk?.nama}
              />
            </div>
          </CardHeader>
          <CardBody>
            <div className="flex flex-col gap-2">
              <hr />
              <div className="flex justify-between gap-8">
                <p color="gray" className="font-semibold">
                  Satuan
                </p>
                <p>{data?.kategori_produk?.satuan}</p>
              </div>
              <hr />
              <div className="flex justify-between gap-8">
                <p color="gray" className="font-semibold">
                  Harga
                </p>
                <p className="text-lg font-numeric text-green-600">
                  {rupiah(data.harga)}
                </p>
              </div>
              <div className="flex justify-between gap-8">
                <p color="gray" className="font-semibold">
                  Harga Setengah Loyang
                </p>
                <p className="text-lg font-numeric">
                  {rupiah(data.harga_setengah_loyang)}
                </p>
              </div>
              <hr />
              <div className="flex justify-between gap-8">
                <p color="gray" className="font-semibold">
                  Kuota Harian
                </p>
                <p className="text-lg font-numeric">
                  {data.kuota_harian ? data.kuota_harian : "-"}
                </p>
              </div>
              <div className="flex justify-between gap-8">
                <p color="gray" className="font-semibold">
                  Stok Ready
                </p>
                <p className="text-lg font-numeric">
                  {data.stok_ready ? data.stok_ready : "-"}
                </p>
              </div>
            </div>
          </CardBody>
        </Card>

        {data.id_penitip && (
          <Card className="w-2/3 h-min">
            <CardHeader
              color="transparent"
              floated={false}
              shadow={false}
              className="m-0 px-6 pt-4 rounded-none"
            >
              <h1 className="text-sm text-pink-primary mb-2">
                Informasi Penitip
              </h1>
            </CardHeader>
            <CardBody>
              <div className="flex flex-col gap-2">
                <div className="flex justify-between gap-8">
                  <p color="gray" className="font-semibold">
                    Nama
                  </p>
                  <p>{data?.penitip?.nama}</p>
                </div>
                <div className="flex justify-between gap-8">
                  <p color="gray" className="font-semibold">
                    Alamat
                  </p>
                  <p>{data?.penitip?.alamat}</p>
                </div>
                <div className="flex justify-between gap-8">
                  <p color="gray" className="font-semibold">
                    No Telepon
                  </p>
                  <p>{data?.penitip?.no_telp}</p>
                </div>
              </div>
            </CardBody>
          </Card>
        )}
      </div>
      {data?.id_kategori != 4 ? (
        <Card>
          <CardHeader
            color="transparent"
            floated={false}
            shadow={false}
            className="m-0 px-6 pt-4 rounded-none"
          >
            <div className="flex justify-between items-center pb-4">
              <h1 className="text-sm text-pink-primary">
                Informasi {data?.id_kategori === 5 ? "Produk" : "Bahan Baku"}
              </h1>
              <Switch
                color="pink"
                value={checked}
                onChange={onChangeSwitch}
                label="Edit Mode"
              />
            </div>
          </CardHeader>
          <CardBody>
            {data?.id_kategori === 5 ? (
              checked ? (
                <ProdukView
                  arrayProduk={arrayProduk}
                  onChangeProduk={onChangeArray}
                />
              ) : (
                <Table columns="grid-cols-[1fr,1fr,1fr,1fr]">
                  <Table.Header>
                    <div></div>
                    <div>Nama</div>
                    <div>Qty</div>
                    <div>Kategori</div>
                  </Table.Header>
                  <Table.Body
                    data={data?.detail_hampers}
                    isLoading={isLoading}
                    render={(item) => (
                      <Table.Row>
                        <div>
                          <img
                            className="
                            w-32 h-32 object-contain rounded-lg
                          "
                            src={
                              item.produk.foto
                                ? baseImageUrl + item.produk.foto
                                : "/blank_image.png"
                            }
                            alt=""
                          />
                        </div>
                        <div>{item.produk.nama}</div>
                        <div>{item.qty}</div>
                        <div>
                          <Chip
                            className="w-min"
                            color={
                              kategoriProduk[item.produk.id_kategori - 1]?.color
                            }
                            value={
                              kategoriProduk[item.produk.id_kategori - 1].label
                            }
                          />
                        </div>
                      </Table.Row>
                    )}
                  />
                </Table>
              )
            ) : checked ? (
              <BahanBakuView
                arrayBahan={arrayBahan}
                onChangeBahan={onChangeArray}
              />
            ) : (
              <Table columns="grid-cols-[1fr,1fr,1fr,1fr]">
                <Table.Header>
                  <div>Nama</div>
                  <div>Satuan</div>
                  <div>Stok</div>
                  <div>Kuantitas</div>
                </Table.Header>
                <Table.Body
                  data={data?.produk_bahans}
                  isLoading={isLoading}
                  render={(item) => (
                    <Table.Row>
                      <div>{item.bahan_baku.nama}</div>
                      <div>{item.bahan_baku.satuan}</div>
                      <div>{item.bahan_baku.stok}</div>
                      <div>{item.qty}</div>
                    </Table.Row>
                  )}
                />
              </Table>
            )}
          </CardBody>
          <CardFooter>
            {checked && (
              <div className="flex justify-end">
                <Button
                  loading={isProcessing}
                  className="flex items-center gap-3 bg-pink-primary"
                  onClick={onSubmitData}
                >
                  Update
                </Button>
              </div>
            )}
          </CardFooter>
        </Card>
      ) : (
        <Card>
          <CardBody>
            <PenitipView
              onChangePenitip={onChangePenitip}
              idPenitip={id_penitip}
            />
          </CardBody>
          <CardFooter>
            <div className="flex justify-end">
              <Button
                loading={isProcessing}
                className="flex items-center gap-3 bg-pink-primary"
                onClick={onUpdatePenitip}
              >
                Update Penitip
              </Button>
            </div>
          </CardFooter>
        </Card>
      )}
      <Dialog
        open={open}
        handler={handleOpen}
        className="overflow-y-auto h-[95vh]"
      >
        <DialogHeader>Update Informasi Produk</DialogHeader>
        <DialogBody>
          <div className="flex flex-col gap-4">
            <div className="flex flex-col gap-2">
              <h1 className="text-sm text-pink-primary">Foto Produk</h1>
              <div className="relative inline-block w-full">
                <input
                  type="file"
                  className="
                    file:absolute file:right-0 
                    file:bg-white file:text-pink-primary file:border-0
                    file:py-1 file:px-3 file:rounded-lg"
                  onChange={handleImageChange}
                />
              </div>
              <img
                className="w-full h-80 object-cover rounded-lg"
                src={
                  image
                    ? URL.createObjectURL(image)
                    : data?.foto
                      ? baseImageUrl + data?.foto
                      : "/blank_image.png"
                }
                alt="gambar"
              />
              <div className="flex justify-end">
                <Button
                  className=" bg-pink-primary"
                  onClick={onSubmitFoto}
                  loading={isProcessing}
                >
                  Update Foto
                </Button>
              </div>
            </div>
            <hr />
            <div className="flex flex-col gap-2">
              <h1 className="text-sm text-pink-primary">Informasi Produk</h1>
              <Tabs value={kategori} className="mb-2">
                <TabsHeader>
                  {kategoriProduk.map(({ label, value }) => (
                    <Tab
                      key={value}
                      value={value}
                      onClick={() => setKategori(value)}
                    >
                      {label}
                    </Tab>
                  ))}
                </TabsHeader>
              </Tabs>
              <Input
                label="Nama"
                type="text"
                size="lg"
                placeholder="Masukan Nama"
                value={informasiProduk.nama}
                onChange={(e) =>
                  setInformasiProduk({
                    ...informasiProduk,
                    nama: e.target.value,
                  })
                }
              />
              <Input
                label="Harga"
                type="number"
                size="lg"
                placeholder="Masukan Harga"
                value={informasiProduk.harga}
                onChange={(e) =>
                  setInformasiProduk({
                    ...informasiProduk,
                    harga: e.target.value,
                  })
                }
              />
              {kategori === 4 && (
                <Input
                  label="Stok Ready"
                  type="number"
                  size="lg"
                  placeholder="Masukan Stok Ready"
                  value={informasiProduk.stok_ready}
                  onChange={(e) =>
                    setInformasiProduk({
                      ...informasiProduk,
                      stok_ready: e.target.value,
                    })
                  }
                />
              )}
              {kategori === 1 && (
                <Input
                  label="Harga Setengah Loyang"
                  type="number"
                  size="lg"
                  placeholder="Masukan Harga Setengah Loyang"
                  value={informasiProduk.harga_setengah_loyang}
                  onChange={(e) =>
                    setInformasiProduk({
                      ...informasiProduk,
                      harga_setengah_loyang: e.target.value,
                    })
                  }
                />
              )}
              {(kategori === 1 || kategori === 2 || kategori === 3) && (
                <Input
                  label="Kuota Harian"
                  type="number"
                  size="lg"
                  placeholder="Masukan Kuota Harian"
                  value={informasiProduk.kuota_harian}
                  onChange={(e) =>
                    setInformasiProduk({
                      ...informasiProduk,
                      kuota_harian: e.target.value,
                    })
                  }
                />
              )}
              <div className="flex justify-end">
                <Button
                  className="w-min bg-pink-primary"
                  onClick={onSubmitProduk}
                  loading={isProcessing}
                >
                  Update
                </Button>
              </div>
            </div>
          </div>
        </DialogBody>
      </Dialog>
    </div>
  );
}

export default ProdukDetail;
