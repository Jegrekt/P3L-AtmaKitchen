import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/history_penjualan_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'penjualan_event.dart';
part 'penjualan_state.dart';
part 'penjualan_bloc.freezed.dart';

class PenjualanBloc extends Bloc<PenjualanEvent, PenjualanState> {
  final CustomerRemoteDatasource customerRemoteDatasource;
  PenjualanBloc(this.customerRemoteDatasource) : super(const _Initial()) {
    on<_GetHistoryPenjualan>((event, emit) async {
      emit(const _Loading());
      final result =
          await customerRemoteDatasource.getHistoryPenjualan(event.search);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
