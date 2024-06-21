import useAxios from "./index";

export const getDataBahanBaku = async (page, search) => {
  try {
    const response = await useAxios.get(
      `/bahan-baku?page=${page}&search=${search}`,
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

export const addDataBahanBaku = async (data) => {
  try {
    const response = await useAxios.post("/bahan-baku", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getDataBahanBakuById = async (id) => {
  try {
    const response = await useAxios.get(`/bahan-baku/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateDataBahanBaku = async (id, data) => {
  try {
    const response = await useAxios.put(`/bahan-baku/${id}`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const deleteDataBahanBaku = async (id) => {
  try {
    const response = await useAxios.delete(`/bahan-baku/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
