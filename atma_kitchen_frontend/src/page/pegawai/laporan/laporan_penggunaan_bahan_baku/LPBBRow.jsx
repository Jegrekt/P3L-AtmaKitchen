import Table from "../../../../ui/Table";
function LPBBRow({ item }) {
  return (
    <Table.Row>
      <div>{item.nama_bahan}</div>
      <div>{item.satuan}</div>
      <div>{item.digunakan}</div>
    </Table.Row>
  );
}

export default LPBBRow;
