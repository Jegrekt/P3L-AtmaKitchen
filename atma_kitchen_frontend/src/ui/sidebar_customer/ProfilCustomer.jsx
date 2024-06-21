import React from "react";
import {
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
  Button,
  Input,
} from "@material-tailwind/react";
import { useState } from "react";
import {
  FaAsterisk,
  FaKey,
  FaLock,
  FaMoneyBillTransfer,
  FaMoneyBills,
  FaPowerOff,
  FaUser,
} from "react-icons/fa6";
import { useNavigate } from "react-router-dom";
import { toast } from "sonner";
import { changePassword } from "../../api/ApiAuth";
const fullRole = {
  adm: "Admin",
  own: "Owner",
  mo: "Manajer Operasional",
  c: "Customer",
};

function ProfilCustomer() {
  const [input, setInput] = useState({
    old_password: "",
    new_password: "",
    konfirmasiPassword: "",
  });
  const [loading, setLoading] = useState(false);
  const [open, setOpen] = useState(false);
  const handleOpen = () => setOpen(!open);
  const name = localStorage.getItem("name");
  const user = JSON.parse(localStorage.getItem("user"));
  const role = user.role;
  const navigate = useNavigate();

  return (
    <>
      <Menu placement="bottom-end">
        <MenuHandler>
          <div className="flex items-center gap-4 hover:cursor-pointer">
            <div className="flex flex-col items-end">
              <p className="text-sm">{name}</p>
              <p className="text-gray-600 text-sm">{fullRole[role]}</p>
            </div>

            <span className="h-12 w-12 rounded-full overflow-hidden">
              <img
                src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80"
                alt="User"
              />
            </span>

            <i className="fa-solid fa-chevron-down text-gray-600"></i>
          </div>
        </MenuHandler>
        <MenuList>
          <MenuItem
            className="flex justify-start items-center gap-2"
            onClick={() => navigate("/profil")}
          >
            <FaUser />
            Profil Saya
          </MenuItem>
          <hr className="my-3" />
          <MenuItem
            className="flex justify-start items-center gap-2 text-red-500 active:text-red-500 focus:text-red-500"
            onClick={() => navigate("/")}
          >
            <FaPowerOff />
            Logout
          </MenuItem>
        </MenuList>
      </Menu>
    </>
  );
}

export default ProfilCustomer;
