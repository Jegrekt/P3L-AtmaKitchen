import useAxios from "./index";

export const getAlamatCustomer = async () => {
  try {
    const response = await useAxios.get(`/alamat?size=100`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const customerPesan = async (data) => {
  try {
    const response = await useAxios.post("/penjualan", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getPemesananById = async (id) => {
  try {
    const response = await useAxios.get(`/penjualan/view/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};
