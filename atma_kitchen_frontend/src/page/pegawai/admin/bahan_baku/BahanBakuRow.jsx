/* eslint-disable react/prop-types */
import { useEffect, useState } from "react";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
  Checkbox,
  Input,
} from "@material-tailwind/react";
import Table from "../../../../ui/Table";
function BahanBakuRow({
  item: { id, nama, satuan, stok },
  handleEdit,
  handleDelete,
  idBahan,
  arrayBahan,
  onChangeBahan,
}) {
  const item = arrayBahan?.find((bahan) => bahan.id_bahan_baku === id);
  const checked = item?.id_bahan_baku !== undefined;
  const qty = item?.qty || 0;
  return (
    <Table.Row>
      <div>{nama}</div>
      <div className="font-medium">{satuan}</div>
      <div>{stok}</div>
      {onChangeBahan ? (
        <>
          {idBahan == null && (
            <Input
              label="Qty"
              type="number"
              disabled={!checked}
              value={qty}
              onChange={(e) => onChangeBahan(id, checked, e.target.value, true)}
            />
          )}
          {idBahan == null ? (
            <Checkbox
              color="pink"
              checked={checked}
              onChange={(e) => onChangeBahan(id, e.target.checked, qty, false)}
            />
          ) : (
            <Checkbox
              color="pink"
              checked={idBahan === id}
              onChange={() => onChangeBahan(id)}
            />
          )}
        </>
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

export default BahanBakuRow;
