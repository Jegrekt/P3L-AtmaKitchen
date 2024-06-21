part of 'produk_bloc.dart';

@freezed
class ProdukEvent with _$ProdukEvent {
  const factory ProdukEvent.started() = _Started;
  const factory ProdukEvent.getProduk() = _GetProduk;
}
