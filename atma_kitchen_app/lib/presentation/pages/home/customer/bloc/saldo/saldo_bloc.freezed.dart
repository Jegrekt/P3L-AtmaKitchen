// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saldo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaldoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistorySaldo,
    required TResult Function(int amount, String description) withdrawSaldo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistorySaldo,
    TResult? Function(int amount, String description)? withdrawSaldo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistorySaldo,
    TResult Function(int amount, String description)? withdrawSaldo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistorySaldo value) getHistorySaldo,
    required TResult Function(_WithdrawSaldo value) withdrawSaldo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult? Function(_WithdrawSaldo value)? withdrawSaldo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult Function(_WithdrawSaldo value)? withdrawSaldo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaldoEventCopyWith<$Res> {
  factory $SaldoEventCopyWith(
          SaldoEvent value, $Res Function(SaldoEvent) then) =
      _$SaldoEventCopyWithImpl<$Res, SaldoEvent>;
}

/// @nodoc
class _$SaldoEventCopyWithImpl<$Res, $Val extends SaldoEvent>
    implements $SaldoEventCopyWith<$Res> {
  _$SaldoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SaldoEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SaldoEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistorySaldo,
    required TResult Function(int amount, String description) withdrawSaldo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistorySaldo,
    TResult? Function(int amount, String description)? withdrawSaldo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistorySaldo,
    TResult Function(int amount, String description)? withdrawSaldo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistorySaldo value) getHistorySaldo,
    required TResult Function(_WithdrawSaldo value) withdrawSaldo,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult? Function(_WithdrawSaldo value)? withdrawSaldo,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult Function(_WithdrawSaldo value)? withdrawSaldo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SaldoEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetHistorySaldoImplCopyWith<$Res> {
  factory _$$GetHistorySaldoImplCopyWith(_$GetHistorySaldoImpl value,
          $Res Function(_$GetHistorySaldoImpl) then) =
      __$$GetHistorySaldoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHistorySaldoImplCopyWithImpl<$Res>
    extends _$SaldoEventCopyWithImpl<$Res, _$GetHistorySaldoImpl>
    implements _$$GetHistorySaldoImplCopyWith<$Res> {
  __$$GetHistorySaldoImplCopyWithImpl(
      _$GetHistorySaldoImpl _value, $Res Function(_$GetHistorySaldoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHistorySaldoImpl implements _GetHistorySaldo {
  const _$GetHistorySaldoImpl();

  @override
  String toString() {
    return 'SaldoEvent.getHistorySaldo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHistorySaldoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistorySaldo,
    required TResult Function(int amount, String description) withdrawSaldo,
  }) {
    return getHistorySaldo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistorySaldo,
    TResult? Function(int amount, String description)? withdrawSaldo,
  }) {
    return getHistorySaldo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistorySaldo,
    TResult Function(int amount, String description)? withdrawSaldo,
    required TResult orElse(),
  }) {
    if (getHistorySaldo != null) {
      return getHistorySaldo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistorySaldo value) getHistorySaldo,
    required TResult Function(_WithdrawSaldo value) withdrawSaldo,
  }) {
    return getHistorySaldo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult? Function(_WithdrawSaldo value)? withdrawSaldo,
  }) {
    return getHistorySaldo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult Function(_WithdrawSaldo value)? withdrawSaldo,
    required TResult orElse(),
  }) {
    if (getHistorySaldo != null) {
      return getHistorySaldo(this);
    }
    return orElse();
  }
}

abstract class _GetHistorySaldo implements SaldoEvent {
  const factory _GetHistorySaldo() = _$GetHistorySaldoImpl;
}

/// @nodoc
abstract class _$$WithdrawSaldoImplCopyWith<$Res> {
  factory _$$WithdrawSaldoImplCopyWith(
          _$WithdrawSaldoImpl value, $Res Function(_$WithdrawSaldoImpl) then) =
      __$$WithdrawSaldoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount, String description});
}

