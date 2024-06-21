import useAxios from "./index";

export const getStock = async (tanggal, search) => {
  try {
    const response = await useAxios.get(`/produk/stok-kuota?size=100`, {
      params: {
        tanggal: tanggal,
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
