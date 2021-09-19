// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'geolocation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GeolocationEventTearOff {
  const _$GeolocationEventTearOff();

  _GetGeolocation getGeolocation() {
    return const _GetGeolocation();
  }
}

/// @nodoc
const $GeolocationEvent = _$GeolocationEventTearOff();

/// @nodoc
mixin _$GeolocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getGeolocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getGeolocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetGeolocation value) getGeolocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetGeolocation value)? getGeolocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocationEventCopyWith<$Res> {
  factory $GeolocationEventCopyWith(
          GeolocationEvent value, $Res Function(GeolocationEvent) then) =
      _$GeolocationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeolocationEventCopyWithImpl<$Res>
    implements $GeolocationEventCopyWith<$Res> {
  _$GeolocationEventCopyWithImpl(this._value, this._then);

  final GeolocationEvent _value;
  // ignore: unused_field
  final $Res Function(GeolocationEvent) _then;
}

/// @nodoc
abstract class _$GetGeolocationCopyWith<$Res> {
  factory _$GetGeolocationCopyWith(
          _GetGeolocation value, $Res Function(_GetGeolocation) then) =
      __$GetGeolocationCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetGeolocationCopyWithImpl<$Res>
    extends _$GeolocationEventCopyWithImpl<$Res>
    implements _$GetGeolocationCopyWith<$Res> {
  __$GetGeolocationCopyWithImpl(
      _GetGeolocation _value, $Res Function(_GetGeolocation) _then)
      : super(_value, (v) => _then(v as _GetGeolocation));

  @override
  _GetGeolocation get _value => super._value as _GetGeolocation;
}

/// @nodoc

class _$_GetGeolocation implements _GetGeolocation {
  const _$_GetGeolocation();

  @override
  String toString() {
    return 'GeolocationEvent.getGeolocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetGeolocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getGeolocation,
  }) {
    return getGeolocation();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getGeolocation,
    required TResult orElse(),
  }) {
    if (getGeolocation != null) {
      return getGeolocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetGeolocation value) getGeolocation,
  }) {
    return getGeolocation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetGeolocation value)? getGeolocation,
    required TResult orElse(),
  }) {
    if (getGeolocation != null) {
      return getGeolocation(this);
    }
    return orElse();
  }
}

abstract class _GetGeolocation implements GeolocationEvent {
  const factory _GetGeolocation() = _$_GetGeolocation;
}

/// @nodoc
class _$GeolocationStateTearOff {
  const _$GeolocationStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _GetGeolocationInProgress getGeolocationInProgress() {
    return const _GetGeolocationInProgress();
  }

  _GetGeolocationSucceed getGeolocationSucceed(LatLng latlng) {
    return _GetGeolocationSucceed(
      latlng,
    );
  }

  _GetGeolocationFailed getGeolocationFailed(GeolocationFailure failure) {
    return _GetGeolocationFailed(
      failure,
    );
  }
}

/// @nodoc
const $GeolocationState = _$GeolocationStateTearOff();

