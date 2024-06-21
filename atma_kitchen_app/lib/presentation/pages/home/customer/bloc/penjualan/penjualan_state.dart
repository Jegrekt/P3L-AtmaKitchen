part of 'penjualan_bloc.dart';

@freezed
class PenjualanState with _$PenjualanState {
  const factory PenjualanState.initial() = _Initial;
  const factory PenjualanState.loading() = _Loading;
  const factory PenjualanState.success(HistoryPenjualanModel data) = _Success;
  const factory PenjualanState.error(String message) = _Error;
}
