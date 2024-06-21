import useAxios from "./index";

export const getProfilCustomer = async () => {
  try {
    const response = await useAxios.get("/customer/profile", {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getHistoryPenjualan = async (page, search) => {
  try {
    const response = await useAxios.get("customer/history?search=", {
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

export const updateProfileCustomer = async (data) => {
  try {
    const response = await useAxios.put(
      "/customer/profile",
      {
        username: data.username,
        name: data.name,
        tanggal_lahir: data.customer.tanggal_lahir,
        no_telp: data.customer.no_telp,
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
