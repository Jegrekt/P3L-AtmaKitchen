import React from "react";
import { rupiah } from "../../../../utils/rupiah";
import Table from "../../../../ui/Table";

function LPPPRow({ item: { produk, kuantitas, harga, jumlah_uang } }) {
  return (
    <Table.Row>
      <div>{produk}</div>
      <div>{kuantitas}</div>
      <div>{rupiah(harga)}</div>
      <div>{rupiah(jumlah_uang)}</div>
    </Table.Row>
  );
}

export default LPPPRow;
