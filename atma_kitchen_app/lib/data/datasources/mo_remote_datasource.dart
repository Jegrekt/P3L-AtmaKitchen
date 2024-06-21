import 'package:atma_kitchen_app/data/datasources/auth_local_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/karyawan_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/constants/variables.dart';
import '../models/response/ketidakhadiran_response_model.dart';
import 'package:http/http.dart' as http;

class MoRemoteDatasource {
  Future<Either<String, KetidakhadiranResponseModel>> getKetidakHadiran(
      int bulan, int tahun) async {
    final url = Uri.parse(
        '${Variables.baseUrl}/absensi?bulan=$bulan&tahun=$tahun&size=100');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(KetidakhadiranResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, KaryawanResponseModel>> getKaryawan() async {
    final url = Uri.parse('${Variables.baseUrl}/pegawai');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(KaryawanResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> addKetidakhadiran(
      int id, String tanggal) async {
    final url = Uri.parse('${Variables.baseUrl}/absensi');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
      body: {
        'id_pegawai': id.toString(),
        'tanggal': tanggal,
      },
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return const Right('Berhasil Menambah Ketidakhadiran');
    } else {
      return Left(response.body);
    }
  }
}
