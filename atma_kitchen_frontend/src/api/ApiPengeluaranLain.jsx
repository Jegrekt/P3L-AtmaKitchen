import useAxios from "./index";

export const getPengeluaranLain = async (page, search) => {
  try {
    const response = await useAxios.get("/pll", {
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

export const addPengeluaranLain = async (data) => {
  try {
    const response = await useAxios.post("/pll", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getPengeluaranLainById = async (id) => {
  try {
    const response = await useAxios.get(`/pll/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updatePengeluaranLain = async (id, data) => {
  try {
    const response = await useAxios.put(`/pll/${id}`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const deletePengeluaranLain = async (id) => {
  try {
    const response = await useAxios.delete(`/pll/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
