/* eslint-disable react/prop-types */
import {
  Button,
  Dialog,
  DialogHeader,
  DialogFooter,
} from "@material-tailwind/react";

function DeleteDialog({
  openDelete,
  handleOpenDelete,
  handleDelete,
  nama,
  isProcessing,
}) {
  return (
    <Dialog open={openDelete} handler={handleOpenDelete} size="sm">
      <DialogHeader>Apakah ingin menghapus {nama}?</DialogHeader>
      <DialogFooter>
        <Button
          variant="text"
          color="red"
          onClick={handleOpenDelete}
          className="mr-1"
        >
          <span>Cancel</span>
        </Button>
        <Button
          className="bg-pink-primary"
          onClick={handleDelete}
          loading={isProcessing}
        >
          <span>Confirm</span>
        </Button>
      </DialogFooter>
    </Dialog>
  );
}

export default DeleteDialog;
