import React from "react";
import { setDate } from "../../../../utils/setDate";
import { rupiah } from "../../../../utils/rupiah";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";

function KonfirmasiRow({
  item: { id, no_nota, jenis_pengiriman, tanggal_siap, grand_total, tip },
  handleOpen,
  setId,
}) {
  return (
    <Table.Row>
      <div>{no_nota}</div>
      <div>{jenis_pengiriman}</div>
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
              handleOpen();
              setId(id);
              console.log(id);
            }}
          >
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Konfirmasi / Tolak</span>
            </div>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default KonfirmasiRow;