/// @nodoc
class __$$WithdrawSaldoImplCopyWithImpl<$Res>
    extends _$SaldoEventCopyWithImpl<$Res, _$WithdrawSaldoImpl>
    implements _$$WithdrawSaldoImplCopyWith<$Res> {
  __$$WithdrawSaldoImplCopyWithImpl(
      _$WithdrawSaldoImpl _value, $Res Function(_$WithdrawSaldoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
  }) {
    return _then(_$WithdrawSaldoImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WithdrawSaldoImpl implements _WithdrawSaldo {
  const _$WithdrawSaldoImpl(this.amount, this.description);

  @override
  final int amount;
  @override
  final String description;

  @override
  String toString() {
    return 'SaldoEvent.withdrawSaldo(amount: $amount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawSaldoImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawSaldoImplCopyWith<_$WithdrawSaldoImpl> get copyWith =>
      __$$WithdrawSaldoImplCopyWithImpl<_$WithdrawSaldoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getHistorySaldo,
    required TResult Function(int amount, String description) withdrawSaldo,
  }) {
    return withdrawSaldo(amount, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getHistorySaldo,
    TResult? Function(int amount, String description)? withdrawSaldo,
  }) {
    return withdrawSaldo?.call(amount, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getHistorySaldo,
    TResult Function(int amount, String description)? withdrawSaldo,
    required TResult orElse(),
  }) {
    if (withdrawSaldo != null) {
      return withdrawSaldo(amount, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetHistorySaldo value) getHistorySaldo,
    required TResult Function(_WithdrawSaldo value) withdrawSaldo,
  }) {
    return withdrawSaldo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult? Function(_WithdrawSaldo value)? withdrawSaldo,
  }) {
    return withdrawSaldo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetHistorySaldo value)? getHistorySaldo,
    TResult Function(_WithdrawSaldo value)? withdrawSaldo,
    required TResult orElse(),
  }) {
    if (withdrawSaldo != null) {
      return withdrawSaldo(this);
    }
    return orElse();
  }
}

abstract class _WithdrawSaldo implements SaldoEvent {
  const factory _WithdrawSaldo(final int amount, final String description) =
      _$WithdrawSaldoImpl;

  int get amount;
  String get description;
  @JsonKey(ignore: true)
  _$$WithdrawSaldoImplCopyWith<_$WithdrawSaldoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SaldoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SaldoResponseModel saldoResponseModel) success,
    required TResult Function(String message) successWithdraw,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SaldoResponseModel saldoResponseModel)? success,
    TResult? Function(String message)? successWithdraw,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SaldoResponseModel saldoResponseModel)? success,
    TResult Function(String message)? successWithdraw,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithdraw value) successWithdraw,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithdraw value)? successWithdraw,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithdraw value)? successWithdraw,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaldoStateCopyWith<$Res> {
  factory $SaldoStateCopyWith(
          SaldoState value, $Res Function(SaldoState) then) =
      _$SaldoStateCopyWithImpl<$Res, SaldoState>;
}

