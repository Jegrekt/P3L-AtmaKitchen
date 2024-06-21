import React from "react";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
  Checkbox,
} from "@material-tailwind/react";
import { setDate } from "../../../../utils/setDate";
import { rupiah } from "../../../../utils/rupiah";

function PengeluaranLainRow({
  item: { id, nama, nominal, tanggal_pengeluaran },
  handleEdit,
  handleDelete,
}) {
  return (
    <Table.Row>
      <div>{nama}</div>
      <div className="font-numeric font-medium text-green-600 text-sm">
        {rupiah(nominal)}
      </div>
      <div>{setDate(tanggal_pengeluaran)}</div>

      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem onClick={() => handleEdit(id)}>
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Edit</span>
            </div>
          </MenuItem>
          <MenuItem onClick={() => handleDelete(id)}>
            <div className="flex gap-4">
              <i className="fa-solid fa-trash"></i>
              <span>Delete</span>
            </div>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default PengeluaranLainRow;
