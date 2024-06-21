part of 'penjualan_bloc.dart';

@freezed
class PenjualanEvent with _$PenjualanEvent {
  const factory PenjualanEvent.started() = _Started;
  const factory PenjualanEvent.getHistoryPenjualan(String search) =
      _GetHistoryPenjualan;
}
