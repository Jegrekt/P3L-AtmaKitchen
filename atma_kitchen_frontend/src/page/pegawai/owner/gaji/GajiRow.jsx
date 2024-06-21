import React from "react";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import { rupiah } from "../../../../utils/rupiah";
function GajiRow({
  item: {
    id,
    name,
    username,
    role_data: { gaji_dasar_harian, nama },
    pegawai: { bonus },
  },
  handleEditBonus,
  handleEditGaji,
}) {
  return (
    <Table.Row>
      <div>{name}</div>
      <div>{username}</div>
      <div>{nama}</div>
      <div> {rupiah(gaji_dasar_harian)} </div>
      <div>{rupiah(bonus)}</div>

      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem onClick={() => handleEditGaji(id)}>
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Edit Gaji</span>
            </div>
          </MenuItem>
          <MenuItem onClick={() => handleEditBonus(id)}>
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Edit Bonus</span>
            </div>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default GajiRow;
