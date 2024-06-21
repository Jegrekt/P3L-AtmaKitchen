import React from "react";
import { baseImageUrl } from "../../../utils/Constants";
import Table from "../../../ui/Table";
import { rupiah } from "../../../utils/rupiah";

function DetailHisotoryRow({ item }) {
  return (
    <Table.Row>
      <div>
        <img
          src={
            item?.produk?.foto
              ? baseImageUrl + item?.produk?.foto
              : `
            /blank_image.png`
          }
          alt="gambar"
          className="w-full h-40 mb-4 object-cover rounded-lg"
        />
      </div>
      <div>{item?.produk?.nama}</div>
      <div>{item?.qty}</div>
      <div className="font-numeric font-medium text-green-600 text-sm">
        {rupiah(item?.subtotal)}
      </div>
    </Table.Row>
  );
}

export default DetailHisotoryRow;
