import {
  Button,
  Dialog,
  DialogBody,
  DialogFooter,
  DialogHeader,
  Input,
  Spinner,
} from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import Table from "../../../../ui/Table";
import {
  getPendingKonfirmasi,
  cekBahanBaku,
  konfirmasiPembuatan,
} from "../../../../api/ApiPendingKonfirmasi";
import { useSearchParams } from "react-router-dom";
import Pagination from "../../../../ui/Pagination";
import KonfirmasiRow from "./KonfirmasiRow";
import { toast } from "sonner";
import KonfirmasiDialog from "../../../../ui/KonfirmasiDialog";
function Konfirmasi() {
  const [data, setData] = useState([]);
  const [dataBahan, setDataBahan] = useState([]);
  const [totalData, setTotalData] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [loading, setLoading] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const [id, setId] = useState(0);
  const [ketarangan, setKeterangan] = useState("");
  const page = !searchParams.get("page") ? 1 : Number(searchParams.get("page"));
  const search = !searchParams.get("search") ? "" : searchParams.get("search");
  const [status, setStatus] = useState(false);
  const [open, setOpen] = useState(false);
  const handleOpen = () => {
    setOpen(!open);

    if (open == true) fetchBahanBaku();
  };

  const [openKonfirmasi, setOpenKonfirmasi] = useState(false);
  const handleOpenKonfirmasi = () => {
    setOpenKonfirmasi(!openKonfirmasi);
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };

  const fetchData = (page, search) => {
    setIsLoading(true);
    getPendingKonfirmasi(page, search)
      .then((res) => {
        setData(res.data);
        console.log(res);
        setTotalData(res.total);
        setIsLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setIsLoading(false);
      });
  };
  useEffect(() => {
    fetchData(page, search);
  }, [page, search]);

  useEffect(() => {
    searchParams.set("page", 1);
    setSearchParams(searchParams);
  }, [search]);
  const fetchBahanBaku = () => {
    setLoading(true);
    console.log(id);
    cekBahanBaku(id)
      .then((res) => {
        setDataBahan(res.data);
        console.log(id);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  };
  useEffect(() => {
    console.log(id);
    if (id !== 0) {
      fetchBahanBaku();
    }
  }, [id]);

  const konfirmasiPesan = (status) => {
    setIsProcessing(true);
    konfirmasiPembuatan(id, status)
      .then((res) => {
        console.log(res);
        toast.success("Berhasil mengkonfirmasi pesanan");
        if (status == false) {
          toast.success("Stok dan Kouta berhasil dikembalikan");
        } else if (status == true) {
          toast.success("Poin Customer Berhasil di transfer");
        }
        fetchData(page, search);
        handleOpenKonfirmasi();
        setIsProcessing(false);
      })
      .catch((err) => {
        console.log(err);
        setIsProcessing(false);
      });
  };
  return (
    <>
      <div className="w-full">
        <div className="flex w-full justify-between mb-4">
          <h1 className="text-2xl font-semibold text-gray-800 mb-4">
            Data Pemesanan Customer
          </h1>
          <div className="w-full md:w-72">
            <Input label="Search" type="search" onChange={handleSearch} />
          </div>
        </div>
        <Table columns="grid-cols-[2fr,2fr,2fr,2fr,2fr,3.2rem]">
          <Table.Header>
            <div>No Nota</div>
            <div>Jenis Pengiriman</div>
            <div>Tanggap Siap</div>
            <div>Total Harga</div>
            <div>Tip</div>
            <div></div>
          </Table.Header>
          <Table.Body
            data={data}
            isLoading={isLoading}
            render={(item) => (
              <KonfirmasiRow
                key={item.name}
                item={item}
                handleOpen={handleOpen}
                setId={setId}
              />
            )}
          />
          <Table.Footer>
            <Pagination count={totalData} />
          </Table.Footer>
        </Table>
      </div>
      <Dialog
        open={open}
        size="lg"
        handler={handleOpen}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>Konfrimasi Pemesanan Customer</DialogHeader>
        <DialogBody className="max-h-[75vh] overflow-y-auto">
          {loading ? (
            <div className="flex items-center justify-center">
              <Spinner
                color="red"
                className="relative h-20 w-20  text-pink-primary"
              />
            </div>
          ) : (
            <div className="grid grid-cols-2 divide-x">
              {dataBahan?.produk_po?.length > 0 && (
                <>
                  <div>
                    <h1 className="text-xl mb-2 font-semibold text-black">
                      Produk:{" "}
                    </h1>
                    {dataBahan?.produk_po?.map((item) => (
                      <>
                        <div key={item?.produk?.id} className="mb-2">
                          <h1 className="font-semibold text-black">
                            {item?.qty} {item?.produk?.nama}{" "}
                          </h1>
                          {item?.produk?.produk_bahans?.map((bahan) => (
                            <p className="text-black">
                              {bahan?.qty}
                              {bahan?.bahan_baku?.satuan}{" "}
                              {bahan?.bahan_baku?.nama}
                            </p>
                          ))}
                        </div>
                      </>
                    ))}
                  </div>
                  <div className="pl-4">
                    <h1 className="text-xl font-semibold text-black mb-2">
                      Recap:{" "}
                    </h1>
                    {dataBahan?.rekap_bahan?.map((item) => (
                      <div className="text-black flex items-center gap-2 ">
                        <p className="flex">
                          {item?.nama} {item?.stok?.dibutuhkan} {item?.satuan}
                        </p>
                        {item?.stok?.dibutuhkan > item?.stok?.tersedia && (
                          <p className="text-red-500">{`{WARNING: STOK ${item?.stok?.tersedia} ${item?.satuan}}`}</p>
                        )}
                      </div>
                    ))}
                  </div>
                </>
              )}
            </div>
          )}
        </DialogBody>
        <DialogFooter className="pt-0">
          <Button
            color="red"
            className="mr-1 flex justify-center"
            onClick={() => {
              setStatus(false);
              setKeterangan("Menolak");
              handleOpenKonfirmasi();
            }}
          >
            <span>Tolak</span>
          </Button>

          <Button
            className="bg-pink-primary"
            onClick={() => {
              setStatus(true);
              setKeterangan("Menerima");
              handleOpenKonfirmasi();
            }}
          >
            <span>Terima</span>
          </Button>
        </DialogFooter>
      </Dialog>
      <KonfirmasiDialog
        handleAdd={() => konfirmasiPesan(status)}
        handleOpen={handleOpen}
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        isProcessing={isProcessing}
        openKonfirmasi={openKonfirmasi}
        konfirmasi={ketarangan}
      />
    </>
  );
}

export default Konfirmasi;
