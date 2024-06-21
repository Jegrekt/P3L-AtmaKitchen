part of 'ketidakhadiran_bloc.dart';

@freezed
class KetidakhadiranEvent with _$KetidakhadiranEvent {
  const factory KetidakhadiranEvent.started() = _Started;
  const factory KetidakhadiranEvent.getKetidakhadiran(int bulan, int tahun) =
      _GetKetidakhadiran;
  const factory KetidakhadiranEvent.addKetidakhadiran(int id, String tanggal) =
      _AddKetidakhadiran;
}
