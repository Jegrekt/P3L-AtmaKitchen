import Table from "../../../../ui/Table";
import { rupiah } from "../../../../utils/rupiah";
function LPDGRow({ item }) {
  return (
    <Table.Row>
      <div>{item.nama}</div>
      <div>{item.jumlah_hadir}</div>
      <div>{item.jumlah_bolos}</div>
      <div>
        {rupiah(item.honor_harian)}
      </div>
      <div>
        {rupiah(item.bonus_rajin)}
      </div>
      <div>{rupiah(item.total)}</div>
    </Table.Row>
  );
}

export default LPDGRow;
