part of 'saldo_bloc.dart';

@freezed
class SaldoState with _$SaldoState {
  const factory SaldoState.initial() = _Initial;
  const factory SaldoState.loading() = _Loading;
  const factory SaldoState.success(SaldoResponseModel saldoResponseModel) =
      _Success;
  const factory SaldoState.successWithdraw(String message) = _SuccessWithdraw;
  const factory SaldoState.error(String message) = _Error;
}
