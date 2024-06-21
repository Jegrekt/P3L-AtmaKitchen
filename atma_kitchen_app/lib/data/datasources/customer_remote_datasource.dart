import 'package:atma_kitchen_app/data/datasources/auth_local_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/all_product_customer_response_model.dart';
import 'package:atma_kitchen_app/data/models/response/history_penjualan_model.dart';
import 'package:atma_kitchen_app/data/models/response/konfirmasi_pesanan_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/constants/variables.dart';
import '../models/response/profile_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/response/saldo_response_model.dart';

class CustomerRemoteDatasource {
  Future<Either<String, ProfileResponseModel>> getProfile() async {
    final url = Uri.parse('${Variables.baseUrl}/customer/profile');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(ProfileResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, HistoryPenjualanModel>> getHistoryPenjualan(
      String search) async {
    final url = Uri.parse(
        '${Variables.baseUrl}/customer/history?search=$search&size=100');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(HistoryPenjualanModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, AllProductCustomerResponseModel>>
      getAllProducts() async {
    final url = Uri.parse('${Variables.baseUrl}/produk/stok-kuota?size=100');
    final response = await http.get(
      url,
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(AllProductCustomerResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, SaldoResponseModel>> getSaldo() async {
    final url =
        Uri.parse('${Variables.baseUrl}/history-saldo/customer?size=100');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(SaldoResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> withDrawSaldo(
      int amount, String desceription) async {
    final url =
        Uri.parse('${Variables.baseUrl}/history-saldo/ajukan-penarikan');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
      body: {
        'nominal': amount.toString(),
        'catatan': desceription,
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return const Right('Berhasil melakukan penarikan saldo');
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, KonfirmasiPesananResponseModel>>
      getAllKonfirmasiPesanan(String search) async {
    final url = Uri.parse(
        '${Variables.baseUrl}/penjualan/sedang-dikirim?size=100&search=$search');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Right(KonfirmasiPesananResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> konfirmasiPesanan(String id) async {
    final url =
        Uri.parse('${Variables.baseUrl}/penjualan/konfirmasi-penerimaan/$id');
    final userData = await AuthLocalDatasource().getAuthData();
    final response = await http.put(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userData.data!.token}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return const Right('Berhasil konfirmasi pesanan');
    } else {
      return Left(response.body);
    }
  }
}
