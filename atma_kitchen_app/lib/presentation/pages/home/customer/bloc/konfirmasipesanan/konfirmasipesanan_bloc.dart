import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/konfirmasi_pesanan_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'konfirmasipesanan_event.dart';
part 'konfirmasipesanan_state.dart';
part 'konfirmasipesanan_bloc.freezed.dart';

class KonfirmasipesananBloc
    extends Bloc<KonfirmasipesananEvent, KonfirmasipesananState> {
  final CustomerRemoteDatasource customerRemoteDatasource;
  KonfirmasipesananBloc(this.customerRemoteDatasource)
      : super(const _Initial()) {
    on<_GetKonfirmasiPesanan>((event, emit) async {
      emit(const _Loading());
      final result =
          await customerRemoteDatasource.getAllKonfirmasiPesanan(event.search);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r.data!.data!)),
      );
    });

    on<_KonfirmasiPesanan>((event, emit) async {
      emit(const _Loading());
      final result = await customerRemoteDatasource.konfirmasiPesanan(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          emit(_SuccessKonfirmasi(r));
          add(const _GetKonfirmasiPesanan(''));
        },
      );
    });
  }
}
