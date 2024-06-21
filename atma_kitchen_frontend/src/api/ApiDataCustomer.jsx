import useAxios from "./index";

export const getDataCustomer = async (page, search) => {
  try {
    const response = await useAxios.get(`/customer`, {
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

export const getHistoryPenjualanCustomer = async (page, search, id) => {
  try {
    const response = await useAxios.get(`/customer/history/${id}`, {
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
