import useAxios from "./index";

export const getListTransaksiTerlambat = async (page, search) => {
  try {
    const response = await useAxios.get(`/penjualan/terlambat-bayar`, {
      params: {
        page: page,
        search: search,
      },
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const BulkCancelTransaksi = async () => {
  try {
    const response = await useAxios.post(
      `/penjualan/autocancel`,
      {},
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
