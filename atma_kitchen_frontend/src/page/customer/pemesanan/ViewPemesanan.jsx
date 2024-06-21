import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getPemesananById } from "../../../api/ApiPemesanan";
import { Button, Card, CardBody, Typography } from "@material-tailwind/react";
import ButtonBack from "../../../ui/ButtonBack";
import ShowDataProduk from "../../../ui/show_data/ShowDataProduk";
import ShowDataNota from "../../../ui/show_data/ShowDataNota";
import { setDateTime } from "../../../utils/setDate";
import { rupiah } from "../../../utils/rupiah";

function ViewPemesanan() {
  const { id } = useParams();
  const [data, setData] = useState({});

  useEffect(() => {
    getPemesananById(id)
      .then((res) => {
        setData(res);
        console.log(res);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [id]);
  return (
    <div>
      <div className="flex justify-between items-center mb-10 print:hidden print:mb-0">
        <h1 className="text-3xl font-semibold text-pink-primary ">
          Nota Transaksi
        </h1>
        <ButtonBack />
      </div>
      <Card
        className="max-w-2xl mx-auto print:bg-transparent print:shadow-none print:-mt-10 bg mb-40"
        color="transparent"
      >
        <CardBody className="print:bg-transparent">
          <div>
            <div className="flex justify-between items-center">
              <h1 className="text-xl font-semibold text-black">Atma Kitchen</h1>
              <Button
                className="bg-pink-primary print:hidden"
                onClick={() => window.print()}
              >
                Print
              </Button>
            </div>
            <p>Jl. Centralpark No. 10 Yogyakarta</p>
          </div>
          <div className="mt-6">
            <ShowDataNota nama={"No Nota"} isi={data?.no_nota} />
            <ShowDataNota
              nama={"Tanggal pesan"}
              isi={setDateTime(data?.tanggal_pesan)}
            />
            {data?.tanggal_lunas && (
              <ShowDataNota
                nama={"Lunas pada"}
                isi={setDateTime(data?.tanggal_lunas)}
              />
            )}
            {data?.tanggal_ambil && (
              <ShowDataNota
                nama={"Tanggal ambil"}
                isi={setDateTime(data?.tanggal_ambil)}
              />
            )}
          </div>
          <div className="mt-8">
            <p>
              <span className="font-semibold text-black">Customer</span>{" "}
              <span className="ms-4 me-2">:</span>
              {data?.customer?.user?.username} / {data?.customer?.user?.name}
            </p>
            <p>{data?.alamat?.alamat}</p>
          </div>
          <div className="mt-6 max-w-lg">
            {data?.detail_penjualans?.map((item) => (
              <div className="flex justify-between  items-center">
                <div className="flex">
                  <p className="me-2">{item?.qty}</p>
                  <p>{item?.produk?.nama}</p>
                </div>
                <p>
                  {item?.qty % 1 == 0
                    ? rupiah(item?.produk?.harga)
                    : rupiah(item?.produk?.harga_setengah_loyang)}
                </p>
              </div>
            ))}
          </div>
          <div className="mt-6 max-w-lg">
            <div className="flex justify-between  items-center">
              <p className="me-2">Total Harga Produk</p>
              <p>{rupiah(data?.harga_pesanan)}</p>
            </div>
            <div className="flex justify-between  items-center">
              <p className="me-2">Ongkos Kirim</p>
              <p>{rupiah(data?.ongkos_kirim)}</p>
            </div>

            {data?.poin_dipakai > 0 && (
              <>
                <div className="flex justify-between  items-center">
                  <p className="me-2">Total Produk + Ongkir</p>
                  <p>{rupiah(data?.harga_pesanan + data?.ongkos_kirim)}</p>
                </div>
                <div className="flex justify-between  items-center">
                  <p className="me-2">Potongan {data?.poin_dipakai} poin</p>
                  <p className="text-red-500">
                    -{rupiah(data?.poin_dipakai * 100)}
                  </p>
                </div>
              </>
            )}
            <hr className="my-2 border " />
            <div className="flex justify-between  items-center">
              <p className="me-2">Total Semua</p>
              <p className="text-green-500">{rupiah(data?.grand_total)}</p>
            </div>
          </div>
          <div className="mt-6 max-w-lg">
            <Typography className={`flex `}>
              <span className="w-[170px]">Poin dari pesanan ini</span> :{" "}
              <span className="ms-2 font-normal">{data?.poin_didapat}</span>
            </Typography>
            <Typography className={`flex `}>
              <span className="w-[170px]">Total poin customer</span> :{" "}
              <span className="ms-2 font-normal">{data?.customer?.poin}</span>
            </Typography>
          </div>
        </CardBody>
      </Card>
    </div>
  );
}

export default ViewPemesanan;
