import {
  IconButton,
  Menu,
  MenuHandler,
  MenuList,
  MenuItem,
  Input,
  Checkbox,
  Chip,
} from "@material-tailwind/react";
import Table from "../../../../ui/Table";
import { rupiah } from "../../../../utils/rupiah";

import { FaEye, FaTrash } from "react-icons/fa";
import { kategoriProduk } from "../../../../utils/Constants";

function ProdukRow({
  item: {
    id,
    nama,
    id_kategori,
    id_penitip,
    harga,
    harga_setengah_loyang,
    stok_ready,
    penitip,
    kategori_produk,
  },
  goToDetailProduk,
  arrayProduk,
  onChangeProduk,
  handleOpenDelete,
}) {
  const item = arrayProduk?.find((produk) => produk.id_produk === id);
  const checked = item?.id_produk !== undefined;
  const qty = item?.qty || 0;
  return (
    <Table.Row>
      <div>{nama}</div>
      <Chip
        size="sm"
        className="w-min"
        color={
          kategoriProduk[id_kategori - 1]?.color || kategoriProduk[0]?.color
        }
        value={kategori_produk.nama}
      />
      {onChangeProduk || (
        <div>{id_penitip ? penitip?.nama : <span>&mdash;</span>}</div>
      )}
      <div className="font-numeric font-medium text-green-600 text-sm">
        {rupiah(harga)}
      </div>
      {onChangeProduk || (
        <div className="font-numeric font-medium  text-sm">
          {harga_setengah_loyang ? (
            rupiah(harga_setengah_loyang)
          ) : (
            <span>&mdash;</span>
          )}
        </div>
      )}

      <div>{stok_ready}</div>
      {onChangeProduk ? (
        <>
          <Input
            label="Qty"
            type="number"
            disabled={!checked}
            value={qty}
            onChange={(e) => onChangeProduk(id, checked, e.target.value, true)}
          />
          <Checkbox
            color="pink"
            checked={checked}
            onChange={(e) => onChangeProduk(id, e.target.checked, qty, false)}
          />
        </>
      ) : (
        <Menu>
          <MenuHandler>
            <IconButton variant="text">
              <i className="fa-solid fa-ellipsis-vertical text-gray-700"></i>
            </IconButton>
          </MenuHandler>
          <MenuList>
            <MenuItem onClick={() => goToDetailProduk(id)}>
              <div className="flex gap-2 items-center">
                <FaEye /> Lihat Detail
              </div>
            </MenuItem>
            <MenuItem onClick={() => handleOpenDelete(id)}>
              <div className="flex gap-2 items-center">
                <FaTrash /> Delete
              </div>
            </MenuItem>
          </MenuList>
        </Menu>
      )}
    </Table.Row>
  );
}

export default ProdukRow;
