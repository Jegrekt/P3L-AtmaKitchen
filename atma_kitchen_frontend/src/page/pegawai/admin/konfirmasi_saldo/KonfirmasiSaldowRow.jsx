import React from "react";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import { setDate } from "../../../../utils/setDate";
import { rupiah } from "../../../../utils/rupiah";

function KonfirmasiSaldowRow({
  item: {
    id,
    customer: {
      user: { name, username },
    },
    timestamp,
    nominal,
    saldo_akhir,
    catatan,
  },
  handleOpen,
}) {
  return (
    <Table.Row>
      <div>{name}</div>
      <div>{setDate(timestamp)}</div>
      <div className="text-lg font-numeric text-green-400">
        {rupiah(saldo_akhir)}
      </div>
      <div className="text-lg font-numeric text-green-400">
        {rupiah(nominal)}
      </div>
      <div>{catatan}</div>
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
            <span>Konfirmasi Penarikan</span>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default KonfirmasiSaldowRow;
