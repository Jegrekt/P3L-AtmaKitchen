import 'package:atma_kitchen_app/data/datasources/auth_remote_datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_event.dart';
part 'reset_state.dart';
part 'reset_bloc.freezed.dart';

class ResetBloc extends Bloc<ResetEvent, ResetState> {
  final AuthRemoteDatasource authRemoteDatasource;
  ResetBloc(
    this.authRemoteDatasource,
  ) : super(const _Initial()) {
    on<_ResetPassword>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDatasource.resetPassword(event.email);
      result.fold(
        (error) => emit(_Error(error)),
        (message) => emit(_Success(message)),
      );
    });
  }
}
