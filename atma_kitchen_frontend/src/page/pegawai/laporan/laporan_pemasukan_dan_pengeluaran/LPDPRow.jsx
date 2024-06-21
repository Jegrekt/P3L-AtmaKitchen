import Table from "../../../../ui/Table";
import { rupiah } from "../../../../utils/rupiah";
function LPDPRow({ item }) {
  return (
    <Table.Row>
      <div>{item.nama}</div>
      <div className=" text-green-400">{rupiah(item.pemasukan)}</div>
      <div className=" text-red-400">{rupiah(item.pengeluaran)}</div>
    </Table.Row>
  );
}

export default LPDPRow;
