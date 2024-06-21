import React, { useState } from "react";
import Background from "../assets/images/Bakery2.jpg";
import Logo from "../assets/images/Logo.png";
import { Input, Button, Textarea } from "@material-tailwind/react";
import { Link, useNavigate } from "react-router-dom";
import { registerUser } from "../api/ApiAuth";
import { toast } from "sonner";
import toastError from "../ui/sonner/toastError";
function Register() {
  const [input, setInput] = useState({
    name: "",
    username: "",
    password: "",
    no_telp: "",
    alamat: "",
    tanggal_lahir: "",
  });
  const [loginData, setLoginData] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const [isHide, setIsHide] = useState(false);
  const navigate = useNavigate();
  const RegisterHandler = () => {
    if (input.name === "") {
      toastError("Nama tidak boleh kosong");
      return;
    }
    if (input.username === "") {
      toastError("Email tidak boleh kosong");
      return;
    }
    if (input.tanggal_lahir === "") {
      toastError("Tanggal Lahir tidak boleh kosong");
      return;
    }
    if (input.alamat === "") {
      toastError("Alamat tidak boleh kosong");
      return;
    }
    if (input.password === "") {
      toastError("Password tidak boleh kosong");
      return;
    }
    setIsLoading(true);
    registerUser(input)
      .then((res) => {
        setIsLoading(false);
        console.log(res);
        navigate("/login");
        toast.success("Berhasil Login");
      })
      .catch((err) => {
        toastError(err.message);
        setIsLoading(false);
      });
  };
  return (
    <div className="flex justify-between flex-col md:flex-row items-center h-full w-full">
      <div className="h-svh bg-pink-secondary w-1/3 px-16 flex items-center flex-col justify-center">
        <img
          src={Logo}
          alt="Logo"
          className="h-24 cursor-pointer drop-shadow-lg"
          onClick={() => navigate("/")}
        />
        <p className="font-bold text-center text-2xl text-black">
          Register to Atma Kitchen
        </p>
        <div className="flex flex-col justify-center items-center gap-4 w-full text-center mt-4">
          <Input
            variant="outlined"
            label="Nama"
            type="text"
            placeholder="Masukan Nama Anda"
            onChange={(e) => setInput({ ...input, name: e.target.value })}
            value={input.name}
            className="text-black font-normal"
          />
          <Input
            variant="outlined"
            label="Email"
            type="email"
            placeholder="Masukan Email Anda"
            onChange={(e) => setInput({ ...input, username: e.target.value })}
            value={input.username}
            className="text-black font-normal"
          />

          <Input
            variant="outlined"
            label="Tanggal Lahir"
            type="date"
            onChange={(e) =>
              setInput({ ...input, tanggal_lahir: e.target.value })
            }
            value={input.tanggal_lahir}
            className="text-black font-normal"
          />
          <Input
            variant="outlined"
            label="No Telepon"
            type="text"
            placeholder="Masukan Nomor Telepon Anda"
            onChange={(e) => setInput({ ...input, no_telp: e.target.value })}
            value={input.no_telp}
            className="text-black font-normal"
          />
          <Textarea
            label="Masukan Alamat Anda"
            rows={1}
            resize={true}
            onChange={(e) => setInput({ ...input, alamat: e.target.value })}
            value={input.alamat}
            // placeholder="Masukan Alamat Anda"
          />
          <Input
            variant="outlined"
            label="Password"
            type="password"
            placeholder="Masukan Password Anda"
            onChange={(e) => setInput({ ...input, password: e.target.value })}
            value={input.password}
          />
        </div>

        <Button
          loading={isLoading}
          className="w-full bg-pink-primary text-white flex justify-center items-center gap-2 mt-8"
          onClick={RegisterHandler}
        >
          Register
        </Button>
        <p className="text-sm text-center mt-2">
          Sudah punya akun?{" "}
          <Link className="text-pink-primary font-bold" to={"/login"}>
            Login
          </Link>
        </p>
      </div>
      <div className="w-1/2 h-svh flex-1">
        <img
          src={Background}
          alt="cupcakes"
          className="w-full h-full object-cover"
        />
      </div>
    </div>
  );
}

export default Register;
