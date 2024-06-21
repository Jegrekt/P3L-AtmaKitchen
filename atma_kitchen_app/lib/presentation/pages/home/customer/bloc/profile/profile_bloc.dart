import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/profile_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CustomerRemoteDatasource customerRemoteDatasource;
  ProfileBloc(this.customerRemoteDatasource) : super(const _Initial()) {
    on<_GetProfile>((event, emit) async {
      emit(const _Loading());
      final result = await customerRemoteDatasource.getProfile();
      result.fold(
        (error) => emit(_Error(error)),
        (profile) => emit(_Success(profile)),
      );
    });
  }
}
