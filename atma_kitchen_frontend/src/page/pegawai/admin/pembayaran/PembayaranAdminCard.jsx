import { useState } from "react";
import { FaUser } from "react-icons/fa";
import { FaImage } from "react-icons/fa6";
import { FaChevronDown, FaChevronUp } from "react-icons/fa";
import { IoIosCall } from "react-icons/io";
import { Button } from "@material-tailwind/react";
import { rupiah } from "../../../../utils/rupiah";
import { setDateTime } from "../../../../utils/setDate";
import { baseImageUrl } from "../../../../utils/Constants";
function PembayaranAdminCard({
  item: {
    id,
    no_nota,
    tanggal_pesan,
    bukti_pembayaran,
    harga_pesanan,
    grand_total,
    tanggal_siap,
    ongkos_kirim,
    customer,
    poin_dipakai,
  },
  onChangeId,
}) {
  console.log(baseImageUrl + bukti_pembayaran);
  const [isOpenImage, setIsOpenImage] = useState(false);
  return (
    <div className="bg-white rounded-lg h-min border border-slate-200">
      <div className="p-4 border-b border-gray-200">
        <div className="flex justify-between items-center">
          <h1 className="text-lg font-semibold text-gray-800">No nota</h1>
          <h1 className="text-base font-medium text-gray-800">{no_nota}</h1>
        </div>
      </div>
      <div className="p-4 flex flex-col gap-4">
        <div className="flex justify-between items-center">
          <div>
            <p className="text-sm text-gray-500">Tanggal Pesan</p>
            <h1 className="text-base font-semibold text-gray-800">
              {setDateTime(tanggal_pesan)}
            </h1>
          </div>
          <div>
            <p className="text-sm text-gray-500">Tanggal Siap</p>
            <h1 className="text-base font-semibold text-gray-800">
              {setDateTime(tanggal_siap)}
            </h1>
          </div>
        </div>
        <hr />
        <div className="flex gap-4 items-center">
          <FaUser className="text-pink-primary" />
          <div>
            <p className="text-sm text-gray-500">Nama Customer</p>
            <h1 className="text-base font-semibold text-gray-800">
              {customer.user.name}
            </h1>
          </div>
        </div>
        <div className="flex gap-4 items-center">
          <IoIosCall className="text-pink-primary" />
          <div>
            <p className="text-sm text-gray-500">No Telp</p>
            <h1 className="text-base font-semibold text-gray-800">
              {customer.no_telp}
            </h1>
          </div>
        </div>
        <div
          onClick={() => {
            setIsOpenImage(!isOpenImage);
          }}
          className="flex gap-4 items-center hover:cursor-pointer"
        >
          <FaImage className="text-pink-primary" />
          <div className="flex items-center justify-between w-full text-pink-primary">
            <p className="text-sm text-gray-500">Bukti Pembayaran</p>
            {isOpenImage ? <FaChevronUp /> : <FaChevronDown />}
          </div>
        </div>
        {isOpenImage && (
          <div className="flex justify-center">
            <img
              src={baseImageUrl + bukti_pembayaran}
              alt="bukti_pembayaran"
              className="h-48"
            />
          </div>
        )}
        <hr />
        <div className="flex gap-4 items-center justify-between">
          <p className="text-sm text-gray-500">Harga Pesanan</p>
          <h1 className="text-base font-semibold text-gray-800">
            {rupiah(harga_pesanan)}
          </h1>
        </div>
        <div className="flex gap-4 items-center justify-between">
          <p className="text-sm text-gray-500">Biaya Ongkir</p>
          <h1 className="text-base font-semibold text-gray-800">
            {rupiah(ongkos_kirim)}
          </h1>
        </div>
        {poin_dipakai > 0 ? (
          <div className="flex gap-4 items-center justify-between">
            <p className="text-sm text-gray-500">Bonus Poin</p>
            <h1 className="text-base font-semibold text-gray-800">
              -{rupiah(poin_dipakai * 100)}
            </h1>
          </div>
        ) : (
          <div className="flex gap-4 items-center justify-between">
            <p className="text-sm text-gray-500">Bonus Poin</p>
            <h1 className="text-base font-semibold text-gray-800">
              {rupiah(0)}
            </h1>
          </div>
        )}
        <div className="flex gap-4 items-center justify-between">
          <p className="text-sm text-gray-500">Grand Total</p>
          <h1 className="text-base font-semibold text-gray-800">
            {rupiah(grand_total)}
          </h1>
        </div>
      </div>
      <hr />
      <div className="flex justify-end p-4">
        <Button
          size="sm"
          className="bg-pink-primary"
          onClick={() => {
            onChangeId(id);
          }}
        >
          Konfirmasi Pembayaran
        </Button>
      </div>
    </div>
  );
}

export default PembayaranAdminCard;
