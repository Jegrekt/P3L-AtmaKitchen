import Table from "../../../../ui/Table";
import { rupiah } from "../../../../utils/rupiah";
function LPRow({ item }) {
  return (
    <Table.Row>
      <div>{item.nama}</div>
      <div>{item.qty}</div>
      <div>
        {rupiah(item.harga_jual)}
      </div>
      <div>{rupiah(item.total)}</div>
      <div>{rupiah(item.komisi)}</div>
      <div>
        {rupiah(item.yang_diterima)}
      </div>
    </Table.Row>
  );
}

export default LPRow;
