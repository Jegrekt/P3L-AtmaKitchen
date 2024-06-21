import 'package:atma_kitchen_app/data/datasources/mo_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/ketidakhadiran_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ketidakhadiran_event.dart';
part 'ketidakhadiran_state.dart';
part 'ketidakhadiran_bloc.freezed.dart';

class KetidakhadiranBloc
    extends Bloc<KetidakhadiranEvent, KetidakhadiranState> {
  final MoRemoteDatasource moRemoteDatasource;
  KetidakhadiranBloc(this.moRemoteDatasource) : super(const _Initial()) {
    on<_GetKetidakhadiran>((event, emit) async {
      emit(const _Loading());
      final result =
          await moRemoteDatasource.getKetidakHadiran(event.bulan, event.tahun);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });

    on<_AddKetidakhadiran>((event, emit) async {
      emit(const _Loading());
      final result = await moRemoteDatasource.addKetidakhadiran(
        event.id,
        event.tanggal,
      );
      result.fold(
        (l) => emit(_AddError(l)),
        (r) => emit(_AddSuccess(r)),
      );
    });
  }
}
