part of 'pegawai_bloc.dart';

@freezed
class PegawaiState with _$PegawaiState {
  const factory PegawaiState.initial() = _Initial;
  const factory PegawaiState.loading() = _Loading;
  const factory PegawaiState.success(
      KaryawanResponseModel karyawanResponseModel) = _Success;
  const factory PegawaiState.error(String message) = _Error;
}
