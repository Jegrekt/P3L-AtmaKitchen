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
import { setDate } from "../../../../utils/setDate";
import { useNavigate } from "react-router-dom";
function PembelianBahanBakuRow({
  item: {
    id,
    bahan_baku: { nama },
    tanggal_pembelian,
    harga_satuan,
    qty,
    total_harga,
  },
  handleDelete,
}) {
  const navigate = useNavigate();
  return (
    <Table.Row>
      <div>{nama}</div>
      <div>{setDate(tanggal_pembelian)}</div>
      <div className="font-numeric font-medium text-green-600 text-sm">
        {rupiah(harga_satuan)}
      </div>
      <div>{qty}</div>
      <div className="font-numeric font-medium text-green-600 text-sm">
        {rupiah(total_harga)}
      </div>
      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem onClick={() => navigate(`/add-pembelian-bahan/${id}`)}>
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

export default PembelianBahanBakuRow;
