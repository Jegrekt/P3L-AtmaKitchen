import 'package:atma_kitchen_app/data/datasources/auth_remote_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/firebase_api.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LogoutBloc(this.authRemoteDatasource) : super(const _Initial()) {
    on<_Logout>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDatasource.logout();
      result.fold(
        (error) => emit(_Error(error)),
        (message) async {
          emit(_Success(message));
          await FirebaseApi().unsubscribeToTopic(event.id);
        },
      );
    });
  }
}
