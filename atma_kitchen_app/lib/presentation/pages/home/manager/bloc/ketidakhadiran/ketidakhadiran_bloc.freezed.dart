// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ketidakhadiran_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KetidakhadiranEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int bulan, int tahun) getKetidakhadiran,
    required TResult Function(int id, String tanggal) addKetidakhadiran,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int bulan, int tahun)? getKetidakhadiran,
    TResult? Function(int id, String tanggal)? addKetidakhadiran,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int bulan, int tahun)? getKetidakhadiran,
    TResult Function(int id, String tanggal)? addKetidakhadiran,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetKetidakhadiran value) getKetidakhadiran,
    required TResult Function(_AddKetidakhadiran value) addKetidakhadiran,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult? Function(_AddKetidakhadiran value)? addKetidakhadiran,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult Function(_AddKetidakhadiran value)? addKetidakhadiran,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KetidakhadiranEventCopyWith<$Res> {
  factory $KetidakhadiranEventCopyWith(
          KetidakhadiranEvent value, $Res Function(KetidakhadiranEvent) then) =
      _$KetidakhadiranEventCopyWithImpl<$Res, KetidakhadiranEvent>;
}

/// @nodoc
class _$KetidakhadiranEventCopyWithImpl<$Res, $Val extends KetidakhadiranEvent>
    implements $KetidakhadiranEventCopyWith<$Res> {
  _$KetidakhadiranEventCopyWithImpl(this._value, this._then);

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
    extends _$KetidakhadiranEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'KetidakhadiranEvent.started()';
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
    required TResult Function(int bulan, int tahun) getKetidakhadiran,
    required TResult Function(int id, String tanggal) addKetidakhadiran,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int bulan, int tahun)? getKetidakhadiran,
    TResult? Function(int id, String tanggal)? addKetidakhadiran,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int bulan, int tahun)? getKetidakhadiran,
    TResult Function(int id, String tanggal)? addKetidakhadiran,
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
    required TResult Function(_GetKetidakhadiran value) getKetidakhadiran,
    required TResult Function(_AddKetidakhadiran value) addKetidakhadiran,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult? Function(_AddKetidakhadiran value)? addKetidakhadiran,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult Function(_AddKetidakhadiran value)? addKetidakhadiran,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements KetidakhadiranEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetKetidakhadiranImplCopyWith<$Res> {
  factory _$$GetKetidakhadiranImplCopyWith(_$GetKetidakhadiranImpl value,
          $Res Function(_$GetKetidakhadiranImpl) then) =
      __$$GetKetidakhadiranImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int bulan, int tahun});
}

/// @nodoc
class __$$GetKetidakhadiranImplCopyWithImpl<$Res>
    extends _$KetidakhadiranEventCopyWithImpl<$Res, _$GetKetidakhadiranImpl>
    implements _$$GetKetidakhadiranImplCopyWith<$Res> {
  __$$GetKetidakhadiranImplCopyWithImpl(_$GetKetidakhadiranImpl _value,
      $Res Function(_$GetKetidakhadiranImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulan = null,
    Object? tahun = null,
  }) {
    return _then(_$GetKetidakhadiranImpl(
      null == bulan
          ? _value.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as int,
      null == tahun
          ? _value.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetKetidakhadiranImpl implements _GetKetidakhadiran {
  const _$GetKetidakhadiranImpl(this.bulan, this.tahun);

  @override
  final int bulan;
  @override
  final int tahun;

  @override
  String toString() {
    return 'KetidakhadiranEvent.getKetidakhadiran(bulan: $bulan, tahun: $tahun)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetKetidakhadiranImpl &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.tahun, tahun) || other.tahun == tahun));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bulan, tahun);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetKetidakhadiranImplCopyWith<_$GetKetidakhadiranImpl> get copyWith =>
      __$$GetKetidakhadiranImplCopyWithImpl<_$GetKetidakhadiranImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int bulan, int tahun) getKetidakhadiran,
    required TResult Function(int id, String tanggal) addKetidakhadiran,
  }) {
    return getKetidakhadiran(bulan, tahun);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int bulan, int tahun)? getKetidakhadiran,
    TResult? Function(int id, String tanggal)? addKetidakhadiran,
  }) {
    return getKetidakhadiran?.call(bulan, tahun);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int bulan, int tahun)? getKetidakhadiran,
    TResult Function(int id, String tanggal)? addKetidakhadiran,
    required TResult orElse(),
  }) {
    if (getKetidakhadiran != null) {
      return getKetidakhadiran(bulan, tahun);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetKetidakhadiran value) getKetidakhadiran,
    required TResult Function(_AddKetidakhadiran value) addKetidakhadiran,
  }) {
    return getKetidakhadiran(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult? Function(_AddKetidakhadiran value)? addKetidakhadiran,
  }) {
    return getKetidakhadiran?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult Function(_AddKetidakhadiran value)? addKetidakhadiran,
    required TResult orElse(),
  }) {
    if (getKetidakhadiran != null) {
      return getKetidakhadiran(this);
    }
    return orElse();
  }
}

