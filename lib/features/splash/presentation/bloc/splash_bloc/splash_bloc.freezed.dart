// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SplashEventTearOff {
  const _$SplashEventTearOff();

  _Started started() {
    return _Started();
  }

  _SetLanguage setLanguage(String lang) {
    return _SetLanguage(
      lang,
    );
  }
}

/// @nodoc
const $SplashEvent = _$SplashEventTearOff();

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String lang) setLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String lang)? setLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetLanguage value) setLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetLanguage value)? setLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res> implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  final SplashEvent _value;
  // ignore: unused_field
  final $Res Function(SplashEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$SplashEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc
class _$_Started implements _Started {
  _$_Started();

  @override
  String toString() {
    return 'SplashEvent.started()';
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
    required TResult Function(String lang) setLanguage,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String lang)? setLanguage,
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
    required TResult Function(_SetLanguage value) setLanguage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetLanguage value)? setLanguage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SplashEvent {
  factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$SetLanguageCopyWith<$Res> {
  factory _$SetLanguageCopyWith(
          _SetLanguage value, $Res Function(_SetLanguage) then) =
      __$SetLanguageCopyWithImpl<$Res>;
  $Res call({String lang});
}

/// @nodoc
class __$SetLanguageCopyWithImpl<$Res> extends _$SplashEventCopyWithImpl<$Res>
    implements _$SetLanguageCopyWith<$Res> {
  __$SetLanguageCopyWithImpl(
      _SetLanguage _value, $Res Function(_SetLanguage) _then)
      : super(_value, (v) => _then(v as _SetLanguage));

  @override
  _SetLanguage get _value => super._value as _SetLanguage;

  @override
  $Res call({
    Object? lang = freezed,
  }) {
    return _then(_SetLanguage(
      lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_SetLanguage implements _SetLanguage {
  _$_SetLanguage(this.lang);

  @override
  final String lang;

  @override
  String toString() {
    return 'SplashEvent.setLanguage(lang: $lang)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetLanguage &&
            (identical(other.lang, lang) ||
                const DeepCollectionEquality().equals(other.lang, lang)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lang);

  @JsonKey(ignore: true)
  @override
  _$SetLanguageCopyWith<_SetLanguage> get copyWith =>
      __$SetLanguageCopyWithImpl<_SetLanguage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String lang) setLanguage,
  }) {
    return setLanguage(lang);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String lang)? setLanguage,
    required TResult orElse(),
  }) {
    if (setLanguage != null) {
      return setLanguage(lang);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SetLanguage value) setLanguage,
  }) {
    return setLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SetLanguage value)? setLanguage,
    required TResult orElse(),
  }) {
    if (setLanguage != null) {
      return setLanguage(this);
    }
    return orElse();
  }
}

abstract class _SetLanguage implements SplashEvent {
  factory _SetLanguage(String lang) = _$_SetLanguage;

  String get lang => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetLanguageCopyWith<_SetLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SplashStateTearOff {
  const _$SplashStateTearOff();

  _SplashState call(
      {required SplashStateType type,
      required SplashStatus status,
      Locale? locale}) {
    return _SplashState(
      type: type,
      status: status,
      locale: locale,
    );
  }
}

/// @nodoc
const $SplashState = _$SplashStateTearOff();

/// @nodoc
mixin _$SplashState {
  SplashStateType get type => throw _privateConstructorUsedError;
  SplashStatus get status => throw _privateConstructorUsedError;
  Locale? get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
  $Res call({SplashStateType type, SplashStatus status, Locale? locale});

  $SplashStateTypeCopyWith<$Res> get type;
  $SplashStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? status = freezed,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SplashStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplashStatus,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }

  @override
  $SplashStateTypeCopyWith<$Res> get type {
    return $SplashStateTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }

