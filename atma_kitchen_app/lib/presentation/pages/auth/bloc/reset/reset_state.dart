part of 'reset_bloc.dart';

@freezed
class ResetState with _$ResetState {
  const factory ResetState.initial() = _Initial;
  const factory ResetState.loading() = _Loading;
  const factory ResetState.error(String message) = _Error;
  const factory ResetState.success(String message) = _Success;
}
