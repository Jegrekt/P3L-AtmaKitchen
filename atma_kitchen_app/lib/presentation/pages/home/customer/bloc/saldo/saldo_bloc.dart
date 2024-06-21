import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/saldo_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saldo_event.dart';
part 'saldo_state.dart';
part 'saldo_bloc.freezed.dart';

class SaldoBloc extends Bloc<SaldoEvent, SaldoState> {
  final CustomerRemoteDatasource customerRemoteDatasource;
  SaldoBloc(this.customerRemoteDatasource) : super(const _Initial()) {
    on<_GetHistorySaldo>((event, emit) async {
      emit(const _Loading());
      final result = await customerRemoteDatasource.getSaldo();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });

    on<_WithdrawSaldo>((event, emit) async {
      emit(const _Loading());
      final result = await customerRemoteDatasource.withDrawSaldo(
          event.amount, event.description);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          emit(_SuccessWithdraw(r));
          add(const _GetHistorySaldo());
        },
      );
    });
  }
}
