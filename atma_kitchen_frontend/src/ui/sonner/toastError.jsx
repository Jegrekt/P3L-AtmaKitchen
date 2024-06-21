import React from "react";
import { IoIosAlert } from "react-icons/io";
import { toast } from "sonner";
function toastError( text ) {
  toast(text, {
    className: "bg-red-300 text-red-50",
    icon: <IoIosAlert className="text-lg" />,
  });
}

export default toastError;
