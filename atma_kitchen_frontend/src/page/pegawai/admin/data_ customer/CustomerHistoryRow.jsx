import React, { useState } from "react";
import { number, rupiah } from "../../../../utils/rupiah";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
  Button,
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
  Chip,
} from "@material-tailwind/react";
import { IoClose } from "react-icons/io5";
import { useNavigate } from "react-router-dom";
import { FaCheck, FaEye } from "react-icons/fa6";
import { setDate } from "../../../../utils/setDate";
import DetailHisotoryRow from "../../../customer/profil/DetailHisotoryRow";

function CustomerHistoryRow({ item }) {
  const [open, setOpen] = useState(false);
  const [dataTrx, setDataTrx] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const handleOpen = (item) => {
    setOpen(!open);
    console.log(item);
    setDataTrx(item);
  };
  return (
    <>
      <Table.Row>
        <div>{item.no_nota}</div>
        <div>{item.jenis_pengiriman}</div>
        <div>{item.metode_pembayaran}</div>
        <div>{setDate(item.tanggal_pesan)}</div>
        <div>{setDate(item.tanggal_siap)}</div>
        <div>{item.status_pesanan}</div>
        <Menu>
          <MenuHandler>
            <IconButton variant="text">
              <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
            </IconButton>
          </MenuHandler>
          <MenuList>
            <MenuItem onClick={() => handleOpen(item)}>
              <div className="flex gap-4">
                <FaEye />
                <span>Cek Detail</span>
              </div>
            </MenuItem>
          </MenuList>
        </Menu>
      </Table.Row>

      <Dialog
        size="md"
        open={open}
        handler={handleOpen}
        className="max-h-[90vh] overflow-y-auto"
      >
        <DialogHeader className="pb-0 flex justify-between items-center">
          Detail Transaksi {dataTrx.no_nota}
          <div className="flex justify-end items-center gap-4">
            {item.status_pesanan == "Selesai" ||
            item.status_pesanan == "Siap" ? (
              <Chip className="bg-green-600" value={item.status_pesanan} />
            ) : item.status_pesanan == "Batal" ? (
              <Chip className="bg-red-600" value={item.status_pesanan} />
            ) : (
              <Chip className="bg-yellow-800" value={item.status_pesanan} />
            )}
            <button onClick={handleOpen}>
              <IoClose />
            </button>
          </div>
        </DialogHeader>
        <DialogBody className="pt-4">
          <div className="flex justify-between items-start text-black gap-6">
            <div className="flex-1">
              <p className="font-semibold text-xl">Pesanan</p>
              <hr className="border-b-1 border-black" />
              <p className="flex justify-between">
                <span>No. Nota</span>
                <span>{dataTrx.no_nota}</span>
              </p>
              <p className="flex justify-between">
                <span>Tanggal Dipesan</span>
                <span>{setDate(dataTrx.tanggal_pesan)}</span>
              </p>
              <p className="flex justify-between">
                <span>Tanggal Disiapkan</span>
                <span>{setDate(dataTrx.tanggal_siap)}</span>
              </p>
              <p className="font-semibold text-xl mt-6">Detail Pembayaran</p>
              <hr className="border-b-1 border-black " />
              <p className="flex justify-between">
                <span>Jenis Pembayaran</span>
                <span>{dataTrx.metode_pembayaran}</span>
              </p>
              <p className="flex justify-between">
                <span>Dibayar pada</span>
                <span>{setDate(dataTrx.tanggal_lunas)}</span>
              </p>
              <p className="flex justify-between">
                <span>Harga</span>
                <span>{rupiah(dataTrx.total_pembayaran)}</span>
              </p>
              <p className="flex justify-between">
                <span>Tip</span>
                <span>{rupiah(dataTrx.tip)}</span>
              </p>
            </div>
            <div className="flex-1">
              <p className="font-semibold text-xl">Detail Pengiriman</p>
              <hr className="border-b-1 border-black" />
              <p className="flex justify-between">
                <span>Jenis Pengiriman</span>
                <span>{dataTrx.jenis_pengiriman}</span>
              </p>
              <p className="flex justify-between">
                <span>Biaya Pengiriman</span>
                <span>
                  {!dataTrx.ongkos_kirim ? "———" : rupiah(dataTrx.ongkos_kirim)}
                </span>
              </p>
              <p className="flex justify-between">
                <span>Alamat</span>
                <span>{dataTrx?.alamat?.alamat} Km</span>
              </p>
              <p className="flex justify-between">
                <span>Jarak</span>
                <span>{dataTrx?.alamat?.jarak} Km</span>
              </p>
            </div>
          </div>

          <div className="mt-4">
            <Table columns="grid-cols-[2fr,2fr,1fr,5.8rem]">
              <Table.Header>
                <div>Produk</div>
                <div>Nama</div>
                <div>Jumlah</div>
                <div>Harga</div>
              </Table.Header>
              <Table.Body
                data={item.detail_penjualans}
                isLoading={isLoading}
                render={(item) => (
                  <DetailHisotoryRow key={item.name} item={item} />
                )}
              />
            </Table>
          </div>
        </DialogBody>
      </Dialog>
    </>
  );
}

export default CustomerHistoryRow;
