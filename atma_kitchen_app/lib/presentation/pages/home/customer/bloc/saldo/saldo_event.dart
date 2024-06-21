part of 'saldo_bloc.dart';

@freezed
class SaldoEvent with _$SaldoEvent {
  const factory SaldoEvent.started() = _Started;
  const factory SaldoEvent.getHistorySaldo() = _GetHistorySaldo;
  const factory SaldoEvent.withdrawSaldo(int amount, String description) =
      _WithdrawSaldo;
}
