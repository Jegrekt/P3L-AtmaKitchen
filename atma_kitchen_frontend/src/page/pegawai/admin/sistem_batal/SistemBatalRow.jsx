import React from "react";
import Table from "../../../../ui/Table";
import {
  IconButton,
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import { setDate } from "../../../../utils/setDate";
import { rupiah } from "../../../../utils/rupiah";

function SistemBatalRow({
  item: {
    id,
    no_nota,
    jenis_pengiriman,
    status_pesanan,
    tanggal_siap,
    grand_total,
    tip,
  },
}) {
  return (
    <Table.Row>
      <div>{no_nota}</div>
      <div>{jenis_pengiriman}</div>
      <div>{status_pesanan}</div>
      <div>{setDate(tanggal_siap)}</div>
      <div className="text-lg font-numeric text-green-400">
        {rupiah(grand_total)}
      </div>
      <div className="text-lg font-numeric text-green-400">{rupiah(tip)}</div>
    </Table.Row>
  );
}

export default SistemBatalRow;
