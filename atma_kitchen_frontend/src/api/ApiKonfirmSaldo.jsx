import useAxios from "./index";

export const getListPendingKonfirmasiSaldo = async (page, search) => {
  try {
    const response = await useAxios.get(`/history-saldo/admin`, {
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

export const konfirmasiSaldo = async (id) => {
  try {
    const response = await useAxios.put(
      `/history-saldo/approve/${id}`,
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
