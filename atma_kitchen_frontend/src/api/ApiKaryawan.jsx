import useAxios from "./index";

export const getKarayawan = async (page, search) => {
  try {
    const response = await useAxios.get(`/pegawai`, {
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

export const addKaryawan = async (data) => {
  try {
    const response = await useAxios.post("/pegawai", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getKaryawanById = async (id) => {
  try {
    const response = await useAxios.get(`/pegawai/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateKaryawan = async (id, data) => {
  try {
    const response = await useAxios.put(`/pegawai/${id}`, data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const deleteKaryawan = async (id) => {
  try {
    const response = await useAxios.delete(`/pegawai/${id}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const updateGaji = async (role, data) => {
  try {
    const response = await useAxios.post(
      `/pegawai/update-gaji/${role}`,
      {
        gaji_dasar_harian: data,
      },
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

export const updateBonus = async (id, data) => {
  try {
    const response = await useAxios.post(
      `/pegawai/update-bonus/${id}`,
      {
        bonus: data,
      },
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
