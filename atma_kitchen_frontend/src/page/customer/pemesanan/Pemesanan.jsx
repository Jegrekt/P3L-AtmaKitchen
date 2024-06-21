import React, { useEffect, useState } from "react";
import {
  Card,
  CardHeader,
  CardBody,
  Typography,
  Button,
  CardFooter,
  Chip,
  Input,
  Spinner,
  Select,
} from "@material-tailwind/react";
import ShowDataProduk from "../../../ui/show_data/ShowDataProduk";
import { getStock } from "../../../api/ApiPublikData";
import { baseImageUrl, kategoriProduk } from "../../../utils/Constants";
import { FaMinus, FaPlus } from "react-icons/fa6";
import { customerPesan, getAlamatCustomer } from "../../../api/ApiPemesanan";
import { rupiah } from "../../../utils/rupiah";
import { setDate, toDateInputValue } from "../../../utils/setDate";
import { useNavigate, useSearchParams } from "react-router-dom";
import KonfirmasiDialog from "../../../ui/KonfirmasiDialog";
import { toast } from "sonner";
function Pemesanan() {
  const [dataProduk, setDataProduk] = useState([]);
  const [keranjangProduk, setKeranjangProduk] = useState([]);
  const [alamat, setAlamat] = useState("");
  const [listAlamat, setListAlamat] = useState([]);
  const [jenisPengiriman, setJenisPengiriman] = useState("");
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [open, setOpen] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const handleOpen = () => setOpen(!open);
  const twoDaysFromNow = new Date();
  twoDaysFromNow.setDate(twoDaysFromNow.getDate() + 2);
  const [tanggal, setTanggal] = useState(toDateInputValue(twoDaysFromNow));
  const [point, setPoint] = useState(0);

  const search = !searchParams.get("search") ? "" : searchParams.get("search");

  const navigate = useNavigate();
  const checkData = () => {
    if (keranjangProduk.length === 0) {
      toast.error("Keranjang masih kosong");
      return;
    } else if (jenisPengiriman === "") {
      toast.error("Pilih jenis pengiriman");
      return;
    } else if (jenisPengiriman === "Delivery" && alamat === "") {
      toast.error("Pilih alamat pengiriman");
      return;
    }
    handleOpen();
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };

  const calculateMinDate = () => {
    let today = new Date();
    let minDate = new Date(today);
    minDate.setDate(minDate.getDate() + 2);

    let minDateString = minDate.toISOString().slice(0, 10);
    return minDateString;
  };

  const hitungTotal = (keranjangProduk) => {
    let total = 0;
    keranjangProduk.map((item) => {
      let qty = item.qty;
      if (item.produk.id_kategori != 1) {
        qty = Math.ceil(qty);
      } else {
        qty = Math.round(qty * 2) / 2;
      }

      let subTotal = item.produk.harga * Math.floor(qty);
      if (qty % 1 == 0.5) {
        subTotal += item.produk.harga_setengah_loyang;
      }

      total += subTotal;
    });
    setTotal(total);
  };

  const increment = (produk) => {
    const find = keranjangProduk.find((item) => item.produk.id === produk.id);
    setKeranjangProduk((prev) => {
      let newList = [];
      if (!find) {
        if (produk.id_kategori == 1) {
          newList = [...prev, { produk: produk, qty: 0.5 }];
        } else {
          newList = [...prev, { produk: produk, qty: 1 }];
        }
      } else {
        newList = prev.map((item) => {
          if (item.produk.id === produk.id) {
            if (produk.id_kategori == 1) {
              return { ...item, qty: item.qty + 0.5 };
            } else {
              return { ...item, qty: item.qty + 1 };
            }
          }
          return item;
        });
      }
      hitungTotal(newList);
      return newList;
    });
  };

  const decrement = (produk) => {
    setKeranjangProduk((prev) => {
      let newList = prev.map((item) => {
        if (item.produk.id === produk.id) {
          if (produk.id_kategori == 1) {
            return { ...item, qty: item.qty - 0.5 };
          } else {
            return { ...item, qty: item.qty - 1 };
          }
        }
        return item;
      });
      hitungTotal(newList);
      return newList;
    });
  };

  const pesan = () => {
    setIsProcessing(true);
    customerPesan({
      tanggal_siap: tanggal,
      jenis_pengiriman: jenisPengiriman,
      id_alamat: alamat,
      poin: point,
      produks: keranjangProduk
        .filter((item) => item.qty > 0)
        .map((item) => {
          return {
            id_produk: item.produk.id,
            qty: item.qty,
          };
        }),
    })
      .then((res) => {
        console.log(res);
        navigate(`/view-pemesanan/${res.data.id}`);
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        toast.error(err.message);
        handleOpen();
        setIsProcessing(false);
      });
  };
  const fetchData = () => {
    setLoading(true);
    getStock(tanggal, search)
      .then((res) => {
        console.log(res.data);
        setDataProduk(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  };
  useEffect(() => {
    fetchData();
  }, [search, tanggal]);

  useEffect(() => {
    searchParams.set("page", 1);
    setSearchParams(searchParams);
  }, [search]);

  useEffect(() => {
    getAlamatCustomer()
      .then((res) => {
        setListAlamat(res.data);
        // console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);
  return (
    <>
      <div className="h-full">
        <h1 className="text-3xl font-semibold text-pink-primary">
          Pemesanan Atma Kitchen
        </h1>
        <div className="flex justify-between items-center w-full mt-4">
          <div className="w-1/3 md:w-72 ">
            <Input label="Search" type="search" onChange={handleSearch} />
          </div>
          <div className="w-1/3 md:w-72 ">
            <Input
              type="date"
              label="Jadwalkan untuk"
              min={calculateMinDate()}
              value={toDateInputValue(tanggal)}
              onChange={(e) => setTanggal(e.target.value)}
            />
          </div>
        </div>
        {loading ? (
          <div className="h-svh flex justify-center items-center">
            <Spinner
              color="red"
              className="h-20 w-20 -mt-72  text-pink-primary"
            />
          </div>
        ) : (
          <>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 md:gap-8 mt-4 items-start mb-80">
              <div className="md:col-span-3 gap-4">
                {dataProduk.map((item) => (
                  <Card className="w-full flex-row mb-4" key={item?.produk?.id}>
                    <CardHeader
                      shadow={false}
                      floated={false}
                      className="p-4 m-0 w-2/6 h-72 shrink-0 rounded-r-none flex justify-center items-center"
                    >
                      <img
                        src={
                          item?.produk?.foto
                            ? baseImageUrl + item?.produk?.foto
                            : `
            /blank_image.png`
                        }
                        alt="gambar"
                        className="w-full h-full object-cover rounded-lg"
                      />
                    </CardHeader>
                    <CardBody className="w-full flex flex-col s">
                      <div className="flex justify-between items-center">
                        <Typography className="text-2xl font-semibold text-black">
                          {item?.produk?.nama}
                        </Typography>
                        <Chip
                          className="rounded-full"
                          color={
                            kategoriProduk[item.produk?.id_kategori - 1]?.color
                          }
                          value={item?.produk?.kategori_produk?.nama}
                        />
                      </div>
                      {item?.produk?.deskripsi && (
                        <Typography className="mb-2">
                          {item?.produk?.deskripsi}
                        </Typography>
                      )}
                      {item?.produk?.deskripsi ? (
                        <ShowDataProduk
                          nama={"Harga"}
                          isi={item?.produk?.harga}
                        />
                      ) : (
                        <ShowDataProduk
                          nama={"Harga"}
                          isi={rupiah(item?.produk?.harga)}
                          className={"mt-2"}
                        />
                      )}

                      {item?.produk?.harga_setengah_loyang != null && (
                        <ShowDataProduk
                          nama={"Harga ½ loyang"}
                          isi={rupiah(item?.produk?.harga_setengah_loyang)}
                        />
                      )}

                      {item?.produk?.id_kategori == 4 && (
                        <ShowDataProduk nama={"Stok Ready"} isi={item?.stok} />
                      )}

                      {item?.produk?.id_kategori != 4 &&
                        item?.produk?.id_kategori != 5 && (
                          <ShowDataProduk
                            nama={"Kouta Harian"}
                            isi={`${item?.kuota} ${item?.produk?.kategori_produk?.satuan}`}
                          />
                        )}

                      <div className="absolute bottom-8 right-8 w-full flex justify-end items-center mt-6 gap-2 ">
                        <Button
                          size="sm"
                          className="bg-pink-primary"
                          onClick={() => decrement(item.produk)}
                          disabled={
                            !keranjangProduk.find(
                              (keranjang) =>
                                keranjang.produk.id === item?.produk?.id
                            )?.qty > 0 ?? true
                          }
                        >
                          <FaMinus />
                        </Button>
                        <div className="">
                          <p>
                            {keranjangProduk.find(
                              (keranjang) =>
                                keranjang.produk.id === item?.produk?.id
                            )?.qty ?? 0}
                          </p>
                        </div>
                        <Button
                          size="sm"
                          className="bg-pink-primary"
                          onClick={() => increment(item.produk)}
                        >
                          <FaPlus />
                        </Button>
                      </div>
                    </CardBody>
                  </Card>
                ))}
              </div>
              <div className="h-min sticky top-4">
                <Card className="">
                  <CardBody className="pb-0">
                    <h1 className="text-xl text-pink-primary font-semibold">
                      Keranjang Pemesanan
                    </h1>

                    {keranjangProduk.map((item) => {
                      return (
                        item.qty > 0 && (
                          <>
                            <div
                              key={item.id_produk}
                              className="flex justify-between items-center font-normal"
                            >
                              <div className="text-black">
                                <Typography className="">
                                  {item.produk.nama}
                                </Typography>
                                <Typography className="text-sm">
                                  Harga:{" "}
                                  {item.qty % 1 != 0
                                    ? rupiah(item.produk.harga_setengah_loyang)
                                    : rupiah(item.produk.harga)}
                                </Typography>
                              </div>
                              <Typography>{item.qty}</Typography>
                            </div>
                            <hr className="my-2 border border-pink-secondary" />
                          </>
                        )
                      );
                    })}
                  </CardBody>
                  <CardFooter className="pt-0 my-2">
                    <select
                      value={jenisPengiriman}
                      className="w-full border border-black/30 active:border-black focus:border-black  rounded-lg p-2 mb-2"
                      onChange={(e) => setJenisPengiriman(e.target.value)}
                    >
                      <option value="" disabled hidden>
                        Pilih Jenis Pengiriman
                      </option>
                      <option value="Delivery">Delivery</option>
                      <option value="Pick-Up">Pick-Up</option>
                    </select>

                    {jenisPengiriman == "Delivery" && (
                      <select
                        label="Select Version"
                        value={alamat}
                        className="w-full border border-black/30 active:border-black focus:border-black  rounded-lg p-2 mb-2"
                        onChange={(e) => setAlamat(e.target.value)}
                      >
                        <option value="" disabled hidden>
                          Pilih Alamat
                        </option>
                        {listAlamat.map((item) => {
                          return (
                            <option
                              className="py-2"
                              key={item.id}
                              value={item.id}
                            >
                              {item.alamat}
                            </option>
                          );
                        })}
                      </select>
                    )}

                    <div className="mb-2">
                      <Input
                        type="number"
                        label="Masukan Poin"
                        value={point}
                        onChange={(e) => setPoint(e.target.value)}
                      />
                    </div>
                    <div className="flex items-center justify-between px-1">
                      <p>Total</p>
                      <p>{total == 0 ? "-" : rupiah(total)}</p>
                    </div>
                    <hr className="my-2 border border-pink-secondary" />
                    <Button
                      className="w-full bg-pink-primary"
                      onClick={checkData}
                    >
                      Beli
                    </Button>
                  </CardFooter>
                </Card>
              </div>
            </div>
          </>
        )}
      </div>
      <KonfirmasiDialog
        handleAdd={pesan}
        handleOpenKonfirmasi={handleOpen}
        konfirmasi="memesan"
        openKonfirmasi={open}
        isProcessing={isProcessing}
      />
    </>
  );
}

export default Pemesanan;
