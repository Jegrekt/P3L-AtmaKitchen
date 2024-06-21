import React from "react";
import Table from "../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import { FaEye } from "react-icons/fa6";

function AlamatRow({ item: { id, jarak, alamat } }) {
  return (
    <Table.Row>
      <div>{alamat}</div>
      <div>{jarak ? `${jarak} Km` : "Belum dikonfirmasi"}</div>

      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem>
            <div className="flex gap-4">
              <i className="fa-solid fa-pencil"></i>
              <span>Edit</span>
            </div>
          </MenuItem>
          <MenuItem>
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

export default AlamatRow;
