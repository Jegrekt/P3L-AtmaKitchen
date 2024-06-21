part of 'laporan_bloc.dart';

@freezed
class LaporanEvent with _$LaporanEvent {
  const factory LaporanEvent.started() = _Started;
  const factory LaporanEvent.getStokBahanBaku() = _GetStokBahanBaku;
  const factory LaporanEvent.getPenggunaanBahanBaku({
    required String tanggalAwal,
    required String tanggalAkhir,
  }) = _GetPenggunaanBahanBaku;
  const factory LaporanEvent.getPemasukanPengeluaran({
    required int tahun,
    required int bulan,
  }) = _GetPemasukanPengeluaran;
}
