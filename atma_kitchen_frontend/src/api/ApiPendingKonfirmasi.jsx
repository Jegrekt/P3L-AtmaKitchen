import useAxios from "./index";

export const getPendingKonfirmasi = async (page, search) => {
  try {
    const response = await useAxios.get(
      `/penjualan/pending-konfirmasi-pembuatan`,
      {
        params: {
          page,
          search,
        },
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

export const cekBahanBaku = async (id) => {
  try {
    const response = await useAxios.get(`/penjualan/bahan-baku/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const konfirmasiPembuatan = async (id, status) => {
  try {
    const response = await useAxios.put(
      `/penjualan/konfirmasi-pesanan/${id}`,
      { status: status },
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
