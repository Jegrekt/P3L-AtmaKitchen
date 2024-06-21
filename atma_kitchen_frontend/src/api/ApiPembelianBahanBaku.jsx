import useAxios from "./index";

export const getPembelianBahanBaku = async (page, search) => {
    try {
        const response = await useAxios.get(`/pbb`, {
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

export const addPembelianBahanBaku = async (data) => {
    try {
        const response = await useAxios.post("/pbb", data, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
        });
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};

export const getPembelianBahanBakuById = async (id) => {
    try {
        const response = await useAxios.get(`/pbb/${id}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
        });
        return response.data.data;
    } catch (error) {
        throw error.response.data;
    }
};

export const updatePembelianBahanBaku = async (id, data) => {
    try {
        const response = await useAxios.put(`/pbb/${id}`, data, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
        });
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};

export const deleatePembelianBahanBaku = async (id) => {
    try {
        const response = await useAxios.delete(`/pbb/${id}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
        });
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};