abstract class _GetKetidakhadiran implements KetidakhadiranEvent {
  const factory _GetKetidakhadiran(final int bulan, final int tahun) =
      _$GetKetidakhadiranImpl;

  int get bulan;
  int get tahun;
  @JsonKey(ignore: true)
  _$$GetKetidakhadiranImplCopyWith<_$GetKetidakhadiranImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddKetidakhadiranImplCopyWith<$Res> {
  factory _$$AddKetidakhadiranImplCopyWith(_$AddKetidakhadiranImpl value,
          $Res Function(_$AddKetidakhadiranImpl) then) =
      __$$AddKetidakhadiranImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String tanggal});
}

/// @nodoc
class __$$AddKetidakhadiranImplCopyWithImpl<$Res>
    extends _$KetidakhadiranEventCopyWithImpl<$Res, _$AddKetidakhadiranImpl>
    implements _$$AddKetidakhadiranImplCopyWith<$Res> {
  __$$AddKetidakhadiranImplCopyWithImpl(_$AddKetidakhadiranImpl _value,
      $Res Function(_$AddKetidakhadiranImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tanggal = null,
  }) {
    return _then(_$AddKetidakhadiranImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddKetidakhadiranImpl implements _AddKetidakhadiran {
  const _$AddKetidakhadiranImpl(this.id, this.tanggal);

  @override
  final int id;
  @override
  final String tanggal;

  @override
  String toString() {
    return 'KetidakhadiranEvent.addKetidakhadiran(id: $id, tanggal: $tanggal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddKetidakhadiranImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, tanggal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddKetidakhadiranImplCopyWith<_$AddKetidakhadiranImpl> get copyWith =>
      __$$AddKetidakhadiranImplCopyWithImpl<_$AddKetidakhadiranImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int bulan, int tahun) getKetidakhadiran,
    required TResult Function(int id, String tanggal) addKetidakhadiran,
  }) {
    return addKetidakhadiran(id, tanggal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int bulan, int tahun)? getKetidakhadiran,
    TResult? Function(int id, String tanggal)? addKetidakhadiran,
  }) {
    return addKetidakhadiran?.call(id, tanggal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int bulan, int tahun)? getKetidakhadiran,
    TResult Function(int id, String tanggal)? addKetidakhadiran,
    required TResult orElse(),
  }) {
    if (addKetidakhadiran != null) {
      return addKetidakhadiran(id, tanggal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetKetidakhadiran value) getKetidakhadiran,
    required TResult Function(_AddKetidakhadiran value) addKetidakhadiran,
  }) {
    return addKetidakhadiran(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult? Function(_AddKetidakhadiran value)? addKetidakhadiran,
  }) {
    return addKetidakhadiran?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetKetidakhadiran value)? getKetidakhadiran,
    TResult Function(_AddKetidakhadiran value)? addKetidakhadiran,
    required TResult orElse(),
  }) {
    if (addKetidakhadiran != null) {
      return addKetidakhadiran(this);
    }
    return orElse();
  }
}

abstract class _AddKetidakhadiran implements KetidakhadiranEvent {
  const factory _AddKetidakhadiran(final int id, final String tanggal) =
      _$AddKetidakhadiranImpl;

