import useAxios from "./index";

export const getDataProduk = async (page, search) => {
  try {
    const response = await useAxios.get(`/produk`, {
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

export const addDataProduk = async (data) => {
  try {
    const response = await useAxios.post("/produk", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getProdukById = async (id) => {
  try {
    const response = await useAxios.get(`/produk/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateDataProduk = async (id, data) => {
  try {
    const response = await useAxios.put(`/produk/${id}`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const deleteProduk = async (id) => {
  try {
    const response = await useAxios.delete(`/produk/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateFotoProduk = async (id, data) => {
  try {
    const response = await useAxios.post(`/produk/${id}/foto`, data, {
      headers: {
        "Content-Type": "multipart/form-data",
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateResepProduk = async (id, data) => {
  try {
    const response = await useAxios.put(`/produk/${id}/resep`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateHampersProduk = async (id, data) => {
  try {
    const response = await useAxios.put(`/produk/${id}/hampers`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updatePenitipProduk = async (id, data) => {
  try {
    const response = await useAxios.put(`/produk/${id}/penitip`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
