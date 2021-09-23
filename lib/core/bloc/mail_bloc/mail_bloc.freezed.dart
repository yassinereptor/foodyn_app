// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'mail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MailEventTearOff {
  const _$MailEventTearOff();

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
const $MailEvent = _$MailEventTearOff();

/// @nodoc
mixin _$MailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? confirmationEmailStatus,
    TResult Function(String email)? resendConfirmationEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmationEmailStatus value)
        confirmationEmailStatus,
    required TResult Function(_ResendConfirmationEmail value)
        resendConfirmationEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmationEmailStatus value)? confirmationEmailStatus,
    TResult Function(_ResendConfirmationEmail value)? resendConfirmationEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailEventCopyWith<$Res> {
  factory $MailEventCopyWith(MailEvent value, $Res Function(MailEvent) then) =
      _$MailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MailEventCopyWithImpl<$Res> implements $MailEventCopyWith<$Res> {
  _$MailEventCopyWithImpl(this._value, this._then);

  final MailEvent _value;
  // ignore: unused_field
  final $Res Function(MailEvent) _then;
}

/// @nodoc
abstract class _$ConfirmationEmailStatusCopyWith<$Res> {
  factory _$ConfirmationEmailStatusCopyWith(_ConfirmationEmailStatus value,
          $Res Function(_ConfirmationEmailStatus) then) =
      __$ConfirmationEmailStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$ConfirmationEmailStatusCopyWithImpl<$Res>
    extends _$MailEventCopyWithImpl<$Res>
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
    return 'MailEvent.confirmationEmailStatus()';
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
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) {
    return confirmationEmailStatus();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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

abstract class _ConfirmationEmailStatus implements MailEvent {
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
    extends _$MailEventCopyWithImpl<$Res>
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
    return 'MailEvent.resendConfirmationEmail(email: $email)';
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
    required TResult Function() confirmationEmailStatus,
    required TResult Function(String email) resendConfirmationEmail,
  }) {
    return resendConfirmationEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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

abstract class _ResendConfirmationEmail implements MailEvent {
  factory _ResendConfirmationEmail(String email) = _$_ResendConfirmationEmail;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ResendConfirmationEmailCopyWith<_ResendConfirmationEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$MailStateTearOff {
  const _$MailStateTearOff();

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

  _LoadingFailed loadingFailed(AuthFailure failure) {
    return _LoadingFailed(
      failure,
    );
  }
}

/// @nodoc
const $MailState = _$MailStateTearOff();

/// @nodoc
mixin _$MailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function(UserModel? user) loadingSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
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
abstract class $MailStateCopyWith<$Res> {
  factory $MailStateCopyWith(MailState value, $Res Function(MailState) then) =
      _$MailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MailStateCopyWithImpl<$Res> implements $MailStateCopyWith<$Res> {
  _$MailStateCopyWithImpl(this._value, this._then);

  final MailState _value;
  // ignore: unused_field
  final $Res Function(MailState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$MailStateCopyWithImpl<$Res>
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
    return 'MailState.initial()';
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
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
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

abstract class _Initial implements MailState {
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
    extends _$MailStateCopyWithImpl<$Res>
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
    return 'MailState.loadingInProgress()';
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
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
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

abstract class _LoadingInProgress implements MailState {
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
class __$LoadingSuccessCopyWithImpl<$Res> extends _$MailStateCopyWithImpl<$Res>
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
    return 'MailState.loadingSuccess(user: $user)';
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
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
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

abstract class _LoadingSuccess implements MailState {
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
  $Res call({AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadingFailedCopyWithImpl<$Res> extends _$MailStateCopyWithImpl<$Res>
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
    return 'MailState.loadingFailed(failure: $failure)';
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
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function(UserModel? user)? loadingSuccess,
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

abstract class _LoadingFailed implements MailState {
  const factory _LoadingFailed(AuthFailure failure) = _$_LoadingFailed;

  AuthFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}