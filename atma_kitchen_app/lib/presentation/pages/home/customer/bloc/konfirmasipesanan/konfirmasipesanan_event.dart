part of 'konfirmasipesanan_bloc.dart';

@freezed
class KonfirmasipesananEvent with _$KonfirmasipesananEvent {
  const factory KonfirmasipesananEvent.started() = _Started;
  const factory KonfirmasipesananEvent.getKonfirmasiPesanan(String search) =
      _GetKonfirmasiPesanan;
  const factory KonfirmasipesananEvent.konfirmasiPesanan(String id) =
      _KonfirmasiPesanan;
}
