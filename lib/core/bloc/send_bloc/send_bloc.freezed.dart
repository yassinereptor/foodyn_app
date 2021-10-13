// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'send_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SendEventTearOff {
  const _$SendEventTearOff();

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

  _ConfirmationEmailStatus confirmationEmailStatus() {
    return _ConfirmationEmailStatus();
  }

  _ResendConfirmationEmail resendConfirmationEmail(String email) {
    return _ResendConfirmationEmail(
      email,
    );
  }
}

/// @nodoc
const $SendEvent = _$SendEventTearOff();

/// @nodoc
mixin _$SendEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dialCode, String phoneNumber) sendOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? confirmationEmailStatus,
    TResult Function(String email)? resendConfirmationEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ConfirmationEmailStatus value)
        confirmationEmailStatus,
    required TResult Function(_ResendConfirmationEmail value)
        resendConfirmationEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ConfirmationEmailStatus value)? confirmationEmailStatus,
    TResult Function(_ResendConfirmationEmail value)? resendConfirmationEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEventCopyWith<$Res> {
  factory $SendEventCopyWith(SendEvent value, $Res Function(SendEvent) then) =
      _$SendEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendEventCopyWithImpl<$Res> implements $SendEventCopyWith<$Res> {
  _$SendEventCopyWithImpl(this._value, this._then);

  final SendEvent _value;
  // ignore: unused_field
  final $Res Function(SendEvent) _then;
}

/// @nodoc
abstract class _$SendOtpCopyWith<$Res> {
  factory _$SendOtpCopyWith(_SendOtp value, $Res Function(_SendOtp) then) =
      __$SendOtpCopyWithImpl<$Res>;
  $Res call({int dialCode, String phoneNumber});
}

/// @nodoc
class __$SendOtpCopyWithImpl<$Res> extends _$SendEventCopyWithImpl<$Res>
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
  _$_SendOtp(this.dialCode, this.phoneNumber);

  @override
  final int dialCode;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SendEvent.sendOtp(dialCode: $dialCode, phoneNumber: $phoneNumber)';
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
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) {
    return sendOtp(dialCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? confirmationEmailStatus,
    TResult Function(String email)? resendConfirmationEmail,
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
    required TResult Function(_ConfirmationEmailStatus value)
        confirmationEmailStatus,
    required TResult Function(_ResendConfirmationEmail value)
        resendConfirmationEmail,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ConfirmationEmailStatus value)? confirmationEmailStatus,
    TResult Function(_ResendConfirmationEmail value)? resendConfirmationEmail,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements SendEvent {
  factory _SendOtp(int dialCode, String phoneNumber) = _$_SendOtp;

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
class __$VerifyOtpCopyWithImpl<$Res> extends _$SendEventCopyWithImpl<$Res>
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
  _$_VerifyOtp(this.otp);

  @override
  final String otp;

  @override
  String toString() {
    return 'SendEvent.verifyOtp(otp: $otp)';
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
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) {
    return verifyOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? confirmationEmailStatus,
    TResult Function(String email)? resendConfirmationEmail,
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
    required TResult Function(_ConfirmationEmailStatus value)
        confirmationEmailStatus,
    required TResult Function(_ResendConfirmationEmail value)
        resendConfirmationEmail,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ConfirmationEmailStatus value)? confirmationEmailStatus,
    TResult Function(_ResendConfirmationEmail value)? resendConfirmationEmail,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements SendEvent {
  factory _VerifyOtp(String otp) = _$_VerifyOtp;

  String get otp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VerifyOtpCopyWith<_VerifyOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ConfirmationEmailStatusCopyWith<$Res> {
  factory _$ConfirmationEmailStatusCopyWith(_ConfirmationEmailStatus value,
          $Res Function(_ConfirmationEmailStatus) then) =
      __$ConfirmationEmailStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$ConfirmationEmailStatusCopyWithImpl<$Res>
    extends _$SendEventCopyWithImpl<$Res>
    implements _$ConfirmationEmailStatusCopyWith<$Res> {
  __$ConfirmationEmailStatusCopyWithImpl(_ConfirmationEmailStatus _value,
      $Res Function(_ConfirmationEmailStatus) _then)
      : super(_value, (v) => _then(v as _ConfirmationEmailStatus));

  @override
  _ConfirmationEmailStatus get _value =>
      super._value as _ConfirmationEmailStatus;
}

/// @nodoc

class _$_ConfirmationEmailStatus implements _ConfirmationEmailStatus {
  _$_ConfirmationEmailStatus();

  @override
  String toString() {
    return 'SendEvent.confirmationEmailStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ConfirmationEmailStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dialCode, String phoneNumber) sendOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) {
    return confirmationEmailStatus();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? confirmationEmailStatus,
    TResult Function(String email)? resendConfirmationEmail,
    required TResult orElse(),
  }) {
    if (confirmationEmailStatus != null) {
      return confirmationEmailStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ConfirmationEmailStatus value)
        confirmationEmailStatus,
    required TResult Function(_ResendConfirmationEmail value)
        resendConfirmationEmail,
  }) {
    return confirmationEmailStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ConfirmationEmailStatus value)? confirmationEmailStatus,
    TResult Function(_ResendConfirmationEmail value)? resendConfirmationEmail,
    required TResult orElse(),
  }) {
    if (confirmationEmailStatus != null) {
      return confirmationEmailStatus(this);
    }
    return orElse();
  }
}

