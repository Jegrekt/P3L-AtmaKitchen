import React from "react";
import Table from "../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import { number, rupiah } from "../../../utils/rupiah";

function PendingRow({
  item: { id, no_nota, jenis_pengiriman, poin_didapat, grand_total },
  handleBayar,
  setId,
}) {
  return (
    <Table.Row>
      <div>{no_nota}</div>
      <div>{jenis_pengiriman}</div>
      <div>{number(poin_didapat)}</div>
      <div className="text-lg font-numeric text-green-400">
        {rupiah(grand_total)}
      </div>
      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem
            onClick={() => {
              handleBayar(id);
              setId(id);
            }}
          >
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Bayar</span>
            </div>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default PendingRow;
