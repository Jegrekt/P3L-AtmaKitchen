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
import { FaAsterisk, FaKey, FaLock, FaPowerOff } from "react-icons/fa6";
import { useNavigate } from "react-router-dom";
import { toast } from "sonner";
import { changePassword } from "../../api/ApiAuth";
const fullRole = {
  adm: "Admin",
  own: "Owner",
  mo: "Manajer Operasional",
};

function Profile() {
  const [input, setInput] = useState({
    old_password: "",
    new_password: "",
    konfirmasiPassword: "",
  });
  const [loading, setLoading] = useState(false);
  const [open, setOpen] = useState(false);
  const handleOpen = () => setOpen(!open);
  const user = JSON.parse(localStorage.getItem("user"));
  const role = user.role;
  const navigate = useNavigate();

  const handleSubmit = () => {
    if (
      input.new_password === "" ||
      input.konfirmasiPassword === "" ||
      input.old_password === ""
    ) {
      toast.error("Password tidak boleh kosong");
      return;
    }

    if (input.old_password === input.new_password) {
      toast.error("Password baru tidak boleh sama dengan password lama");
      return;
    }

    if (input.new_password !== input.konfirmasiPassword) {
      toast.error("Password tidak sama");
      return;
    }
    setLoading(true);
    changePassword({
      old_password: input.old_password,
      new_password: input.new_password,
    })
      .then((res) => {
        console.log(res);
        toast.success("Berhasil mengubah password");
        handleOpen();
        setLoading(false);
      })
      .catch((err) => {
        toast.error(err.message);
        setLoading(false);
      });
  };
  return (
    <>
      <Menu placement="bottom-end">
        <MenuHandler>
          <div className="flex items-center gap-4 hover:cursor-pointer">
            <div className="flex flex-col items-end">
              <p className="text-sm">{user.name}</p>
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
            onClick={() => {
              handleOpen();
              setInput({
                old_password: "",
                new_password: "",
                konfirmasiPassword: "",
              });
            }}
          >
            <FaKey />
            Change Password
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

      <Dialog open={open} handler={handleOpen} size="sm">
        <DialogHeader>Ubah Kata Sandi</DialogHeader>
        <DialogBody>
          <div className="flex flex-col items-center justify-center gap-4  text-center">
            <Input
              variant="outlined"
              label="Password Lama"
              type="password"
              placeholder="Masukan Password Lama Anda"
              onChange={(e) =>
                setInput({ ...input, old_password: e.target.value })
              }
              value={input.old_password}
            />
            <Input
              variant="outlined"
              label="Password"
              type="password"
              placeholder="Masukan Password Anda"
              onChange={(e) =>
                setInput({ ...input, new_password: e.target.value })
              }
              value={input.new_password}
            />
            <Input
              variant="outlined"
              label="Konfirmasi Password"
              type="password"
              placeholder="Masukan Konfirmasi Password Anda"
              onChange={(e) =>
                setInput({ ...input, konfirmasiPassword: e.target.value })
              }
              value={input.konfirmasiPassword}
            />
          </div>
        </DialogBody>
        <DialogFooter>
          <Button
            variant="text"
            color="red"
            onClick={handleOpen}
            className="mr-1"
          >
            <span>Cancel</span>
          </Button>
          <Button
            className="bg-pink-primary"
            loading={loading}
            onClick={handleSubmit}
          >
            <span>Confirm</span>
          </Button>
        </DialogFooter>
      </Dialog>
    </>
  );
}

export default Profile;
