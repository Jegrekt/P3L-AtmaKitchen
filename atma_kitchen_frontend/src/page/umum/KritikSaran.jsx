import { Button, Input, Textarea } from "@material-tailwind/react";

import React, { useState } from "react";
import { toast } from "sonner";
import toastError from "../../ui/sonner/toastError";

function KritikSaran() {
  const [input, setInput] = useState({
    username: "",
    email: "",
    desc: "",
  });

  const submit = () => {
    if (input.email == "") {
      toastError("Data Email Kosong ");
      return;
    }
    if (input.username == "") {
      toastError("Data Username Kosong ");
      return;
    }
    if (input.desc == "") {
      toastError("Kritik Saran Kosong ");
      return;
    }
    // add delay
    setTimeout(() => {
      toast.success("Berhasil mengirim Data Ke Atma Kitchen");
      setInput({
        username: "",
        email: "",
        desc: "",
      });
    }, 1000);
  };
  return (
    <div className="bg-pink-secondary py-14" id="KritikSaran">
      <div className="container mx-auto">
        <h1 className="text-center text-4xl text-pink-primary  font-semibold mb-10 ">
          Kritik dan Saran
        </h1>
        <div className="max-w-xl mx-auto">
          <div className="flex justify-center gap-4">
            <Input
              label="Email"
              type="email"
              value={input.email}
              onChange={(e) => setInput({ ...input, email: e.target.value })}
            />
            <Input
              label="Username"
              type="text"
              value={input.username}
              onChange={(e) => setInput({ ...input, username: e.target.value })}
            />
          </div>
          <div className="flex justify-center mt-4">
            <Textarea
              label="Message"
              resize={true}
              value={input.desc}
              onChange={(e) => setInput({ ...input, desc: e.target.value })}
            />
          </div>
          <div className="flex justify-end items-center mt-4">
            <Button className="bg-pink-primary " onClick={submit}>
              Submit
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default KritikSaran;
