// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'languages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LanguagesEventTearOff {
  const _$LanguagesEventTearOff();

  _Started started() {
    return const _Started();
  }
}

/// @nodoc
const $LanguagesEvent = _$LanguagesEventTearOff();

/// @nodoc
mixin _$LanguagesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesEventCopyWith<$Res> {
  factory $LanguagesEventCopyWith(
          LanguagesEvent value, $Res Function(LanguagesEvent) then) =
      _$LanguagesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LanguagesEventCopyWithImpl<$Res>
    implements $LanguagesEventCopyWith<$Res> {
  _$LanguagesEventCopyWithImpl(this._value, this._then);

  final LanguagesEvent _value;
  // ignore: unused_field
  final $Res Function(LanguagesEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$LanguagesEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc
class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'LanguagesEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LanguagesEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
class _$LanguagesStateTearOff {
  const _$LanguagesStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _GetLanguagesInProgress getLanguagesInProgress() {
    return const _GetLanguagesInProgress();
  }

  _GetLanguagesSucceed getLanguagesSucceed() {
    return const _GetLanguagesSucceed();
  }

  _GetLanguagesFailed getLanguagesFailed() {
    return const _GetLanguagesFailed();
  }
}

/// @nodoc
const $LanguagesState = _$LanguagesStateTearOff();

/// @nodoc
mixin _$LanguagesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getLanguagesInProgress,
    required TResult Function() getLanguagesSucceed,
    required TResult Function() getLanguagesFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getLanguagesInProgress,
    TResult Function()? getLanguagesSucceed,
    TResult Function()? getLanguagesFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetLanguagesInProgress value)
        getLanguagesInProgress,
    required TResult Function(_GetLanguagesSucceed value) getLanguagesSucceed,
    required TResult Function(_GetLanguagesFailed value) getLanguagesFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetLanguagesInProgress value)? getLanguagesInProgress,
    TResult Function(_GetLanguagesSucceed value)? getLanguagesSucceed,
    TResult Function(_GetLanguagesFailed value)? getLanguagesFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesStateCopyWith<$Res> {
  factory $LanguagesStateCopyWith(
          LanguagesState value, $Res Function(LanguagesState) then) =
      _$LanguagesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LanguagesStateCopyWithImpl<$Res>
    implements $LanguagesStateCopyWith<$Res> {
  _$LanguagesStateCopyWithImpl(this._value, this._then);

  final LanguagesState _value;
  // ignore: unused_field
  final $Res Function(LanguagesState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$LanguagesStateCopyWithImpl<$Res>
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
    return 'LanguagesState.initial()';
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
    required TResult Function() getLanguagesInProgress,
    required TResult Function() getLanguagesSucceed,
    required TResult Function() getLanguagesFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getLanguagesInProgress,
    TResult Function()? getLanguagesSucceed,
    TResult Function()? getLanguagesFailed,
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
    required TResult Function(_GetLanguagesInProgress value)
        getLanguagesInProgress,
    required TResult Function(_GetLanguagesSucceed value) getLanguagesSucceed,
    required TResult Function(_GetLanguagesFailed value) getLanguagesFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetLanguagesInProgress value)? getLanguagesInProgress,
    TResult Function(_GetLanguagesSucceed value)? getLanguagesSucceed,
    TResult Function(_GetLanguagesFailed value)? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LanguagesState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$GetLanguagesInProgressCopyWith<$Res> {
  factory _$GetLanguagesInProgressCopyWith(_GetLanguagesInProgress value,
          $Res Function(_GetLanguagesInProgress) then) =
      __$GetLanguagesInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetLanguagesInProgressCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res>
    implements _$GetLanguagesInProgressCopyWith<$Res> {
  __$GetLanguagesInProgressCopyWithImpl(_GetLanguagesInProgress _value,
      $Res Function(_GetLanguagesInProgress) _then)
      : super(_value, (v) => _then(v as _GetLanguagesInProgress));

  @override
  _GetLanguagesInProgress get _value => super._value as _GetLanguagesInProgress;
}

/// @nodoc
class _$_GetLanguagesInProgress implements _GetLanguagesInProgress {
  const _$_GetLanguagesInProgress();

  @override
  String toString() {
    return 'LanguagesState.getLanguagesInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetLanguagesInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getLanguagesInProgress,
    required TResult Function() getLanguagesSucceed,
    required TResult Function() getLanguagesFailed,
  }) {
    return getLanguagesInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getLanguagesInProgress,
    TResult Function()? getLanguagesSucceed,
    TResult Function()? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (getLanguagesInProgress != null) {
      return getLanguagesInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetLanguagesInProgress value)
        getLanguagesInProgress,
    required TResult Function(_GetLanguagesSucceed value) getLanguagesSucceed,
    required TResult Function(_GetLanguagesFailed value) getLanguagesFailed,
  }) {
    return getLanguagesInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetLanguagesInProgress value)? getLanguagesInProgress,
    TResult Function(_GetLanguagesSucceed value)? getLanguagesSucceed,
    TResult Function(_GetLanguagesFailed value)? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (getLanguagesInProgress != null) {
      return getLanguagesInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetLanguagesInProgress implements LanguagesState {
  const factory _GetLanguagesInProgress() = _$_GetLanguagesInProgress;
}

/// @nodoc
abstract class _$GetLanguagesSucceedCopyWith<$Res> {
  factory _$GetLanguagesSucceedCopyWith(_GetLanguagesSucceed value,
          $Res Function(_GetLanguagesSucceed) then) =
      __$GetLanguagesSucceedCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetLanguagesSucceedCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res>
    implements _$GetLanguagesSucceedCopyWith<$Res> {
  __$GetLanguagesSucceedCopyWithImpl(
      _GetLanguagesSucceed _value, $Res Function(_GetLanguagesSucceed) _then)
      : super(_value, (v) => _then(v as _GetLanguagesSucceed));

  @override
  _GetLanguagesSucceed get _value => super._value as _GetLanguagesSucceed;
}

/// @nodoc
class _$_GetLanguagesSucceed implements _GetLanguagesSucceed {
  const _$_GetLanguagesSucceed();

  @override
  String toString() {
    return 'LanguagesState.getLanguagesSucceed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetLanguagesSucceed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getLanguagesInProgress,
    required TResult Function() getLanguagesSucceed,
    required TResult Function() getLanguagesFailed,
  }) {
    return getLanguagesSucceed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getLanguagesInProgress,
    TResult Function()? getLanguagesSucceed,
    TResult Function()? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (getLanguagesSucceed != null) {
      return getLanguagesSucceed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetLanguagesInProgress value)
        getLanguagesInProgress,
    required TResult Function(_GetLanguagesSucceed value) getLanguagesSucceed,
    required TResult Function(_GetLanguagesFailed value) getLanguagesFailed,
  }) {
    return getLanguagesSucceed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetLanguagesInProgress value)? getLanguagesInProgress,
    TResult Function(_GetLanguagesSucceed value)? getLanguagesSucceed,
    TResult Function(_GetLanguagesFailed value)? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (getLanguagesSucceed != null) {
      return getLanguagesSucceed(this);
    }
    return orElse();
  }
}

abstract class _GetLanguagesSucceed implements LanguagesState {
  const factory _GetLanguagesSucceed() = _$_GetLanguagesSucceed;
}

/// @nodoc
abstract class _$GetLanguagesFailedCopyWith<$Res> {
  factory _$GetLanguagesFailedCopyWith(
          _GetLanguagesFailed value, $Res Function(_GetLanguagesFailed) then) =
      __$GetLanguagesFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetLanguagesFailedCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res>
    implements _$GetLanguagesFailedCopyWith<$Res> {
  __$GetLanguagesFailedCopyWithImpl(
      _GetLanguagesFailed _value, $Res Function(_GetLanguagesFailed) _then)
      : super(_value, (v) => _then(v as _GetLanguagesFailed));

  @override
  _GetLanguagesFailed get _value => super._value as _GetLanguagesFailed;
}

/// @nodoc
class _$_GetLanguagesFailed implements _GetLanguagesFailed {
  const _$_GetLanguagesFailed();

  @override
  String toString() {
    return 'LanguagesState.getLanguagesFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetLanguagesFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getLanguagesInProgress,
    required TResult Function() getLanguagesSucceed,
    required TResult Function() getLanguagesFailed,
  }) {
    return getLanguagesFailed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getLanguagesInProgress,
    TResult Function()? getLanguagesSucceed,
    TResult Function()? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (getLanguagesFailed != null) {
      return getLanguagesFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetLanguagesInProgress value)
        getLanguagesInProgress,
    required TResult Function(_GetLanguagesSucceed value) getLanguagesSucceed,
    required TResult Function(_GetLanguagesFailed value) getLanguagesFailed,
  }) {
    return getLanguagesFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetLanguagesInProgress value)? getLanguagesInProgress,
    TResult Function(_GetLanguagesSucceed value)? getLanguagesSucceed,
    TResult Function(_GetLanguagesFailed value)? getLanguagesFailed,
    required TResult orElse(),
  }) {
    if (getLanguagesFailed != null) {
      return getLanguagesFailed(this);
    }
    return orElse();
  }
}

abstract class _GetLanguagesFailed implements LanguagesState {
  const factory _GetLanguagesFailed() = _$_GetLanguagesFailed;
}
