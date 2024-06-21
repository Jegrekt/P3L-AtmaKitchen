import React, { useState } from "react";
import Bakery from "../assets/images/Bakery.jpg";
import Logo from "../assets/images/Logo.png";
import {
  Button,
  Card,
  CardBody,
  CardFooter,
  CardHeader,
  Input,
} from "@material-tailwind/react";
import { useNavigate, useSearchParams } from "react-router-dom";
import toastError from "../ui/sonner/toastError";
import { changePasswordCustomer } from "../api/ApiAuth";
import { toast } from "sonner";

function ChangePassword() {
  const [searchParams] = useSearchParams();
  const email = searchParams.get("username");
  const token = searchParams.get("token");
  const navigate = useNavigate();
  const [input, setInput] = useState({ password: "", konfirmasiPassword: "" });
  const handleSubmit = () => {
    if (input.password === "" || input.konfirmasiPassword === "") {
      toastError("Password tidak boleh kosong");
      return;
    }
    if (input.password !== input.konfirmasiPassword) {
      toastError("Password tidak sama");
      return;
    }

    changePasswordCustomer({
      username: email,
      token: token,
      password: input.password,
    })
      .then((res) => {
        console.log(res);
        toast.success("Berhasil mengubah password");
      })
      .catch((err) => {
        toastError(err.message);
      });
  };
  return (
    <div className="h-svh ">
      <img
        src={Bakery}
        alt=""
        className="absolute top-0 h-svh w-full object-cover"
      />
      <div className="flex justify-center items-center w-full h-full">
        <Card className="mt-6 max-w-[400px] w-full">
          <CardHeader
            className="flex flex-col items-center gap-4 justify-center"
            floated={false}
            shadow={false}
            color="transparent"
          >
            <img src={Logo} alt="Logo" className="h-24" />
            <p className="font-bold text-center text-2xl text-black">
              Ubah Password
            </p>
          </CardHeader>
          <CardBody className="pb-0">
            <p className="text-center mb-4">
              Mengubah Password dari email :{" "}
              <span className="font-bold">{email}</span>
            </p>
            <div className="flex flex-col items-center justify-center gap-4  text-center">
              <Input
                variant="outlined"
                label="Password"
                type="password"
                placeholder="Masukan Password Anda"
                onChange={(e) =>
                  setInput({ ...input, password: e.target.value })
                }
                value={input.password}
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
          </CardBody>
          <CardFooter className="pt-0">
            <Button
              onClick={handleSubmit}
              className="w-full bg-pink-primary text-white flex justify-center items-center gap-2 mt-6"
            >
              Ubah Password
            </Button>
          </CardFooter>
        </Card>
      </div>
    </div>
  );
}

export default ChangePassword;
