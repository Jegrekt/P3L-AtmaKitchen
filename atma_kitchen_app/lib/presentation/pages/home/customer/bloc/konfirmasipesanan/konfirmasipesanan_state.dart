part of 'konfirmasipesanan_bloc.dart';

@freezed
class KonfirmasipesananState with _$KonfirmasipesananState {
  const factory KonfirmasipesananState.initial() = _Initial;
  const factory KonfirmasipesananState.loading() = _Loading;
  const factory KonfirmasipesananState.success(
      List<KonfirmasiPesanan> konfirmasiPesanan) = _Success;
  const factory KonfirmasipesananState.successKonfirmasi(String message) =
      _SuccessKonfirmasi;
  const factory KonfirmasipesananState.error(String message) = _Error;
}
