import useAxios from "./index";

export const getPendingPembayaran = async () => {
  try {
    const response = await useAxios.get(
      `/penjualan/pending-konfirmasi-pembayaran?size=100`,
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      }
    );
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const konfirmasiPembayaran = async (id, jumlah_pembayaran) => {
  try {
    const response = await useAxios.put(
      `/penjualan/konfirmasi-pembayaran/${id}`,
      {
        jumlah_pembayaran: jumlah_pembayaran,
      },
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      }
    );
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
