import React from "react";
import Table from "../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import { setDate } from "../../../utils/setDate";
import { rupiah } from "../../../utils/rupiah";

function KonfirmasiCustomerRow({
  item: {
    id,
    no_nota,
    jenis_pengiriman,
    status_pesanan,
    tanggal_siap,
    grand_total,
    tip,
  },
  handleOpen,
}) {
  return (
    <Table.Row>
      <div>{no_nota}</div>
      <div>{jenis_pengiriman}</div>
      <div>{status_pesanan}</div>
      <div>{setDate(tanggal_siap)}</div>
      <div className="text-lg font-numeric text-green-400">
        {rupiah(grand_total)}
      </div>
      <div className="text-lg font-numeric text-green-400">{rupiah(tip)}</div>
      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem
            onClick={() => {
              handleOpen(id);
            }}
          >
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Konfirmasi Pesanan</span>
            </div>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default KonfirmasiCustomerRow;
