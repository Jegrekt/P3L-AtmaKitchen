import React from "react";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
} from "@material-tailwind/react";
import Table from "../../../../ui/Table";
function KaryawanRow({
  item: {
    id,
    username,
    name,
    pegawai: { no_telp, alamat },
  },
  handleEdit,
  handleDelete,
}) {
  return (
    <Table.Row>
      <div>{name}</div>
      <div>{username}</div>
      <div>{no_telp}</div>
      <div>{alamat}</div>
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

export default KaryawanRow;
