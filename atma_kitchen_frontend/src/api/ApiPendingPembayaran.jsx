import useAxios from "./index";

export const getPendingPembayaran = async (page, search) => {
  try {
    const response = await useAxios.get(`/penjualan/pending-pembayaran`, {
      params: {
        page,
        search,
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

export const uploadBuktiPembayaran = async (id, data) => {
  try {
    const response = await useAxios.post(
      `/penjualan/bukti-pembayaran/${id}`,
      {
        metode_pembayaran: data.metode_pembayaran,
        bukti_pembayaran: data.bukti_pembayaran,
      },
      {
        headers: {
          "Content-Type": "multipart/form-data",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      }
    );
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
