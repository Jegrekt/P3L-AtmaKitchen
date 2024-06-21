import React from "react";
import { number, rupiah } from "../../../../utils/rupiah";
import Table from "../../../../ui/Table";
function PSBKRow({ item: { nama, satuan, stok } }) {
  return (
    <Table.Row>
      <div>{nama}</div>
      <div>{satuan}</div>
      <div>{number(stok)}</div>
    </Table.Row>
  );
}

export default PSBKRow;
