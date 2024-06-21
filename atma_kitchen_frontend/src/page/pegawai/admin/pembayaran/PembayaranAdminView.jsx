import { useState } from "react";
import { BsInfoCircle } from "react-icons/bs";
import { usePembayaranAdmin } from "./usePembayaranAdmin";
import { Spinner } from "@material-tailwind/react";
import PembayaranAdminCard from "./PembayaranAdminCard";
import {
  Input,
  Button,
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
} from "@material-tailwind/react";
import { setDateTime } from "../../../../utils/setDate";
import { rupiah } from "../../../../utils/rupiah";

function PembayaranAdminView() {
  const handleOpen = () => setOpen(!open);
  const onClear = () => {
    setJumlahPembayaran(0);
    setId(0);
  };
  const { data, isLoading, handleKonfirmasiPembayaran, isProcessing } =
    usePembayaranAdmin(handleOpen);
  const [open, setOpen] = useState(false);
  const [jumlahPembayaran, setJumlahPembayaran] = useState(0);
  const [id, setId] = useState(0);

  const selectedData = data.find((item) => item.id === id);

  const onChangeId = (id) => {
    onClear();
    setId(id);
    handleOpen();
  };

  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-800 mb-8">
        Pending Pembayaran
      </h1>
      <div className="p-4 flex items-center justify-between gap-4 bg-green-50 rounded-lg text-green-700 mb-4">
        <BsInfoCircle />
        <div className="flex-1">
          Data dibawah merupakan daftar pembayaran yang perlu dikonfirmasi
        </div>
      </div>

      <div className="grid lg:grid-cols-3 grid-cols-1 md:grid-cols-3 gap-4">
        {isLoading ? (
          <div className="col-span-3 flex justify-center items-center">
            <Spinner color="red" className="h-16 w-16 text-pink-primary" />
          </div>
        ) : data.length === 0 ? (
          <div className="col-span-3 flex justify-center items-center">
            <h1 className="text-lg font-semibold text-gray-800">
              Tidak ada data
            </h1>
          </div>
        ) : (
          data.map((item) => (
            <PembayaranAdminCard
              key={item.id}
              item={item}
              onChangeId={onChangeId}
            />
          ))
        )}
      </div>

      <Dialog
        open={open}
        size="md"
        handler={handleOpen}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>Input Pembayaran</DialogHeader>
        <DialogBody className="bg-slate-50">
          <div className="bg-white rounded-lg">
            <div className="p-4 border-b border-gray-200">
              <div className="flex justify-between items-center">
                <h1 className="text-lg font-semibold text-gray-800">No nota</h1>
                <h1 className="text-base font-medium text-gray-800">
                  {selectedData?.no_nota}
                </h1>
              </div>
            </div>
            <div className="p-4 flex flex-col gap-4">
              <div className="flex justify-between items-center">
                <div>
                  <p className="text-sm text-gray-500">Tanggal Pesan</p>
                  <h1 className="text-base font-semibold text-gray-800">
                    {setDateTime(selectedData?.tanggal_pesan)}
                  </h1>
                </div>
                <div>
                  <p className="text-sm text-gray-500">Tanggal Siap</p>
                  <h1 className="text-base font-semibold text-gray-800">
                    {setDateTime(selectedData?.tanggal_siap)}
                  </h1>
                </div>
              </div>
              <hr />
              <div className="flex gap-4 items-center">
                <div>
                  <p className="text-sm text-gray-500">Nama Customer</p>
                  <h1 className="text-base font-semibold text-gray-800">
                    {selectedData?.customer.user.name}
                  </h1>
                </div>
              </div>
              <div className="flex gap-4 items-center">
                <div>
                  <p className="text-sm text-gray-500">No Telp</p>
                  <h1 className="text-base font-semibold text-gray-800">
                    {selectedData?.customer.no_telp}
                  </h1>
                </div>
              </div>

              <hr />

              <div className="flex gap-4 items-center justify-between">
                <p className="text-sm text-gray-500">Harga Pesanan</p>
                <h1 className="text-base font-semibold text-gray-800">
                  {rupiah(selectedData?.harga_pesanan)}
                </h1>
              </div>
              <div className="flex gap-4 items-center justify-between">
                <p className="text-sm text-gray-500">Grand Total</p>
                <h1 className="text-base font-semibold text-gray-800">
                  {rupiah(selectedData?.grand_total)}
                </h1>
              </div>
              <hr />

              <div>
                <p className="text-sm text-gray-500">Pembayaran</p>
                <div className="flex  gap-0 items-center">
                  <Input
                    type="number"
                    placeholder="Masukan Jumlah Pembayaran"
                    className="rounded-r-none !border-t-blue-gray-200 focus:!border-t-gray-900"
                    labelProps={{
                      className: "before:content-none after:content-none",
                    }}
                    containerProps={{
                      className: "min-w-0",
                    }}
                    onChange={(e) => setJumlahPembayaran(e.target.value)}
                    value={jumlahPembayaran}
                  />
                  <div className="text-sm text-gray-700 bg-slate-100 h-10 flex items-center rounded-r-lg px-4">
                    Rp
                  </div>
                </div>
              </div>
            </div>
          </div>
        </DialogBody>
        <DialogFooter>
          <Button
            variant="text"
            color="red"
            onClick={handleOpen}
            className="mr-1"
          >
            <span>Cancel</span>
          </Button>

          <Button
            className="bg-pink-primary"
            loading={isProcessing}
            onClick={() => {
              handleKonfirmasiPembayaran(id, parseInt(jumlahPembayaran));
            }}
          >
            <span>Confirm</span>
          </Button>
        </DialogFooter>
      </Dialog>
    </div>
  );
}

export default PembayaranAdminView;
