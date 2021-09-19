// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OtpEventTearOff {
  const _$OtpEventTearOff();

  _SendOtp sendOtp(int dialCode, String phoneNumber) {
    return _SendOtp(
      dialCode,
      phoneNumber,
    );
  }

  _VerifyOtp verifyOtp(String otp) {
    return _VerifyOtp(
      otp,
    );
  }
}

/// @nodoc
const $OtpEvent = _$OtpEventTearOff();

/// @nodoc
mixin _$OtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dialCode, String phoneNumber) sendOtp,
    required TResult Function(String otp) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res> implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  final OtpEvent _value;
  // ignore: unused_field
  final $Res Function(OtpEvent) _then;
}

/// @nodoc
abstract class _$SendOtpCopyWith<$Res> {
  factory _$SendOtpCopyWith(_SendOtp value, $Res Function(_SendOtp) then) =
      __$SendOtpCopyWithImpl<$Res>;
  $Res call({int dialCode, String phoneNumber});
}

/// @nodoc
class __$SendOtpCopyWithImpl<$Res> extends _$OtpEventCopyWithImpl<$Res>
    implements _$SendOtpCopyWith<$Res> {
  __$SendOtpCopyWithImpl(_SendOtp _value, $Res Function(_SendOtp) _then)
      : super(_value, (v) => _then(v as _SendOtp));

  @override
  _SendOtp get _value => super._value as _SendOtp;

  @override
  $Res call({
    Object? dialCode = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_SendOtp(
      dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendOtp implements _SendOtp {
  const _$_SendOtp(this.dialCode, this.phoneNumber);

  @override
  final int dialCode;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'OtpEvent.sendOtp(dialCode: $dialCode, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendOtp &&
            (identical(other.dialCode, dialCode) ||
                const DeepCollectionEquality()
                    .equals(other.dialCode, dialCode)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dialCode) ^
      const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  _$SendOtpCopyWith<_SendOtp> get copyWith =>
      __$SendOtpCopyWithImpl<_SendOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dialCode, String phoneNumber) sendOtp,
    required TResult Function(String otp) verifyOtp,
  }) {
    return sendOtp(dialCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(dialCode, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements OtpEvent {
  const factory _SendOtp(int dialCode, String phoneNumber) = _$_SendOtp;

  int get dialCode => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SendOtpCopyWith<_SendOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VerifyOtpCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(
          _VerifyOtp value, $Res Function(_VerifyOtp) then) =
      __$VerifyOtpCopyWithImpl<$Res>;
  $Res call({String otp});
}

/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res> extends _$OtpEventCopyWithImpl<$Res>
    implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(_VerifyOtp _value, $Res Function(_VerifyOtp) _then)
      : super(_value, (v) => _then(v as _VerifyOtp));

  @override
  _VerifyOtp get _value => super._value as _VerifyOtp;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_VerifyOtp(
      otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyOtp implements _VerifyOtp {
  const _$_VerifyOtp(this.otp);

  @override
  final String otp;

  @override
  String toString() {
    return 'OtpEvent.verifyOtp(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerifyOtp &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otp);

  @JsonKey(ignore: true)
  @override
  _$VerifyOtpCopyWith<_VerifyOtp> get copyWith =>
      __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dialCode, String phoneNumber) sendOtp,
    required TResult Function(String otp) verifyOtp,
  }) {
    return verifyOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements OtpEvent {
  const factory _VerifyOtp(String otp) = _$_VerifyOtp;

  String get otp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VerifyOtpCopyWith<_VerifyOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$OtpStateTearOff {
  const _$OtpStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadingSending loadingSending() {
    return const _LoadingSending();
  }

  _LoadingSent loadingSent() {
    return const _LoadingSent();
  }

  _LoadingInProgress loadingInProgress() {
    return const _LoadingInProgress();
  }

  _LoadingSuccess loadingSuccess() {
    return const _LoadingSuccess();
  }

  _LoadingFailed loadingFailed(AuthFailure failure) {
    return _LoadingFailed(
      failure,
    );
  }
}

/// @nodoc
const $OtpState = _$OtpStateTearOff();

/// @nodoc
mixin _$OtpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res> implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  final OtpState _value;
  // ignore: unused_field
  final $Res Function(OtpState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$OtpStateCopyWithImpl<$Res>
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
    return 'OtpState.initial()';
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
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
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
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OtpState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingSendingCopyWith<$Res> {
  factory _$LoadingSendingCopyWith(
          _LoadingSending value, $Res Function(_LoadingSending) then) =
      __$LoadingSendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingSendingCopyWithImpl<$Res> extends _$OtpStateCopyWithImpl<$Res>
    implements _$LoadingSendingCopyWith<$Res> {
  __$LoadingSendingCopyWithImpl(
      _LoadingSending _value, $Res Function(_LoadingSending) _then)
      : super(_value, (v) => _then(v as _LoadingSending));

  @override
  _LoadingSending get _value => super._value as _LoadingSending;
}

/// @nodoc

class _$_LoadingSending implements _LoadingSending {
  const _$_LoadingSending();

  @override
  String toString() {
    return 'OtpState.loadingSending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingSending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingSending();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSending != null) {
      return loadingSending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingSending(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSending != null) {
      return loadingSending(this);
    }
    return orElse();
  }
}

abstract class _LoadingSending implements OtpState {
  const factory _LoadingSending() = _$_LoadingSending;
}

/// @nodoc
abstract class _$LoadingSentCopyWith<$Res> {
  factory _$LoadingSentCopyWith(
          _LoadingSent value, $Res Function(_LoadingSent) then) =
      __$LoadingSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingSentCopyWithImpl<$Res> extends _$OtpStateCopyWithImpl<$Res>
    implements _$LoadingSentCopyWith<$Res> {
  __$LoadingSentCopyWithImpl(
      _LoadingSent _value, $Res Function(_LoadingSent) _then)
      : super(_value, (v) => _then(v as _LoadingSent));

  @override
  _LoadingSent get _value => super._value as _LoadingSent;
}

/// @nodoc

class _$_LoadingSent implements _LoadingSent {
  const _$_LoadingSent();

  @override
  String toString() {
    return 'OtpState.loadingSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingSent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSent != null) {
      return loadingSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingSent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSent != null) {
      return loadingSent(this);
    }
    return orElse();
  }
}

abstract class _LoadingSent implements OtpState {
  const factory _LoadingSent() = _$_LoadingSent;
}

/// @nodoc
abstract class _$LoadingInProgressCopyWith<$Res> {
  factory _$LoadingInProgressCopyWith(
          _LoadingInProgress value, $Res Function(_LoadingInProgress) then) =
      __$LoadingInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingInProgressCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res>
    implements _$LoadingInProgressCopyWith<$Res> {
  __$LoadingInProgressCopyWithImpl(
      _LoadingInProgress _value, $Res Function(_LoadingInProgress) _then)
      : super(_value, (v) => _then(v as _LoadingInProgress));

  @override
  _LoadingInProgress get _value => super._value as _LoadingInProgress;
}

/// @nodoc

class _$_LoadingInProgress implements _LoadingInProgress {
  const _$_LoadingInProgress();

  @override
  String toString() {
    return 'OtpState.loadingInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingInProgress != null) {
      return loadingInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingInProgress != null) {
      return loadingInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadingInProgress implements OtpState {
  const factory _LoadingInProgress() = _$_LoadingInProgress;
}

/// @nodoc
abstract class _$LoadingSuccessCopyWith<$Res> {
  factory _$LoadingSuccessCopyWith(
          _LoadingSuccess value, $Res Function(_LoadingSuccess) then) =
      __$LoadingSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingSuccessCopyWithImpl<$Res> extends _$OtpStateCopyWithImpl<$Res>
    implements _$LoadingSuccessCopyWith<$Res> {
  __$LoadingSuccessCopyWithImpl(
      _LoadingSuccess _value, $Res Function(_LoadingSuccess) _then)
      : super(_value, (v) => _then(v as _LoadingSuccess));

  @override
  _LoadingSuccess get _value => super._value as _LoadingSuccess;
}

/// @nodoc

class _$_LoadingSuccess implements _LoadingSuccess {
  const _$_LoadingSuccess();

  @override
  String toString() {
    return 'OtpState.loadingSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingSuccess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingSuccess implements OtpState {
  const factory _LoadingSuccess() = _$_LoadingSuccess;
}

/// @nodoc
abstract class _$LoadingFailedCopyWith<$Res> {
  factory _$LoadingFailedCopyWith(
          _LoadingFailed value, $Res Function(_LoadingFailed) then) =
      __$LoadingFailedCopyWithImpl<$Res>;
  $Res call({AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadingFailedCopyWithImpl<$Res> extends _$OtpStateCopyWithImpl<$Res>
    implements _$LoadingFailedCopyWith<$Res> {
  __$LoadingFailedCopyWithImpl(
      _LoadingFailed _value, $Res Function(_LoadingFailed) _then)
      : super(_value, (v) => _then(v as _LoadingFailed));

  @override
  _LoadingFailed get _value => super._value as _LoadingFailed;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadingFailed(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get failure {
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadingFailed implements _LoadingFailed {
  const _$_LoadingFailed(this.failure);

  @override
  final AuthFailure failure;

  @override
  String toString() {
    return 'OtpState.loadingFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingFailed &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      __$LoadingFailedCopyWithImpl<_LoadingFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSending,
    required TResult Function() loadingSent,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSending,
    TResult Function()? loadingSent,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingSending value) loadingSending,
    required TResult Function(_LoadingSent value) loadingSent,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingSending value)? loadingSending,
    TResult Function(_LoadingSent value)? loadingSent,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadingFailed implements OtpState {
  const factory _LoadingFailed(AuthFailure failure) = _$_LoadingFailed;

  AuthFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
