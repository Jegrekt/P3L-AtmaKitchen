import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String username, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> register(String nama, String username,
      String password, String alamat, String tglLahir, String no_telp) async {
    final url = Uri.parse('${Variables.baseUrl}/register');
    final response = await http.post(
      url,
      body: {
        'name': nama,
        'username': username,
        'password': password,
        'alamat': alamat,
        'tanggal_lahir': tglLahir,
        'no_telp': no_telp,
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return const Right("Berhasil mendaftar");
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> resetPassword(String email) async {
    final url = Uri.parse('${Variables.baseUrl}/forgot-password');
    final response = await http.post(
      url,
      body: {
        'username': email,
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return const Right("Berhasil reset password");
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final url = Uri.parse('${Variables.baseUrl}/logout');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.delete(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return const Right("Berhasil logout");
    } else {
      return Left(response.body);
    }
  }
}
