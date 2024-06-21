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

function PenitipRow({
  item: { id, nama, alamat, no_telp },
  handleEdit,
  handleDelete,
  idPenitip,
  onChangePenitip,
}) {
  return (
    <Table.Row>
      <div>{nama}</div>
      <div>{alamat}</div>
      <div>{no_telp}</div>
      {onChangePenitip ? (
        <Checkbox
          color="pink"
          checked={idPenitip === id}
          onClick={() => onChangePenitip(id)}
        />
      ) : (
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
      )}
    </Table.Row>
  );
}

export default PenitipRow;
