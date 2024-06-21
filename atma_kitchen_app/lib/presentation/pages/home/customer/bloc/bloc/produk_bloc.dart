import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/models/response/all_product_customer_response_model.dart';

part 'produk_event.dart';
part 'produk_state.dart';
part 'produk_bloc.freezed.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  final CustomerRemoteDatasource customerRemoteDatasource;
  ProdukBloc(this.customerRemoteDatasource) : super(const _Initial()) {
    on<_GetProduk>((event, emit) async {
      emit(const _Loading());
      final result = await customerRemoteDatasource.getAllProducts();
      result.fold(
        (l) => emit(_Error(l.toString())),
        (r) => emit(_Success(r.data!.data!)),
      );
    });
  }
}