abstract class _ConfirmationEmailStatus implements SendEvent {
  factory _ConfirmationEmailStatus() = _$_ConfirmationEmailStatus;
}

/// @nodoc
abstract class _$ResendConfirmationEmailCopyWith<$Res> {
  factory _$ResendConfirmationEmailCopyWith(_ResendConfirmationEmail value,
          $Res Function(_ResendConfirmationEmail) then) =
      __$ResendConfirmationEmailCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$ResendConfirmationEmailCopyWithImpl<$Res>
    extends _$SendEventCopyWithImpl<$Res>
    implements _$ResendConfirmationEmailCopyWith<$Res> {
  __$ResendConfirmationEmailCopyWithImpl(_ResendConfirmationEmail _value,
      $Res Function(_ResendConfirmationEmail) _then)
      : super(_value, (v) => _then(v as _ResendConfirmationEmail));

  @override
  _ResendConfirmationEmail get _value =>
      super._value as _ResendConfirmationEmail;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_ResendConfirmationEmail(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResendConfirmationEmail implements _ResendConfirmationEmail {
  _$_ResendConfirmationEmail(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SendEvent.resendConfirmationEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResendConfirmationEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$ResendConfirmationEmailCopyWith<_ResendConfirmationEmail> get copyWith =>
      __$ResendConfirmationEmailCopyWithImpl<_ResendConfirmationEmail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dialCode, String phoneNumber) sendOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) {
    return resendConfirmationEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dialCode, String phoneNumber)? sendOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? confirmationEmailStatus,
    TResult Function(String email)? resendConfirmationEmail,
    required TResult orElse(),
  }) {
    if (resendConfirmationEmail != null) {
      return resendConfirmationEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ConfirmationEmailStatus value)
        confirmationEmailStatus,
    required TResult Function(_ResendConfirmationEmail value)
        resendConfirmationEmail,
  }) {
    return resendConfirmationEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ConfirmationEmailStatus value)? confirmationEmailStatus,
    TResult Function(_ResendConfirmationEmail value)? resendConfirmationEmail,
    required TResult orElse(),
  }) {
    if (resendConfirmationEmail != null) {
      return resendConfirmationEmail(this);
    }
    return orElse();
  }
}

