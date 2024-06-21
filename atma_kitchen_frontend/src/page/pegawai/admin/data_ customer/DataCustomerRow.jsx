import React from "react";
import { number, rupiah } from "../../../../utils/rupiah";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
} from "@material-tailwind/react";
import { useNavigate } from "react-router-dom";
import { FaEye } from "react-icons/fa6";

function DataCustomerRow({
  item: {
    id_user,
    no_telp,
    saldo,
    poin,
    user: { name, username },
  },
}) {
  const navigate = useNavigate();
  return (
    <Table.Row>
      <div>{name}</div>
      <div>{username}</div>
      <div>{no_telp}</div>
      <div className="font-numeric font-medium text-green-600 text-sm">
        {rupiah(saldo)}
      </div>
      <div>{number(poin)}</div>
      <Menu>
        <MenuHandler>
          <IconButton variant="text">
            <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
          </IconButton>
        </MenuHandler>
        <MenuList>
          <MenuItem
            onClick={() => navigate(`/data-customer/history/${id_user}`)}
          >
            <div className="flex gap-2 items-center">
              <FaEye />
              <span>History Pesanan</span>
            </div>
          </MenuItem>
        </MenuList>
      </Menu>
    </Table.Row>
  );
}

export default DataCustomerRow;
