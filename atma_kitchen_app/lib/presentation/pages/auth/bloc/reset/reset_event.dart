part of 'reset_bloc.dart';

@freezed
class ResetEvent with _$ResetEvent {
  const factory ResetEvent.started() = _Started;
  const factory ResetEvent.resetPassword(String email) = _ResetPassword;
}
