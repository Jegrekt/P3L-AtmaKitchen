import React, { useState } from "react";
import Bakery from "../assets/images/Bakery.jpg";
import Logo from "../assets/images/Logo.png";
import {
  Dialog,
  DialogHeader,
  DialogBody,
  DialogFooter,
  Input,
  Button,
} from "@material-tailwind/react";
import { Link, useNavigate } from "react-router-dom";
import { loginAutentication, forgotPassword } from "../api/ApiAuth";
import { toast } from "sonner";
import toastError from "../ui/sonner/toastError";
import { FaEye, FaEyeSlash } from "react-icons/fa6";
function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [emailRecovery, setEmailRecovery] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [isPasswordLoading, setIsPasswordLoading] = useState(false);
  const [isHide, setIsHide] = useState(false);
  const [open, setOpen] = useState(false);
  const handleOpen = () => setOpen(!open);
  const navigate = useNavigate();
  const loginHandler = () => {
    if (email === "" || password === "") {
      toastError("Email dan Password tidak boleh kosong");
      return;
    }
    setIsLoading(true);
    loginAutentication(email, password)
      .then((res) => {
        setIsLoading(false);
        console.log(res);
        localStorage.setItem("token", res.token);
        localStorage.setItem("user", JSON.stringify(res.user));
        localStorage.setItem("name", res.user.name);
        if (res?.user?.role == "c") {
          navigate("/pemesanan");
          toast.success("Berhasil Login sebagai Customer");
        } else if (res?.user?.role == "adm") {
          navigate("/produk");
          toast.success("Berhasil Login sebagai Admin");
        } else if (res?.user?.role == "mo") {
          navigate("/karyawan");
          toast.success("Berhasil Login sebagai MO");
        } else if (res?.user?.role == "own") {
          navigate("/gaji");
          toast.success("Berhasil Login sebagai Owner");
        }
      })
      .catch((err) => {
        toastError(err.message);
        setIsLoading(false);
      });
  };

  const resetPasswordHandler = () => {
    if (emailRecovery === "") {
      toastError("Email tidak boleh kosong");
      return;
    }
    setIsPasswordLoading(true);
    forgotPassword(emailRecovery)
      .then((res) => {
        setIsPasswordLoading(false);
        console.log(res);
        toast.success(res.message);
        handleOpen();
      })
      .catch((err) => {
        toastError(err.message);
        setIsPasswordLoading(false);
      });
  };
  return (
    <>
      <div className="flex justify-between flex-col md:flex-row items-center h-full lg:h-svh w-full">
        <div className="w-1/2 h-full flex-1">
          <img
            src={Bakery}
            alt="cupcakes"
            className="w-full h-full object-cover"
          />
        </div>
        <div className="h-full bg-pink-secondary w-1/3 px-16 flex items-center flex-col justify-center">
          <img
            src={Logo}
            alt="Logo"
            className="h-24 cursor-pointer drop-shadow-lg"
            onClick={() => navigate("/")}
          />
          <p className="font-bold text-center text-2xl text-black">
            Welcome to Atma Kitchen
          </p>
          <div className="flex flex-col justify-center items-center gap-4 w-full text-center mt-4">
            <Input
              variant="outlined"
              label="Email"
              type="email"
              placeholder="Masukan Email Anda"
              onChange={(e) => setEmail(e.target.value)}
              value={email}
              className="text-black font-normal"
            />
            <div className="relative flex w-full ">
              <Input
                variant="outlined"
                label="Password"
                {...(isHide ? { type: "text" } : { type: "password" })}
                placeholder="Masukan Password Anda"
                onChange={(e) => setPassword(e.target.value)}
                value={password}
              />
              <Button
                size="sm"
                variant="text"
                ripple={false}
                onClick={() => setIsHide(!isHide)}
                className="!absolute right-4 top-1 rounded focus:bg-transparent pe-0 active:bg-transparent hover:bg-transparent"
              >
                {isHide ? (
                  <FaEye className="w-5 h-5" />
                ) : (
                  <FaEyeSlash className="w-5 h-5" />
                )}
              </Button>
            </div>
          </div>

          <Button
            variant="text"
            ripple={false}
            className="ms-auto text-end text-sm mt-2 hover:text-pink-primary p-0 hover:bg-transparent focus:bg-transparent active:bg-transparent normal-case font-normal"
            onClick={() => {
              setEmailRecovery("");
              handleOpen();
            }}
          >
            Forget Password?
          </Button>
          <Button
            loading={isLoading}
            className="w-full bg-pink-primary text-white flex justify-center items-center gap-2 mt-4"
            onClick={loginHandler}
          >
            Login
          </Button>
          <p className="text-sm text-center mt-2">
            Belum punya akun?{" "}
            <Link className="text-pink-primary font-bold" to={"/register"}>
              Register disini
            </Link>
          </p>
        </div>
      </div>
      <Dialog open={open} handler={handleOpen} size="sm">
        <DialogHeader>Reset Password</DialogHeader>
        <DialogBody>
          <Input
            label="Email"
            onChange={(e) => setEmailRecovery(e.target.value)}
            value={emailRecovery}
            placeholder="Masukan Email Anda"
          />
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
            className="bg-pink-primary flex justify-center items-center gap-2"
            loading={isPasswordLoading}
            onClick={resetPasswordHandler}
          >
            Confirm
          </Button>
        </DialogFooter>
      </Dialog>
    </>
  );
}

export default Login;