abstract class _ResendConfirmationEmail implements SendEvent {
  factory _ResendConfirmationEmail(String email) = _$_ResendConfirmationEmail;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ResendConfirmationEmailCopyWith<_ResendConfirmationEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SendStateTearOff {
  const _$SendStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadingInProgress loadingInProgress() {
    return const _LoadingInProgress();
  }

  _LoadingSuccess loadingSuccess(UserModel? user) {
    return _LoadingSuccess(
      user,
    );
  }

  _LoadingFailed loadingFailed(AppFailure failure) {
    return _LoadingFailed(
      failure,
    );
  }
}

/// @nodoc
const $SendState = _$SendStateTearOff();

/// @nodoc
mixin _$SendState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function(UserModel? user) loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendStateCopyWith<$Res> {
  factory $SendStateCopyWith(SendState value, $Res Function(SendState) then) =
      _$SendStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendStateCopyWithImpl<$Res> implements $SendStateCopyWith<$Res> {
  _$SendStateCopyWithImpl(this._value, this._then);

  final SendState _value;
  // ignore: unused_field
  final $Res Function(SendState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SendStateCopyWithImpl<$Res>
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
    return 'SendState.initial()';
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
    required TResult Function() loadingInProgress,
    required TResult Function(UserModel? user) loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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

abstract class _Initial implements SendState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingInProgressCopyWith<$Res> {
  factory _$LoadingInProgressCopyWith(
          _LoadingInProgress value, $Res Function(_LoadingInProgress) then) =
      __$LoadingInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingInProgressCopyWithImpl<$Res>
    extends _$SendStateCopyWithImpl<$Res>
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
    return 'SendState.loadingInProgress()';
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
    required TResult Function() loadingInProgress,
    required TResult Function(UserModel? user) loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) {
    return loadingInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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

abstract class _LoadingInProgress implements SendState {
  const factory _LoadingInProgress() = _$_LoadingInProgress;
}

/// @nodoc
abstract class _$LoadingSuccessCopyWith<$Res> {
  factory _$LoadingSuccessCopyWith(
          _LoadingSuccess value, $Res Function(_LoadingSuccess) then) =
      __$LoadingSuccessCopyWithImpl<$Res>;
  $Res call({UserModel? user});
}

/// @nodoc
class __$LoadingSuccessCopyWithImpl<$Res> extends _$SendStateCopyWithImpl<$Res>
    implements _$LoadingSuccessCopyWith<$Res> {
  __$LoadingSuccessCopyWithImpl(
      _LoadingSuccess _value, $Res Function(_LoadingSuccess) _then)
      : super(_value, (v) => _then(v as _LoadingSuccess));

  @override
  _LoadingSuccess get _value => super._value as _LoadingSuccess;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_LoadingSuccess(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_LoadingSuccess implements _LoadingSuccess {
  const _$_LoadingSuccess(this.user);

  @override
  final UserModel? user;

  @override
  String toString() {
    return 'SendState.loadingSuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingSuccess &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$LoadingSuccessCopyWith<_LoadingSuccess> get copyWith =>
      __$LoadingSuccessCopyWithImpl<_LoadingSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function(UserModel? user) loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) {
    return loadingSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
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

abstract class _LoadingSuccess implements SendState {
  const factory _LoadingSuccess(UserModel? user) = _$_LoadingSuccess;

  UserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingSuccessCopyWith<_LoadingSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingFailedCopyWith<$Res> {
  factory _$LoadingFailedCopyWith(
          _LoadingFailed value, $Res Function(_LoadingFailed) then) =
      __$LoadingFailedCopyWithImpl<$Res>;
  $Res call({AppFailure failure});

  $AppFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadingFailedCopyWithImpl<$Res> extends _$SendStateCopyWithImpl<$Res>
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
              as AppFailure,
    ));
  }

  @override
  $AppFailureCopyWith<$Res> get failure {
    return $AppFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadingFailed implements _LoadingFailed {
  const _$_LoadingFailed(this.failure);

  @override
  final AppFailure failure;

  @override
  String toString() {
    return 'SendState.loadingFailed(failure: $failure)';
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
    required TResult Function() loadingInProgress,
    required TResult Function(UserModel? user) loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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

abstract class _LoadingFailed implements SendState {
  const factory _LoadingFailed(AppFailure failure) = _$_LoadingFailed;

  AppFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
