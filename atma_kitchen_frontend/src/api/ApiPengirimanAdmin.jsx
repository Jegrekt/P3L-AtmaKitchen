import useAxios from "./index";

export const getPendingOngkir = async () => {
  try {
    const response = await useAxios.get(`/penjualan/pending-ongkir?size=100`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const inputJarak = async (id, jarak) => {
  try {
    const response = await useAxios.put(
      `/penjualan/input-jarak/${id}`,
      { jarak },
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
