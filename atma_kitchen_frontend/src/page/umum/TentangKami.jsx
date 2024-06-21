import React from "react";
import backery from "../../assets/images/BakeryShop.jpg";

function TentangKami() {
  return (
    <div className="bg-white py-14" id="TentangKami">
      <div className="container mx-auto">
        <div className="flex justify-between items-center gap-28">
          <div className="flex-1">
            <img src={backery} alt="" className="h-1/2 rounded-lg" />
          </div>
          <div className="flex-1">
            <h1 className="text-4xl text-pink-primary font-semibold mb-8">
              Tentang Kami
            </h1>
            <p className="text-justify">
              Atma Kitchen adalah tempat di mana setiap hidangan dipersiapkan
              dengan cinta dan disajikan dengan hati. Kami percaya bahwa setiap
              rasa membawa cerita dan kenangan yang tak terlupakan. Dengan
              bahan-bahan segar dan resep terbaik, kami menciptakan pengalaman
              kuliner yang memanjakan lidah dan menghangatkan jiwa. Datanglah
              dan nikmati momen berharga bersama kami, karena di Atma Kitchen,
              kebahagiaan hadir dalam setiap suapan.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default TentangKami;
