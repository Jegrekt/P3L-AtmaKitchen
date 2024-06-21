part of 'pegawai_bloc.dart';

@freezed
class PegawaiEvent with _$PegawaiEvent {
  const factory PegawaiEvent.started() = _Started;
  const factory PegawaiEvent.getKaryawan() = _GetKaryawan;
}
