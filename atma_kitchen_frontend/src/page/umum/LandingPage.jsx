import React, { useEffect, useRef, useState } from "react";
import Cupcake from "../../assets/images/Cupcakes.png";

import TentangKami from "./TentangKami";
import ProdukKami from "./ProdukKami";
import { Button, Input, Textarea } from "@material-tailwind/react";
import KritikSaran from "./KritikSaran";

function LandingPage() {

  return (
    <>
      <div className="bg-pink-secondary pt-36 pb-16" id="HomePublik">
        <div className="container mx-auto">
          <div className="flex justify-between items-center gap-40 ">
            <div className="flex-1">
              <h1 className="text-4xl font-semibold mb-4 text-pink-primary">
                Atma Kitchen
              </h1>
              <p className="text-black text-justify">
                Atma Kitchen: Memasak dengan Cinta. Menyajikan dengan Hati.
                Menciptakan Kenangan di Setiap Hidangan. Setiap Rasa Adalah
                Cerita. Kami Hadir untuk Anda. Nikmati Momen Berharga Bersama
                Kami. Atma Kitchen, Kebahagiaan dalam Setiap Suapan.
              </p>
            </div>
            <div className="flex-1">
              <img src={Cupcake} alt="Cupcakes" className="backdrop-blur-2xl" />
            </div>
          </div>
        </div>
      </div>
      {/*  */}
      <TentangKami />
      {/*  */}
      <ProdukKami />
      {/*  */}
      <KritikSaran />
    </>
  );
}

export default LandingPage;
