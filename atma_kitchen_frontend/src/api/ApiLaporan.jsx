import useAxios from "./index";

export const getLaporanPenjualanPerBulan = async (tahun) => {
  try {
    const response = await useAxios.get(
      `/laporan/penjualan-bulanan?tahun=${tahun}`,
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

export const getLaporanPenjualanPerProduk = async (tahun, bulan) => {
  try {
    const response = await useAxios.get(
      `/laporan/per-produk?tahun=${tahun}&bulan=${bulan}`,
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

export const getLaporanStokBahanBaku = async () => {
  try {
    const response = await useAxios.get(`/laporan/stok-bahan-baku`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getLaporanPenggunaanBahanBaku = async (startDate, endDate) => {
  try {
    const response = await useAxios.get(`/laporan/penggunaan-bahan-baku`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      params: {
        tanggal_awal: startDate,
        tanggal_akhir: endDate,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getLaporanPresensiDanGaji = async (bulan, tahun) => {
  try {
    const response = await useAxios.get(`/laporan/presensi-karyawan`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      params: {
        bulan,
        tahun,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getLaporanPemasukanDanPengeluaran = async (bulan, tahun) => {
  try {
    const response = await useAxios.get(`/laporan/pemasukan-pengeluaran`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      params: {
        bulan,
        tahun,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};

export const getLaporanPenitip = async (bulan, tahun) => {
  try {
    const response = await useAxios.get(`/laporan/transaksi-penitip`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
      params: {
        bulan,
        tahun,
      },
    });
    return response.data.data;
  } catch (error) {
    throw error.response.data;
  }
};
