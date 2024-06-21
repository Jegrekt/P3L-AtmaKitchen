import {
  Button,
  Dialog,
  DialogFooter,
  DialogHeader,
} from "@material-tailwind/react";
import React from "react";

function KonfirmasiDialog({
  openKonfirmasi,
  handleOpenKonfirmasi,
  handleOpen,
  handleAdd,
  isProcessing,
  konfirmasi = "mengupdate",
}) {
  return (
    <Dialog
      open={openKonfirmasi}
      size="md"
      handler={handleOpenKonfirmasi}
      animate={{
        mount: { scale: 1, y: 0 },
        unmount: { scale: 0.9, y: -100 },
      }}
    >
      <DialogHeader>Apakah Anda Ingin {konfirmasi} ini?</DialogHeader>

      <DialogFooter>
        <Button
          variant="text"
          color="red"
          onClick={() => {
            handleOpenKonfirmasi();
            handleOpen();
          }}
          className="mr-1"
        >
          <span>Cancel</span>
        </Button>

        <Button
          className="bg-pink-primary"
          loading={isProcessing}
          onClick={handleAdd}
        >
          <span>Confirm</span>
        </Button>
      </DialogFooter>
    </Dialog>
  );
}

export default KonfirmasiDialog;
