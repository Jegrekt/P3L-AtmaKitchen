part of 'laporan_bloc.dart';

@freezed
class LaporanState with _$LaporanState {
  const factory LaporanState.initial() = _Initial;
  const factory LaporanState.loading() = _Loading;
  const factory LaporanState.successStokBahanBaku(
      LaporanStokBahanBakuResponse response) = _SuccessStokBahanBaku;
  const factory LaporanState.successPenggunaanBahanBaku(
          LaporanPenggunaanBahanBakuResponse response) =
      _SuccessPenggunaanBahanBaku;
  const factory LaporanState.successPemasukanPengeluaran(
          LaporanPemasukanPengeluaranResponse response) =
      _SuccessPemasukanPengeluaran;
  const factory LaporanState.error(String message) = _Error;
}
