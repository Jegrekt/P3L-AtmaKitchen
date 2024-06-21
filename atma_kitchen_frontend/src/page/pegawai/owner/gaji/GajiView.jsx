import React, { useEffect, useState } from "react";
import {
  Input,
  Button,
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
  Textarea,
} from "@material-tailwind/react";

import Table from "../../../../ui/Table";
import { useGaji } from "./useGaji";
import { Toaster, toast } from "sonner";
import { useSearchParams } from "react-router-dom";
import GajiRow from "./GajiRow";
import Pagination from "../../../../ui/Pagination";
import { rupiah } from "../../../../utils/rupiah";
function GajiView() {
  const handleOpen = () => setOpen(!open);
  const handleOpenBonus = () => setOpenBonus(!openBonus);
  const [searchParams, setSearchParams] = useSearchParams();
  const {
    data,
    totalData,
    isLoading,
    isProcessing,
    updateBonusKaryawan,
    updateGajiKaryawan,
  } = useGaji(handleOpen, handleOpenBonus);

  const [gaji, setGaji] = useState(0);
  const [bonus, setBonus] = useState(0);

  const [id, setId] = useState(0);
  const [role, setRole] = useState("");
  const [namaTampil, setNamaTampil] = useState("");
  const [open, setOpen] = useState(false);
  const [openBonus, setOpenBonus] = useState(false);

  useEffect(() => {
    if (!open) {
      setBonus(0);
      setGaji(0);
    }
  }, [open]);

  const handleEditGaji = (id) => {
    handleOpen();
    setId(id);
    const item = data.find((item) => item.id === id);
    console.log(item);
    setNamaTampil(item.role_data.nama);
    setRole(item.role);
    setGaji(item.role_data.gaji_dasar_harian);
  };

  const handleEditBonus = (id) => {
    handleOpenBonus();
    setId(id);
    const item = data.find((item) => item.id === id);
    setBonus(item.pegawai.bonus);
    setNamaTampil(item.name);
  };

  const handleUpdateGaji = () => {
    if (gaji == 0) {
      toast.error("Input gaji tidak boleh 0");
      return;
    }

    updateGajiKaryawan(role, gaji);
  };

  const handleUpdateBonus = () => {
    if (bonus < 0) {
      toast.error("Bonus Kurang dari 0");
      return;
    }

    updateBonusKaryawan(id, bonus);
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };
  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-800 mb-4">
        Data Gaji & Bonus
      </h1>
      <div className="flex w-full justify-start mb-4">
        <div className="w-full md:w-72">
          <Input label="Search" type="search" onChange={handleSearch} />
        </div>
      </div>
      <Table columns="grid-cols-[2fr,3fr,2fr,2fr,2fr,3.2rem]">
        <Table.Header>
          <div>Nama</div>
          <div>Email</div>
          <div>Role</div>
          <div>Gaji</div>
          <div>Bonus</div>
          <div></div>
        </Table.Header>
        <Table.Body
          data={data}
          isLoading={isLoading}
          render={(item) => (
            <GajiRow
              key={item.name}
              item={item}
              handleEditGaji={handleEditGaji}
              handleEditBonus={handleEditBonus}
            />
          )}
        />
        <Table.Footer>
          <Pagination count={totalData} />
        </Table.Footer>
      </Table>
      {/* Dialog Edit Gaji */}
      <Dialog
        open={open}
        size="md"
        handler={handleOpen}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>Update Gaji {namaTampil}</DialogHeader>
        <DialogBody>
          <div className="flex flex-col gap-4">
            <Input
              label="Gaji Pegawai"
              type="number"
              size="lg"
              placeholder="Masukan Gaji Pegawai"
              onChange={(e) => setGaji(e.target.value)}
              value={gaji}
            />
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
            onClick={handleUpdateGaji}
          >
            <span>Confirm</span>
          </Button>
        </DialogFooter>
      </Dialog>
      {/* Dialog Bonus */}
      <Dialog
        open={openBonus}
        size="md"
        handler={handleOpenBonus}
        animate={{
          mount: { scale: 1, y: 0 },
          unmount: { scale: 0.9, y: -100 },
        }}
      >
        <DialogHeader>Update Bonus {namaTampil}</DialogHeader>
        <DialogBody>
          <div className="flex flex-col gap-4">
            <Input
              label="Bonus Pegawai"
              type="number"
              size="lg"
              placeholder="Masukan Bonus Pegawai"
              onChange={(e) => setBonus(e.target.value)}
              value={bonus}
            />
          </div>
        </DialogBody>
        <DialogFooter>
          <Button
            variant="text"
            color="red"
            onClick={handleOpenBonus}
            className="mr-1"
          >
            <span>Cancel</span>
          </Button>

          <Button
            className="bg-pink-primary"
            loading={isProcessing}
            onClick={handleUpdateBonus}
          >
            <span>Confirm</span>
          </Button>
        </DialogFooter>
      </Dialog>
    </div>
  );
}

export default GajiView;
