import React, { useState } from "react";
import { FaPowerOff } from "react-icons/fa6";
import { useNavigate } from "react-router-dom";
import {
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
} from "@material-tailwind/react";
function ProfilUmum() {
  const [loading, setLoading] = useState(false);
  const [open, setOpen] = useState(false);
  const handleOpen = () => setOpen(!open);

  const navigate = useNavigate();
  return (
    <Menu placement="bottom-end">
      <MenuHandler>
        <div className="flex items-center gap-4 hover:cursor-pointer">
          <div className="flex flex-col items-end">
            <p className="text-sm">Public User</p>
            <p className="text-gray-600 text-sm">Customer</p>
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
          className="flex justify-start items-center gap-2 "
          onClick={() => navigate("/")}
        >
          <FaPowerOff />
          Login untuk masuk
        </MenuItem>
      </MenuList>
    </Menu>
  );
}

export default ProfilUmum;
