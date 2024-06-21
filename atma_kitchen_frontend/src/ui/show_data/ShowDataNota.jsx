import { Typography } from "@material-tailwind/react";
import React from "react";

function ShowDataNota({ nama, isi, className }) {
  return (
    <Typography className={`flex ${className}`}>
      <span className="w-[150px]">{nama}</span> :{" "}
      <span className="ms-2 font-normal">{!isi ? "—" : isi}</span>
    </Typography>
  );
}

export default ShowDataNota;
