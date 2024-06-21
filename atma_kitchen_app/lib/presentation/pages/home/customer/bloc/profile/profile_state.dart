part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(ProfileResponseModel profile) = _Success;
  const factory ProfileState.error(String message) = _Error;
}
