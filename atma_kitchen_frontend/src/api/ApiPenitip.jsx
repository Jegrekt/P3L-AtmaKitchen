import useAxios from "./index";

export const getPenitip = async (page, search) => {
  try {
    const response = await useAxios.get(`/penitip`, {
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

export const addPenitip = async (data) => {
  try {
    const response = await useAxios.post("/penitip", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getPenitipById = async (id) => {
  try {
    const response = await useAxios.get(`/penitip/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updatePenitip = async (id, data) => {
  try {
    const response = await useAxios.put(`/penitip/${id}`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const deletePenitip = async (id) => {
  try {
    const response = await useAxios.delete(`/penitip/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
