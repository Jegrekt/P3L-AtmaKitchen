import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/laporan/laporan_pemasukan_pengeluaran_response.dart';
import 'package:atma_kitchen_app/data/models/response/laporan/laporan_penggunaan_bahan_baku_response.dart';
import 'package:atma_kitchen_app/data/models/response/laporan/laporan_stok_bahan_baku_response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'auth_local_datasource.dart';

class LaporanRemoteDatasource {
  Future<Either<String, LaporanStokBahanBakuResponse>>
      getStokBahanBaku() async {
    final url = Uri.parse('${Variables.baseUrl}/laporan/stok-bahan-baku');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(LaporanStokBahanBakuResponse.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, LaporanPenggunaanBahanBakuResponse>>
      getPenggunaanBahanBaku(String tanggalAwal, String tanggalAkhir) async {
    final url = Uri.parse(
        '${Variables.baseUrl}/laporan/penggunaan-bahan-baku?tanggal_awal=$tanggalAwal&tanggal_akhir=$tanggalAkhir');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(LaporanPenggunaanBahanBakuResponse.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, LaporanPemasukanPengeluaranResponse>>
      getPemasukanPengeluaran(int tahun, int bulan) async {
    final url = Uri.parse(
        '${Variables.baseUrl}/laporan/pemasukan-pengeluaran?tahun=$tahun&bulan=$bulan');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(LaporanPemasukanPengeluaranResponse.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}
