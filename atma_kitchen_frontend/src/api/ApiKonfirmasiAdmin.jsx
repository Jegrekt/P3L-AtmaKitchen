import useAxios from "./index";

export const getListSedangDiProses = async (page, search) => {
  try {
    const response = await useAxios.get(`/penjualan/sedang-diproses`, {
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

export const updateStatusDiproses = async (id) => {
  try {
    const response = await useAxios.put(
      `/penjualan/update-status-proses/${id}`,
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

export const getListPesananSiap = async (page, search) => {
  try {
    const response = await useAxios.get(`/penjualan/siap-dipu`, {
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

export const updateStatusSiap = async (id) => {
  try {
    const response = await useAxios.put(
      `/penjualan/update-status-diambil/${id}`,
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
