import 'package:atma_kitchen_app/data/datasources/auth_remote_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/firebase_api.dart';
import 'package:atma_kitchen_app/data/models/response/auth_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LoginBloc(
    this.authRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result =
          await authRemoteDatasource.login(event.username, event.password);
      result.fold(
        (error) => emit(_Error(error)),
        (authResponseModel) async {
          emit(_Success(authResponseModel));
          await FirebaseApi()
              .initNotifications(authResponseModel.data!.user!.id!);
        },
      );
    });
  }
}
