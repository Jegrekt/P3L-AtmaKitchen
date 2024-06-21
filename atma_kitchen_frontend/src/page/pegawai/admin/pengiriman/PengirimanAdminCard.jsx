import { FaUser } from "react-icons/fa";
import { FaHouse } from "react-icons/fa6";
import { IoIosCall } from "react-icons/io";
import { Button } from "@material-tailwind/react";
import { rupiah } from "../../../../utils/rupiah";
import { setDateTime } from "../../../../utils/setDate";

function PengirimanAdminCard({
  item: {
    id,
    no_nota,
    tanggal_pesan,
    tanggal_siap,
    customer,
    alamat,
    harga_pesanan,
    grand_total,
  },
  onChangeId,
}) {
  return (
    <div className="bg-white rounded-lg border-slate-200">
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
        <div className="flex gap-4 items-center">
          <FaHouse className="text-pink-primary w-10" />
          <div>
            <p className="text-sm text-gray-500">Alamat</p>
            <h1 className="text-sm font-medium text-gray-800">
              {alamat.alamat}
            </h1>
          </div>
        </div>
        <hr />
        <div className="flex gap-4 items-center justify-between">
          <p className="text-sm text-gray-500">Harga Pesanan</p>
          <h1 className="text-base font-semibold text-gray-800">
            {rupiah(harga_pesanan)}
          </h1>
        </div>
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
          Input Jarak
        </Button>
      </div>
    </div>
  );
}

export default PengirimanAdminCard;
