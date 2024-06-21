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
import { useNavigate } from "react-router-dom";

function Index() {
  const navigate = useNavigate();
  return (
    <div className="h-svh ">
      <img
        src={Bakery}
        alt=""
        className="absolute top-0 h-svh w-full object-cover"
      />
      <div className="flex justify-center items-center w-full h-full">
        <Card className="mt-6 max-w-[800px] w-full">
          <CardHeader
            className="flex flex-col items-center gap-2 justify-center"
            floated={false}
            shadow={false}
            color="transparent"
          >
            <img src={Logo} alt="Logo" className="h-24" />
            <p className="font-bold text-center text-2xl text-black">
              Welcome To Atma Kitchen
            </p>
            <p className="font-normal text-center text-lg text-black justify-center">
              Atma Kitchen Memasak dengan Cinta. Menyajikan dengan Hati.
              Menciptakan Kenangan di Setiap Hidangan
            </p>
          </CardHeader>
          <CardFooter className="flex justify-center items-center gap-5">
            <Button
              className="bg-pink-primary"
              onClick={() => navigate("/login")}
            >
              Login
            </Button>
            <Button
              variant="outlined"
              onClick={() => navigate("/Umum")}
              className="border border-pink-primary text-pink-primary"
            >
              Umum
            </Button>
            <Button
              className="bg-pink-primary"
              onClick={() => navigate("/register")}
            >
              Register
            </Button>
          </CardFooter>
        </Card>
      </div>
    </div>
  );
}

export default Index;