/// @nodoc
mixin _$GeolocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getGeolocationInProgress,
    required TResult Function(LatLng latlng) getGeolocationSucceed,
    required TResult Function(GeolocationFailure failure) getGeolocationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getGeolocationInProgress,
    TResult Function(LatLng latlng)? getGeolocationSucceed,
    TResult Function(GeolocationFailure failure)? getGeolocationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetGeolocationInProgress value)
        getGeolocationInProgress,
    required TResult Function(_GetGeolocationSucceed value)
        getGeolocationSucceed,
    required TResult Function(_GetGeolocationFailed value) getGeolocationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetGeolocationInProgress value)? getGeolocationInProgress,
    TResult Function(_GetGeolocationSucceed value)? getGeolocationSucceed,
    TResult Function(_GetGeolocationFailed value)? getGeolocationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocationStateCopyWith<$Res> {
  factory $GeolocationStateCopyWith(
          GeolocationState value, $Res Function(GeolocationState) then) =
      _$GeolocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeolocationStateCopyWithImpl<$Res>
    implements $GeolocationStateCopyWith<$Res> {
  _$GeolocationStateCopyWithImpl(this._value, this._then);

  final GeolocationState _value;
  // ignore: unused_field
  final $Res Function(GeolocationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GeolocationStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GeolocationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getGeolocationInProgress,
    required TResult Function(LatLng latlng) getGeolocationSucceed,
    required TResult Function(GeolocationFailure failure) getGeolocationFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getGeolocationInProgress,
    TResult Function(LatLng latlng)? getGeolocationSucceed,
    TResult Function(GeolocationFailure failure)? getGeolocationFailed,
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
    required TResult Function(_GetGeolocationInProgress value)
        getGeolocationInProgress,
    required TResult Function(_GetGeolocationSucceed value)
        getGeolocationSucceed,
    required TResult Function(_GetGeolocationFailed value) getGeolocationFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetGeolocationInProgress value)? getGeolocationInProgress,
    TResult Function(_GetGeolocationSucceed value)? getGeolocationSucceed,
    TResult Function(_GetGeolocationFailed value)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GeolocationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$GetGeolocationInProgressCopyWith<$Res> {
  factory _$GetGeolocationInProgressCopyWith(_GetGeolocationInProgress value,
          $Res Function(_GetGeolocationInProgress) then) =
      __$GetGeolocationInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetGeolocationInProgressCopyWithImpl<$Res>
    extends _$GeolocationStateCopyWithImpl<$Res>
    implements _$GetGeolocationInProgressCopyWith<$Res> {
  __$GetGeolocationInProgressCopyWithImpl(_GetGeolocationInProgress _value,
      $Res Function(_GetGeolocationInProgress) _then)
      : super(_value, (v) => _then(v as _GetGeolocationInProgress));

  @override
  _GetGeolocationInProgress get _value =>
      super._value as _GetGeolocationInProgress;
}

/// @nodoc

class _$_GetGeolocationInProgress implements _GetGeolocationInProgress {
  const _$_GetGeolocationInProgress();

  @override
  String toString() {
    return 'GeolocationState.getGeolocationInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetGeolocationInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getGeolocationInProgress,
    required TResult Function(LatLng latlng) getGeolocationSucceed,
    required TResult Function(GeolocationFailure failure) getGeolocationFailed,
  }) {
    return getGeolocationInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getGeolocationInProgress,
    TResult Function(LatLng latlng)? getGeolocationSucceed,
    TResult Function(GeolocationFailure failure)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (getGeolocationInProgress != null) {
      return getGeolocationInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetGeolocationInProgress value)
        getGeolocationInProgress,
    required TResult Function(_GetGeolocationSucceed value)
        getGeolocationSucceed,
    required TResult Function(_GetGeolocationFailed value) getGeolocationFailed,
  }) {
    return getGeolocationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetGeolocationInProgress value)? getGeolocationInProgress,
    TResult Function(_GetGeolocationSucceed value)? getGeolocationSucceed,
    TResult Function(_GetGeolocationFailed value)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (getGeolocationInProgress != null) {
      return getGeolocationInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetGeolocationInProgress implements GeolocationState {
  const factory _GetGeolocationInProgress() = _$_GetGeolocationInProgress;
}

/// @nodoc
abstract class _$GetGeolocationSucceedCopyWith<$Res> {
  factory _$GetGeolocationSucceedCopyWith(_GetGeolocationSucceed value,
          $Res Function(_GetGeolocationSucceed) then) =
      __$GetGeolocationSucceedCopyWithImpl<$Res>;
  $Res call({LatLng latlng});
}

/// @nodoc
class __$GetGeolocationSucceedCopyWithImpl<$Res>
    extends _$GeolocationStateCopyWithImpl<$Res>
    implements _$GetGeolocationSucceedCopyWith<$Res> {
  __$GetGeolocationSucceedCopyWithImpl(_GetGeolocationSucceed _value,
      $Res Function(_GetGeolocationSucceed) _then)
      : super(_value, (v) => _then(v as _GetGeolocationSucceed));

  @override
  _GetGeolocationSucceed get _value => super._value as _GetGeolocationSucceed;

  @override
  $Res call({
    Object? latlng = freezed,
  }) {
    return _then(_GetGeolocationSucceed(
      latlng == freezed
          ? _value.latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_GetGeolocationSucceed implements _GetGeolocationSucceed {
  const _$_GetGeolocationSucceed(this.latlng);

  @override
  final LatLng latlng;

  @override
  String toString() {
    return 'GeolocationState.getGeolocationSucceed(latlng: $latlng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetGeolocationSucceed &&
            (identical(other.latlng, latlng) ||
                const DeepCollectionEquality().equals(other.latlng, latlng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(latlng);

  @JsonKey(ignore: true)
  @override
  _$GetGeolocationSucceedCopyWith<_GetGeolocationSucceed> get copyWith =>
      __$GetGeolocationSucceedCopyWithImpl<_GetGeolocationSucceed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getGeolocationInProgress,
    required TResult Function(LatLng latlng) getGeolocationSucceed,
    required TResult Function(GeolocationFailure failure) getGeolocationFailed,
  }) {
    return getGeolocationSucceed(latlng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getGeolocationInProgress,
    TResult Function(LatLng latlng)? getGeolocationSucceed,
    TResult Function(GeolocationFailure failure)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (getGeolocationSucceed != null) {
      return getGeolocationSucceed(latlng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetGeolocationInProgress value)
        getGeolocationInProgress,
    required TResult Function(_GetGeolocationSucceed value)
        getGeolocationSucceed,
    required TResult Function(_GetGeolocationFailed value) getGeolocationFailed,
  }) {
    return getGeolocationSucceed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetGeolocationInProgress value)? getGeolocationInProgress,
    TResult Function(_GetGeolocationSucceed value)? getGeolocationSucceed,
    TResult Function(_GetGeolocationFailed value)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (getGeolocationSucceed != null) {
      return getGeolocationSucceed(this);
    }
    return orElse();
  }
}

abstract class _GetGeolocationSucceed implements GeolocationState {
  const factory _GetGeolocationSucceed(LatLng latlng) =
      _$_GetGeolocationSucceed;

  LatLng get latlng => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GetGeolocationSucceedCopyWith<_GetGeolocationSucceed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetGeolocationFailedCopyWith<$Res> {
  factory _$GetGeolocationFailedCopyWith(_GetGeolocationFailed value,
          $Res Function(_GetGeolocationFailed) then) =
      __$GetGeolocationFailedCopyWithImpl<$Res>;
  $Res call({GeolocationFailure failure});
}

/// @nodoc
class __$GetGeolocationFailedCopyWithImpl<$Res>
    extends _$GeolocationStateCopyWithImpl<$Res>
    implements _$GetGeolocationFailedCopyWith<$Res> {
  __$GetGeolocationFailedCopyWithImpl(
      _GetGeolocationFailed _value, $Res Function(_GetGeolocationFailed) _then)
      : super(_value, (v) => _then(v as _GetGeolocationFailed));

  @override
  _GetGeolocationFailed get _value => super._value as _GetGeolocationFailed;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_GetGeolocationFailed(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GeolocationFailure,
    ));
  }
}

/// @nodoc

class _$_GetGeolocationFailed implements _GetGeolocationFailed {
  const _$_GetGeolocationFailed(this.failure);

  @override
  final GeolocationFailure failure;

  @override
  String toString() {
    return 'GeolocationState.getGeolocationFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetGeolocationFailed &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$GetGeolocationFailedCopyWith<_GetGeolocationFailed> get copyWith =>
      __$GetGeolocationFailedCopyWithImpl<_GetGeolocationFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getGeolocationInProgress,
    required TResult Function(LatLng latlng) getGeolocationSucceed,
    required TResult Function(GeolocationFailure failure) getGeolocationFailed,
  }) {
    return getGeolocationFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getGeolocationInProgress,
    TResult Function(LatLng latlng)? getGeolocationSucceed,
    TResult Function(GeolocationFailure failure)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (getGeolocationFailed != null) {
      return getGeolocationFailed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetGeolocationInProgress value)
        getGeolocationInProgress,
    required TResult Function(_GetGeolocationSucceed value)
        getGeolocationSucceed,
    required TResult Function(_GetGeolocationFailed value) getGeolocationFailed,
  }) {
    return getGeolocationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetGeolocationInProgress value)? getGeolocationInProgress,
    TResult Function(_GetGeolocationSucceed value)? getGeolocationSucceed,
    TResult Function(_GetGeolocationFailed value)? getGeolocationFailed,
    required TResult orElse(),
  }) {
    if (getGeolocationFailed != null) {
      return getGeolocationFailed(this);
    }
    return orElse();
  }
}

abstract class _GetGeolocationFailed implements GeolocationState {
  const factory _GetGeolocationFailed(GeolocationFailure failure) =
      _$_GetGeolocationFailed;

  GeolocationFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GetGeolocationFailedCopyWith<_GetGeolocationFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
