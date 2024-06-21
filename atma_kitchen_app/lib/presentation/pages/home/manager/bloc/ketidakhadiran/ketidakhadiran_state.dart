part of 'ketidakhadiran_bloc.dart';

@freezed
class KetidakhadiranState with _$KetidakhadiranState {
  const factory KetidakhadiranState.initial() = _Initial;
  const factory KetidakhadiranState.loading() = _Loading;
  const factory KetidakhadiranState.success(KetidakhadiranResponseModel data) =
      _Success;
  const factory KetidakhadiranState.error(String message) = _Error;

  const factory KetidakhadiranState.addSuccess(String message) = _AddSuccess;
  const factory KetidakhadiranState.addError(String message) = _AddError;
}
