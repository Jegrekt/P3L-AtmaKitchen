part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.register({
    required String nama,
    required String username,
    required String password,
    required String alamat,
    required String tglLahir,
    required String noTelp,
  }) = _Register;
}
