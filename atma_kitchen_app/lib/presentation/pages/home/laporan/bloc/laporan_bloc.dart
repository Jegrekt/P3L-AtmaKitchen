import 'package:atma_kitchen_app/data/datasources/laporan_remote_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/laporan/laporan_pemasukan_pengeluaran_response.dart';
import 'package:atma_kitchen_app/data/models/response/laporan/laporan_penggunaan_bahan_baku_response.dart';
import 'package:atma_kitchen_app/data/models/response/laporan/laporan_stok_bahan_baku_response.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'laporan_event.dart';
part 'laporan_state.dart';
part 'laporan_bloc.freezed.dart';

class LaporanBloc extends Bloc<LaporanEvent, LaporanState> {
  final LaporanRemoteDatasource laporanRemoteDatasource;
  LaporanBloc(this.laporanRemoteDatasource) : super(const _Initial()) {
    on<_GetStokBahanBaku>((event, emit) async {
      emit(const _Loading());
      final response = await laporanRemoteDatasource.getStokBahanBaku();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_SuccessStokBahanBaku(r)),
      );
    });

    on<_GetPenggunaanBahanBaku>((event, emit) async {
      emit(const _Loading());
      final response = await laporanRemoteDatasource.getPenggunaanBahanBaku(
          event.tanggalAwal, event.tanggalAkhir);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_SuccessPenggunaanBahanBaku(r)),
      );
    });

    on<_GetPemasukanPengeluaran>((event, emit) async {
      emit(const _Loading());
      final response = await laporanRemoteDatasource.getPemasukanPengeluaran(
          event.tahun, event.bulan);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_SuccessPemasukanPengeluaran(r)),
      );
    });
  }
}
