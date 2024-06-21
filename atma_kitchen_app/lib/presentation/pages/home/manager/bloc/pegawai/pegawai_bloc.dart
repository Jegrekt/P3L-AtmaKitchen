import 'package:atma_kitchen_app/data/datasources/mo_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/karyawan_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pegawai_event.dart';
part 'pegawai_state.dart';
part 'pegawai_bloc.freezed.dart';

class PegawaiBloc extends Bloc<PegawaiEvent, PegawaiState> {
  final MoRemoteDatasource moRemoteDatasource;
  PegawaiBloc(this.moRemoteDatasource) : super(const _Initial()) {
    on<_GetKaryawan>((event, emit) async {
      emit(const PegawaiState.loading());
      final result = await moRemoteDatasource.getKaryawan();
      result.fold(
        (l) => emit(PegawaiState.error(l)),
        (r) => emit(PegawaiState.success(r)),
      );
    });
  }
}