  int get id;
  String get tanggal;
  @JsonKey(ignore: true)
  _$$AddKetidakhadiranImplCopyWith<_$AddKetidakhadiranImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KetidakhadiranState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KetidakhadiranStateCopyWith<$Res> {
  factory $KetidakhadiranStateCopyWith(
          KetidakhadiranState value, $Res Function(KetidakhadiranState) then) =
      _$KetidakhadiranStateCopyWithImpl<$Res, KetidakhadiranState>;
}

/// @nodoc
class _$KetidakhadiranStateCopyWithImpl<$Res, $Val extends KetidakhadiranState>
    implements $KetidakhadiranStateCopyWith<$Res> {
  _$KetidakhadiranStateCopyWithImpl(this._value, this._then);

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
    extends _$KetidakhadiranStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'KetidakhadiranState.initial()';
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
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
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
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements KetidakhadiranState {
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
    extends _$KetidakhadiranStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'KetidakhadiranState.loading()';
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
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
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
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements KetidakhadiranState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KetidakhadiranResponseModel data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$KetidakhadiranStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as KetidakhadiranResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.data);

  @override
  final KetidakhadiranResponseModel data;

  @override
  String toString() {
    return 'KetidakhadiranState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

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
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements KetidakhadiranState {
  const factory _Success(final KetidakhadiranResponseModel data) =
      _$SuccessImpl;

  KetidakhadiranResponseModel get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$KetidakhadiranStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'KetidakhadiranState.error(message: $message)';
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
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
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
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements KetidakhadiranState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSuccessImplCopyWith<$Res> {
  factory _$$AddSuccessImplCopyWith(
          _$AddSuccessImpl value, $Res Function(_$AddSuccessImpl) then) =
      __$$AddSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddSuccessImplCopyWithImpl<$Res>
    extends _$KetidakhadiranStateCopyWithImpl<$Res, _$AddSuccessImpl>
    implements _$$AddSuccessImplCopyWith<$Res> {
  __$$AddSuccessImplCopyWithImpl(
      _$AddSuccessImpl _value, $Res Function(_$AddSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddSuccessImpl implements _AddSuccess {
  const _$AddSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'KetidakhadiranState.addSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSuccessImplCopyWith<_$AddSuccessImpl> get copyWith =>
      __$$AddSuccessImplCopyWithImpl<_$AddSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) {
    return addSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) {
    return addSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) {
    return addSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) {
    return addSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddSuccess implements KetidakhadiranState {
  const factory _AddSuccess(final String message) = _$AddSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AddSuccessImplCopyWith<_$AddSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddErrorImplCopyWith<$Res> {
  factory _$$AddErrorImplCopyWith(
          _$AddErrorImpl value, $Res Function(_$AddErrorImpl) then) =
      __$$AddErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddErrorImplCopyWithImpl<$Res>
    extends _$KetidakhadiranStateCopyWithImpl<$Res, _$AddErrorImpl>
    implements _$$AddErrorImplCopyWith<$Res> {
  __$$AddErrorImplCopyWithImpl(
      _$AddErrorImpl _value, $Res Function(_$AddErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddErrorImpl implements _AddError {
  const _$AddErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'KetidakhadiranState.addError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddErrorImplCopyWith<_$AddErrorImpl> get copyWith =>
      __$$AddErrorImplCopyWithImpl<_$AddErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(KetidakhadiranResponseModel data) success,
    required TResult Function(String message) error,
    required TResult Function(String message) addSuccess,
    required TResult Function(String message) addError,
  }) {
    return addError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(KetidakhadiranResponseModel data)? success,
    TResult? Function(String message)? error,
    TResult? Function(String message)? addSuccess,
    TResult? Function(String message)? addError,
  }) {
    return addError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(KetidakhadiranResponseModel data)? success,
    TResult Function(String message)? error,
    TResult Function(String message)? addSuccess,
    TResult Function(String message)? addError,
    required TResult orElse(),
  }) {
    if (addError != null) {
      return addError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_AddError value) addError,
  }) {
    return addError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_AddError value)? addError,
  }) {
    return addError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_AddError value)? addError,
    required TResult orElse(),
  }) {
    if (addError != null) {
      return addError(this);
    }
    return orElse();
  }
}

abstract class _AddError implements KetidakhadiranState {
  const factory _AddError(final String message) = _$AddErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AddErrorImplCopyWith<_$AddErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
