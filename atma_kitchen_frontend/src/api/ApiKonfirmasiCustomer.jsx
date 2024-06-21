import useAxios from "./index";

export const getListKonfirmasiCustomer = async (page, search) => {
  try {
    const response = await useAxios.get(`/penjualan/sedang-dikirim`, {
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

export const KonfirmasiCustomerLast = async (id) => {
  try {
    const response = await useAxios.put(
      `/penjualan/konfirmasi-penerimaan/${id}`,
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
