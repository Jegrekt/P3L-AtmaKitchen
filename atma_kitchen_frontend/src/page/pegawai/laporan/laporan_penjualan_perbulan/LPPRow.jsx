import React from "react";
import Table from "../../../../ui/Table";
import { number, rupiah } from "../../../../utils/rupiah";
const monthNames = [
  "Januari",
  "Februari",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Agustus",
  "September",
  "Oktober",
  "November",
  "Desember",
];
function LPPRow({ item }) {
  return (
    <Table.Row>
      <div>{monthNames[item.bulan - 1]}</div>
      <div>{number(item.jumlah_transaksi)}</div>
      <div>{rupiah(item.jumlah_uang)}</div>
    </Table.Row>
  );
}

export default LPPRow;
