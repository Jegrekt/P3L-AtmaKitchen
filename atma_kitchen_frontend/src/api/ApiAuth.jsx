import useAxios from "./index";

export const loginAutentication = async (username, password) => {
  try {
    const response = await useAxios.post("/login", {
      username: username,
      password: password,
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const registerUser = async (data) => {
  try {
    const response = await useAxios.post("/register", data);
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const forgotPassword = async (username) => {
  try {
    const response = await useAxios.post("/forgot-password", {
      username: username,
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const changePasswordCustomer = async (data) => {
  try {
    const response = await useAxios.post("/reset-password", data);
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const changePassword = async (data) => {
  try {
    const response = await useAxios.post("/change-password", data, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error.response.data;
  }
};
