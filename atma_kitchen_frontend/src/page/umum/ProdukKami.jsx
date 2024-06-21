import React, { useEffect, useState } from "react";

import {
  Card,
  CardHeader,
  CardBody,
  Typography,
  Chip,
} from "@material-tailwind/react";

import { Swiper, SwiperSlide } from "swiper/react";

import "swiper/css";
import "swiper/css/grid";
import "swiper/css/pagination";
import "swiper/css/bundle";
import { Pagination, Grid } from "swiper/modules";
import { getStock } from "../../api/ApiPublikData";
import { baseImageUrl, kategoriProduk } from "../../utils/Constants";
import ShowDataProduk from "../../ui/show_data/ShowDataProduk";
import { rupiah } from "../../utils/rupiah";
function ProdukKami() {
  const [data, setData] = useState([]);

  useEffect(() => {
    getStock()
      .then((res) => {
        setData(res.data);
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);
  return (
    <div className="bg-slate-50 py-16 " id="ProdukKami">
      <div className="container mx-auto">
        <h1 className="text-center text-4xl text-pink-primary  font-semibold mb-10 ">
          Produk Kami
        </h1>
        <div className="">
          <Swiper
            slidesPerView={3}
            grid={{
              rows: 2,
              fill: "row",
            }}
            spaceBetween={40}
            pagination={{
              clickable: true,
            }}
            modules={[Grid, Pagination]}
          >
            {data?.map((item) => (
              <SwiperSlide key={item?.produk?.id} className="mb-10">
                <Card className="h-[450px]">
                  <CardHeader
                    color="transparent"
                    shadow={false}
                    floated={false}
                    className="relative h-56"
                  >
                    <img
                      src={
                        item?.produk?.foto
                          ? baseImageUrl + item?.produk?.foto
                          : `
            /blank_image.png`
                      }
                      alt="gambar"
                      className="w-full h-full object-cover
                      rounded-lg"
                    />
                    <Chip
                      className="rounded-full absolute top-4 z-50 right-4"
                      color={
                        kategoriProduk[item.produk?.id_kategori - 1]?.color
                      }
                      value={item?.produk?.kategori_produk?.nama}
                    />
                  </CardHeader>
                  <CardBody>
                    <Typography variant="h5" color="blue-gray" className="mb-2">
                      {item?.produk?.nama}
                    </Typography>
                    {item?.produk?.deskripsi && (
                      <Typography className="font-normal text-black">
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
                    {item?.stok ? (
                      <ShowDataProduk nama={"Stok Ready"} isi={item?.stok} />
                    ) : (
                      <ShowDataProduk nama={"Stok Ready"} isi={0} />
                    )}
                    {item?.kuota && (
                      <ShowDataProduk nama={"Kouta Harian"} isi={item?.kuota} />
                    )}
                  </CardBody>
                </Card>
              </SwiperSlide>
            ))}
          </Swiper>
        </div>
      </div>
    </div>
  );
}

export default ProdukKami;