  @override
  $SplashStatusCopyWith<$Res> get status {
    return $SplashStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$SplashStateCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateCopyWith(
          _SplashState value, $Res Function(_SplashState) then) =
      __$SplashStateCopyWithImpl<$Res>;
  @override
  $Res call({SplashStateType type, SplashStatus status, Locale? locale});

  @override
  $SplashStateTypeCopyWith<$Res> get type;
  @override
  $SplashStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$SplashStateCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$SplashStateCopyWith<$Res> {
  __$SplashStateCopyWithImpl(
      _SplashState _value, $Res Function(_SplashState) _then)
      : super(_value, (v) => _then(v as _SplashState));

  @override
  _SplashState get _value => super._value as _SplashState;

  @override
  $Res call({
    Object? type = freezed,
    Object? status = freezed,
    Object? locale = freezed,
  }) {
    return _then(_SplashState(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SplashStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplashStatus,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc
class _$_SplashState implements _SplashState {
  const _$_SplashState({required this.type, required this.status, this.locale});

  @override
  final SplashStateType type;
  @override
  final SplashStatus status;
  @override
  final Locale? locale;

  @override
  String toString() {
    return 'SplashState(type: $type, status: $status, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SplashState &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(locale);

  @JsonKey(ignore: true)
  @override
  _$SplashStateCopyWith<_SplashState> get copyWith =>
      __$SplashStateCopyWithImpl<_SplashState>(this, _$identity);
}

abstract class _SplashState implements SplashState {
  const factory _SplashState(
      {required SplashStateType type,
      required SplashStatus status,
      Locale? locale}) = _$_SplashState;

  @override
  SplashStateType get type => throw _privateConstructorUsedError;
  @override
  SplashStatus get status => throw _privateConstructorUsedError;
  @override
  Locale? get locale => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SplashStateCopyWith<_SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SplashStateTypeTearOff {
  const _$SplashStateTypeTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _GetSplashInProgress getSplashInProgress() {
    return const _GetSplashInProgress();
  }

  _GetSplashSucceed getSplashSucceed() {
    return const _GetSplashSucceed();
  }

  _GetSplashFailed getSplashFailed(SplashFailure failure) {
    return _GetSplashFailed(
      failure,
    );
  }
}

/// @nodoc
const $SplashStateType = _$SplashStateTypeTearOff();

/// @nodoc
mixin _$SplashStateType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getSplashInProgress,
    required TResult Function() getSplashSucceed,
    required TResult Function(SplashFailure failure) getSplashFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getSplashInProgress,
    TResult Function()? getSplashSucceed,
    TResult Function(SplashFailure failure)? getSplashFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetSplashInProgress value) getSplashInProgress,
    required TResult Function(_GetSplashSucceed value) getSplashSucceed,
    required TResult Function(_GetSplashFailed value) getSplashFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetSplashInProgress value)? getSplashInProgress,
    TResult Function(_GetSplashSucceed value)? getSplashSucceed,
    TResult Function(_GetSplashFailed value)? getSplashFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateTypeCopyWith<$Res> {
  factory $SplashStateTypeCopyWith(
          SplashStateType value, $Res Function(SplashStateType) then) =
      _$SplashStateTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashStateTypeCopyWithImpl<$Res>
    implements $SplashStateTypeCopyWith<$Res> {
  _$SplashStateTypeCopyWithImpl(this._value, this._then);

  final SplashStateType _value;
  // ignore: unused_field
  final $Res Function(SplashStateType) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SplashStateTypeCopyWithImpl<$Res>
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
    return 'SplashStateType.initial()';
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
    required TResult Function() getSplashInProgress,
    required TResult Function() getSplashSucceed,
    required TResult Function(SplashFailure failure) getSplashFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getSplashInProgress,
    TResult Function()? getSplashSucceed,
    TResult Function(SplashFailure failure)? getSplashFailed,
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
    required TResult Function(_GetSplashInProgress value) getSplashInProgress,
    required TResult Function(_GetSplashSucceed value) getSplashSucceed,
    required TResult Function(_GetSplashFailed value) getSplashFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetSplashInProgress value)? getSplashInProgress,
    TResult Function(_GetSplashSucceed value)? getSplashSucceed,
    TResult Function(_GetSplashFailed value)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SplashStateType {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$GetSplashInProgressCopyWith<$Res> {
  factory _$GetSplashInProgressCopyWith(_GetSplashInProgress value,
          $Res Function(_GetSplashInProgress) then) =
      __$GetSplashInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetSplashInProgressCopyWithImpl<$Res>
    extends _$SplashStateTypeCopyWithImpl<$Res>
    implements _$GetSplashInProgressCopyWith<$Res> {
  __$GetSplashInProgressCopyWithImpl(
      _GetSplashInProgress _value, $Res Function(_GetSplashInProgress) _then)
      : super(_value, (v) => _then(v as _GetSplashInProgress));

  @override
  _GetSplashInProgress get _value => super._value as _GetSplashInProgress;
}

/// @nodoc
class _$_GetSplashInProgress implements _GetSplashInProgress {
  const _$_GetSplashInProgress();

  @override
  String toString() {
    return 'SplashStateType.getSplashInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetSplashInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getSplashInProgress,
    required TResult Function() getSplashSucceed,
    required TResult Function(SplashFailure failure) getSplashFailed,
  }) {
    return getSplashInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getSplashInProgress,
    TResult Function()? getSplashSucceed,
    TResult Function(SplashFailure failure)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (getSplashInProgress != null) {
      return getSplashInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetSplashInProgress value) getSplashInProgress,
    required TResult Function(_GetSplashSucceed value) getSplashSucceed,
    required TResult Function(_GetSplashFailed value) getSplashFailed,
  }) {
    return getSplashInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetSplashInProgress value)? getSplashInProgress,
    TResult Function(_GetSplashSucceed value)? getSplashSucceed,
    TResult Function(_GetSplashFailed value)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (getSplashInProgress != null) {
      return getSplashInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetSplashInProgress implements SplashStateType {
  const factory _GetSplashInProgress() = _$_GetSplashInProgress;
}

/// @nodoc
abstract class _$GetSplashSucceedCopyWith<$Res> {
  factory _$GetSplashSucceedCopyWith(
          _GetSplashSucceed value, $Res Function(_GetSplashSucceed) then) =
      __$GetSplashSucceedCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetSplashSucceedCopyWithImpl<$Res>
    extends _$SplashStateTypeCopyWithImpl<$Res>
    implements _$GetSplashSucceedCopyWith<$Res> {
  __$GetSplashSucceedCopyWithImpl(
      _GetSplashSucceed _value, $Res Function(_GetSplashSucceed) _then)
      : super(_value, (v) => _then(v as _GetSplashSucceed));

  @override
  _GetSplashSucceed get _value => super._value as _GetSplashSucceed;
}

/// @nodoc
class _$_GetSplashSucceed implements _GetSplashSucceed {
  const _$_GetSplashSucceed();

  @override
  String toString() {
    return 'SplashStateType.getSplashSucceed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetSplashSucceed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getSplashInProgress,
    required TResult Function() getSplashSucceed,
    required TResult Function(SplashFailure failure) getSplashFailed,
  }) {
    return getSplashSucceed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getSplashInProgress,
    TResult Function()? getSplashSucceed,
    TResult Function(SplashFailure failure)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (getSplashSucceed != null) {
      return getSplashSucceed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetSplashInProgress value) getSplashInProgress,
    required TResult Function(_GetSplashSucceed value) getSplashSucceed,
    required TResult Function(_GetSplashFailed value) getSplashFailed,
  }) {
    return getSplashSucceed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetSplashInProgress value)? getSplashInProgress,
    TResult Function(_GetSplashSucceed value)? getSplashSucceed,
    TResult Function(_GetSplashFailed value)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (getSplashSucceed != null) {
      return getSplashSucceed(this);
    }
    return orElse();
  }
}

abstract class _GetSplashSucceed implements SplashStateType {
  const factory _GetSplashSucceed() = _$_GetSplashSucceed;
}

/// @nodoc
abstract class _$GetSplashFailedCopyWith<$Res> {
  factory _$GetSplashFailedCopyWith(
          _GetSplashFailed value, $Res Function(_GetSplashFailed) then) =
      __$GetSplashFailedCopyWithImpl<$Res>;
  $Res call({SplashFailure failure});

  $SplashFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$GetSplashFailedCopyWithImpl<$Res>
    extends _$SplashStateTypeCopyWithImpl<$Res>
    implements _$GetSplashFailedCopyWith<$Res> {
  __$GetSplashFailedCopyWithImpl(
      _GetSplashFailed _value, $Res Function(_GetSplashFailed) _then)
      : super(_value, (v) => _then(v as _GetSplashFailed));

  @override
  _GetSplashFailed get _value => super._value as _GetSplashFailed;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_GetSplashFailed(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SplashFailure,
    ));
  }

  @override
  $SplashFailureCopyWith<$Res> get failure {
    return $SplashFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_GetSplashFailed implements _GetSplashFailed {
  const _$_GetSplashFailed(this.failure);

  @override
  final SplashFailure failure;

  @override
  String toString() {
    return 'SplashStateType.getSplashFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetSplashFailed &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$GetSplashFailedCopyWith<_GetSplashFailed> get copyWith =>
      __$GetSplashFailedCopyWithImpl<_GetSplashFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getSplashInProgress,
    required TResult Function() getSplashSucceed,
    required TResult Function(SplashFailure failure) getSplashFailed,
  }) {
    return getSplashFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getSplashInProgress,
    TResult Function()? getSplashSucceed,
    TResult Function(SplashFailure failure)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (getSplashFailed != null) {
      return getSplashFailed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetSplashInProgress value) getSplashInProgress,
    required TResult Function(_GetSplashSucceed value) getSplashSucceed,
    required TResult Function(_GetSplashFailed value) getSplashFailed,
  }) {
    return getSplashFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetSplashInProgress value)? getSplashInProgress,
    TResult Function(_GetSplashSucceed value)? getSplashSucceed,
    TResult Function(_GetSplashFailed value)? getSplashFailed,
    required TResult orElse(),
  }) {
    if (getSplashFailed != null) {
      return getSplashFailed(this);
    }
    return orElse();
  }
}

abstract class _GetSplashFailed implements SplashStateType {
  const factory _GetSplashFailed(SplashFailure failure) = _$_GetSplashFailed;

  SplashFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GetSplashFailedCopyWith<_GetSplashFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
