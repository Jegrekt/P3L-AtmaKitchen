import useAxios from "./index";

export const getKonfirmasiProses = async (page, search) => {
  try {
    const response = await useAxios.get(`/penjualan/proses-hari-ini`, {
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

export const KonfirmasiProses = async (id) => {
  try {
    const response = await useAxios.put(
      `/penjualan/proses/${id}`,
      {},
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