/// @nodoc
class _$SaldoStateCopyWithImpl<$Res, $Val extends SaldoState>
    implements $SaldoStateCopyWith<$Res> {
  _$SaldoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SaldoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SaldoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SaldoResponseModel saldoResponseModel) success,
    required TResult Function(String message) successWithdraw,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SaldoResponseModel saldoResponseModel)? success,
    TResult? Function(String message)? successWithdraw,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SaldoResponseModel saldoResponseModel)? success,
    TResult Function(String message)? successWithdraw,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithdraw value) successWithdraw,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithdraw value)? successWithdraw,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithdraw value)? successWithdraw,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SaldoState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SaldoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SaldoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SaldoResponseModel saldoResponseModel) success,
    required TResult Function(String message) successWithdraw,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SaldoResponseModel saldoResponseModel)? success,
    TResult? Function(String message)? successWithdraw,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SaldoResponseModel saldoResponseModel)? success,
    TResult Function(String message)? successWithdraw,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithdraw value) successWithdraw,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithdraw value)? successWithdraw,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithdraw value)? successWithdraw,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SaldoState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SaldoResponseModel saldoResponseModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SaldoStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saldoResponseModel = null,
  }) {
    return _then(_$SuccessImpl(
      null == saldoResponseModel
          ? _value.saldoResponseModel
          : saldoResponseModel // ignore: cast_nullable_to_non_nullable
              as SaldoResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.saldoResponseModel);

  @override
  final SaldoResponseModel saldoResponseModel;

  @override
  String toString() {
    return 'SaldoState.success(saldoResponseModel: $saldoResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.saldoResponseModel, saldoResponseModel) ||
                other.saldoResponseModel == saldoResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saldoResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SaldoResponseModel saldoResponseModel) success,
    required TResult Function(String message) successWithdraw,
    required TResult Function(String message) error,
  }) {
    return success(saldoResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SaldoResponseModel saldoResponseModel)? success,
    TResult? Function(String message)? successWithdraw,
    TResult? Function(String message)? error,
  }) {
    return success?.call(saldoResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SaldoResponseModel saldoResponseModel)? success,
    TResult Function(String message)? successWithdraw,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(saldoResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithdraw value) successWithdraw,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithdraw value)? successWithdraw,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithdraw value)? successWithdraw,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SaldoState {
  const factory _Success(final SaldoResponseModel saldoResponseModel) =
      _$SuccessImpl;

  SaldoResponseModel get saldoResponseModel;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessWithdrawImplCopyWith<$Res> {
  factory _$$SuccessWithdrawImplCopyWith(_$SuccessWithdrawImpl value,
          $Res Function(_$SuccessWithdrawImpl) then) =
      __$$SuccessWithdrawImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessWithdrawImplCopyWithImpl<$Res>
    extends _$SaldoStateCopyWithImpl<$Res, _$SuccessWithdrawImpl>
    implements _$$SuccessWithdrawImplCopyWith<$Res> {
  __$$SuccessWithdrawImplCopyWithImpl(
      _$SuccessWithdrawImpl _value, $Res Function(_$SuccessWithdrawImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuccessWithdrawImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessWithdrawImpl implements _SuccessWithdraw {
  const _$SuccessWithdrawImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SaldoState.successWithdraw(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessWithdrawImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessWithdrawImplCopyWith<_$SuccessWithdrawImpl> get copyWith =>
      __$$SuccessWithdrawImplCopyWithImpl<_$SuccessWithdrawImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SaldoResponseModel saldoResponseModel) success,
    required TResult Function(String message) successWithdraw,
    required TResult Function(String message) error,
  }) {
    return successWithdraw(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SaldoResponseModel saldoResponseModel)? success,
    TResult? Function(String message)? successWithdraw,
    TResult? Function(String message)? error,
  }) {
    return successWithdraw?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SaldoResponseModel saldoResponseModel)? success,
    TResult Function(String message)? successWithdraw,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successWithdraw != null) {
      return successWithdraw(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithdraw value) successWithdraw,
    required TResult Function(_Error value) error,
  }) {
    return successWithdraw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithdraw value)? successWithdraw,
    TResult? Function(_Error value)? error,
  }) {
    return successWithdraw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithdraw value)? successWithdraw,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successWithdraw != null) {
      return successWithdraw(this);
    }
    return orElse();
  }
}

abstract class _SuccessWithdraw implements SaldoState {
  const factory _SuccessWithdraw(final String message) = _$SuccessWithdrawImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuccessWithdrawImplCopyWith<_$SuccessWithdrawImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SaldoStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SaldoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SaldoResponseModel saldoResponseModel) success,
    required TResult Function(String message) successWithdraw,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SaldoResponseModel saldoResponseModel)? success,
    TResult? Function(String message)? successWithdraw,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SaldoResponseModel saldoResponseModel)? success,
    TResult Function(String message)? successWithdraw,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithdraw value) successWithdraw,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithdraw value)? successWithdraw,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithdraw value)? successWithdraw,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SaldoState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
