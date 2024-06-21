import 'package:atma_kitchen_app/data/datasources/auth_remote_datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasource authRemoteDatasource;
  RegisterBloc(this.authRemoteDatasource) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDatasource.register(
          event.nama,
          event.username,
          event.password,
          event.alamat,
          event.tglLahir,
          event.noTelp);

      result.fold(
        (error) => emit(_Error(error)),
        (message) => emit(_Success(message)),
      );
    });
  }
}
