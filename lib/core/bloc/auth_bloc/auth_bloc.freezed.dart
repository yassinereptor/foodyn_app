// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  _Started started() {
    return _Started();
  }

  _Login login(String email, String password) {
    return _Login(
      email,
      password,
    );
  }

  _Register register(String email, String password) {
    return _Register(
      email,
      password,
    );
  }

  _ForgetPassword forgetPassword(String email) {
    return _ForgetPassword(
      email,
    );
  }

  _JwtIsExpired jwtIsExpired() {
    return _JwtIsExpired();
  }

  _Logout logout() {
    return _Logout();
  }

  _UploadImage uploadImage(ImageType type, File file) {
    return _UploadImage(
      type,
      file,
    );
  }

  _UpdateUser updateUser(UserModel user) {
    return _UpdateUser(
      user,
    );
  }

  _SaveMembership saveMembership(int planId, int periodId, int? couponId) {
    return _SaveMembership(
      planId,
      periodId,
      couponId,
    );
  }

  _CheckCouponStatus checkCouponStatus(String code) {
    return _CheckCouponStatus(
      code,
    );
  }
}

/// @nodoc
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
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
    return 'AuthEvent.started()';
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
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
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
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$LoginCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) then) =
      __$LoginCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(_Login _value, $Res Function(_Login) _then)
      : super(_value, (v) => _then(v as _Login));

  @override
  _Login get _value => super._value as _Login;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_Login(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Login implements _Login {
  _$_Login(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Login &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$LoginCopyWith<_Login> get copyWith =>
      __$LoginCopyWithImpl<_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  factory _Login(String email, String password) = _$_Login;

  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoginCopyWith<_Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RegisterCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) then) =
      __$RegisterCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$RegisterCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(_Register _value, $Res Function(_Register) _then)
      : super(_value, (v) => _then(v as _Register));

  @override
  _Register get _value => super._value as _Register;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_Register(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Register implements _Register {
  _$_Register(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.register(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Register &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$RegisterCopyWith<_Register> get copyWith =>
      __$RegisterCopyWithImpl<_Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return register(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements AuthEvent {
  factory _Register(String email, String password) = _$_Register;

  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RegisterCopyWith<_Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ForgetPasswordCopyWith<$Res> {
  factory _$ForgetPasswordCopyWith(
          _ForgetPassword value, $Res Function(_ForgetPassword) then) =
      __$ForgetPasswordCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$ForgetPasswordCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$ForgetPasswordCopyWith<$Res> {
  __$ForgetPasswordCopyWithImpl(
      _ForgetPassword _value, $Res Function(_ForgetPassword) _then)
      : super(_value, (v) => _then(v as _ForgetPassword));

  @override
  _ForgetPassword get _value => super._value as _ForgetPassword;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_ForgetPassword(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgetPassword implements _ForgetPassword {
  _$_ForgetPassword(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.forgetPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ForgetPassword &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$ForgetPasswordCopyWith<_ForgetPassword> get copyWith =>
      __$ForgetPasswordCopyWithImpl<_ForgetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return forgetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return forgetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgetPassword implements AuthEvent {
  factory _ForgetPassword(String email) = _$_ForgetPassword;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ForgetPasswordCopyWith<_ForgetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$JwtIsExpiredCopyWith<$Res> {
  factory _$JwtIsExpiredCopyWith(
          _JwtIsExpired value, $Res Function(_JwtIsExpired) then) =
      __$JwtIsExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$JwtIsExpiredCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$JwtIsExpiredCopyWith<$Res> {
  __$JwtIsExpiredCopyWithImpl(
      _JwtIsExpired _value, $Res Function(_JwtIsExpired) _then)
      : super(_value, (v) => _then(v as _JwtIsExpired));

  @override
  _JwtIsExpired get _value => super._value as _JwtIsExpired;
}

/// @nodoc

class _$_JwtIsExpired implements _JwtIsExpired {
  _$_JwtIsExpired();

  @override
  String toString() {
    return 'AuthEvent.jwtIsExpired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _JwtIsExpired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return jwtIsExpired();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (jwtIsExpired != null) {
      return jwtIsExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return jwtIsExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (jwtIsExpired != null) {
      return jwtIsExpired(this);
    }
    return orElse();
  }
}

abstract class _JwtIsExpired implements AuthEvent {
  factory _JwtIsExpired() = _$_JwtIsExpired;
}

/// @nodoc
abstract class _$LogoutCopyWith<$Res> {
  factory _$LogoutCopyWith(_Logout value, $Res Function(_Logout) then) =
      __$LogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$LogoutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$LogoutCopyWith<$Res> {
  __$LogoutCopyWithImpl(_Logout _value, $Res Function(_Logout) _then)
      : super(_value, (v) => _then(v as _Logout));

  @override
  _Logout get _value => super._value as _Logout;
}

/// @nodoc

class _$_Logout implements _Logout {
  _$_Logout();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  factory _Logout() = _$_Logout;
}

/// @nodoc
abstract class _$UploadImageCopyWith<$Res> {
  factory _$UploadImageCopyWith(
          _UploadImage value, $Res Function(_UploadImage) then) =
      __$UploadImageCopyWithImpl<$Res>;
  $Res call({ImageType type, File file});
}

/// @nodoc
class __$UploadImageCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$UploadImageCopyWith<$Res> {
  __$UploadImageCopyWithImpl(
      _UploadImage _value, $Res Function(_UploadImage) _then)
      : super(_value, (v) => _then(v as _UploadImage));

  @override
  _UploadImage get _value => super._value as _UploadImage;

  @override
  $Res call({
    Object? type = freezed,
    Object? file = freezed,
  }) {
    return _then(_UploadImage(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageType,
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_UploadImage implements _UploadImage {
  _$_UploadImage(this.type, this.file);

  @override
  final ImageType type;
  @override
  final File file;

  @override
  String toString() {
    return 'AuthEvent.uploadImage(type: $type, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadImage &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  _$UploadImageCopyWith<_UploadImage> get copyWith =>
      __$UploadImageCopyWithImpl<_UploadImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return uploadImage(type, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(type, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class _UploadImage implements AuthEvent {
  factory _UploadImage(ImageType type, File file) = _$_UploadImage;

  ImageType get type => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UploadImageCopyWith<_UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateUserCopyWith<$Res> {
  factory _$UpdateUserCopyWith(
          _UpdateUser value, $Res Function(_UpdateUser) then) =
      __$UpdateUserCopyWithImpl<$Res>;
  $Res call({UserModel user});
}

/// @nodoc
class __$UpdateUserCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$UpdateUserCopyWith<$Res> {
  __$UpdateUserCopyWithImpl(
      _UpdateUser _value, $Res Function(_UpdateUser) _then)
      : super(_value, (v) => _then(v as _UpdateUser));

  @override
  _UpdateUser get _value => super._value as _UpdateUser;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_UpdateUser(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_UpdateUser implements _UpdateUser {
  _$_UpdateUser(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthEvent.updateUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateUser &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$UpdateUserCopyWith<_UpdateUser> get copyWith =>
      __$UpdateUserCopyWithImpl<_UpdateUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return updateUser(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UpdateUser implements AuthEvent {
  factory _UpdateUser(UserModel user) = _$_UpdateUser;

  UserModel get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateUserCopyWith<_UpdateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveMembershipCopyWith<$Res> {
  factory _$SaveMembershipCopyWith(
          _SaveMembership value, $Res Function(_SaveMembership) then) =
      __$SaveMembershipCopyWithImpl<$Res>;
  $Res call({int planId, int periodId, int? couponId});
}

/// @nodoc
class __$SaveMembershipCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$SaveMembershipCopyWith<$Res> {
  __$SaveMembershipCopyWithImpl(
      _SaveMembership _value, $Res Function(_SaveMembership) _then)
      : super(_value, (v) => _then(v as _SaveMembership));

  @override
  _SaveMembership get _value => super._value as _SaveMembership;

  @override
  $Res call({
    Object? planId = freezed,
    Object? periodId = freezed,
    Object? couponId = freezed,
  }) {
    return _then(_SaveMembership(
      planId == freezed
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      periodId == freezed
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int,
      couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SaveMembership implements _SaveMembership {
  _$_SaveMembership(this.planId, this.periodId, this.couponId);

  @override
  final int planId;
  @override
  final int periodId;
  @override
  final int? couponId;

  @override
  String toString() {
    return 'AuthEvent.saveMembership(planId: $planId, periodId: $periodId, couponId: $couponId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SaveMembership &&
            (identical(other.planId, planId) ||
                const DeepCollectionEquality().equals(other.planId, planId)) &&
            (identical(other.periodId, periodId) ||
                const DeepCollectionEquality()
                    .equals(other.periodId, periodId)) &&
            (identical(other.couponId, couponId) ||
                const DeepCollectionEquality()
                    .equals(other.couponId, couponId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(planId) ^
      const DeepCollectionEquality().hash(periodId) ^
      const DeepCollectionEquality().hash(couponId);

  @JsonKey(ignore: true)
  @override
  _$SaveMembershipCopyWith<_SaveMembership> get copyWith =>
      __$SaveMembershipCopyWithImpl<_SaveMembership>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return saveMembership(planId, periodId, couponId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (saveMembership != null) {
      return saveMembership(planId, periodId, couponId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return saveMembership(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (saveMembership != null) {
      return saveMembership(this);
    }
    return orElse();
  }
}

abstract class _SaveMembership implements AuthEvent {
  factory _SaveMembership(int planId, int periodId, int? couponId) =
      _$_SaveMembership;

  int get planId => throw _privateConstructorUsedError;
  int get periodId => throw _privateConstructorUsedError;
  int? get couponId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SaveMembershipCopyWith<_SaveMembership> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CheckCouponStatusCopyWith<$Res> {
  factory _$CheckCouponStatusCopyWith(
          _CheckCouponStatus value, $Res Function(_CheckCouponStatus) then) =
      __$CheckCouponStatusCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class __$CheckCouponStatusCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$CheckCouponStatusCopyWith<$Res> {
  __$CheckCouponStatusCopyWithImpl(
      _CheckCouponStatus _value, $Res Function(_CheckCouponStatus) _then)
      : super(_value, (v) => _then(v as _CheckCouponStatus));

  @override
  _CheckCouponStatus get _value => super._value as _CheckCouponStatus;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_CheckCouponStatus(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckCouponStatus implements _CheckCouponStatus {
  _$_CheckCouponStatus(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'AuthEvent.checkCouponStatus(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckCouponStatus &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$CheckCouponStatusCopyWith<_CheckCouponStatus> get copyWith =>
      __$CheckCouponStatusCopyWithImpl<_CheckCouponStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) register,
    required TResult Function(String email) forgetPassword,
    required TResult Function() jwtIsExpired,
    required TResult Function() logout,
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(UserModel user) updateUser,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return checkCouponStatus(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? register,
    TResult Function(String email)? forgetPassword,
    TResult Function()? jwtIsExpired,
    TResult Function()? logout,
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(UserModel user)? updateUser,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (checkCouponStatus != null) {
      return checkCouponStatus(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_JwtIsExpired value) jwtIsExpired,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return checkCouponStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_JwtIsExpired value)? jwtIsExpired,
    TResult Function(_Logout value)? logout,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (checkCouponStatus != null) {
      return checkCouponStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckCouponStatus implements AuthEvent {
  factory _CheckCouponStatus(String code) = _$_CheckCouponStatus;

  String get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CheckCouponStatusCopyWith<_CheckCouponStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {required AuthStateType type,
      required AuthStatus status,
      UserModel? user,
      String? token}) {
    return _AuthState(
      type: type,
      status: status,
      user: user,
      token: token,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  AuthStateType get type => throw _privateConstructorUsedError;
  AuthStatus get status => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {AuthStateType type, AuthStatus status, UserModel? user, String? token});

  $AuthStateTypeCopyWith<$Res> get type;
  $AuthStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AuthStateTypeCopyWith<$Res> get type {
    return $AuthStateTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }

  @override
  $AuthStatusCopyWith<$Res> get status {
    return $AuthStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthStateType type, AuthStatus status, UserModel? user, String? token});

  @override
  $AuthStateTypeCopyWith<$Res> get type;
  @override
  $AuthStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? type = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_AuthState(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.type, required this.status, this.user, this.token});

  @override
  final AuthStateType type;
  @override
  final AuthStatus status;
  @override
  final UserModel? user;
  @override
  final String? token;

  @override
  String toString() {
    return 'AuthState(type: $type, status: $status, user: $user, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required AuthStateType type,
      required AuthStatus status,
      UserModel? user,
      String? token}) = _$_AuthState;

  @override
  AuthStateType get type => throw _privateConstructorUsedError;
  @override
  AuthStatus get status => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthStateTypeTearOff {
  const _$AuthStateTypeTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadingInProgress loadingInProgress() {
    return const _LoadingInProgress();
  }

  _LoadingSuccess loadingSuccess() {
    return const _LoadingSuccess();
  }

  _LoadingFailed loadingFailed(AppFailure failure) {
    return _LoadingFailed(
      failure,
    );
  }

  _LogedOut logedOut() {
    return const _LogedOut();
  }

  _LoadingCouponSuccess loadingCouponSuccess(CouponModel? coupon) {
    return _LoadingCouponSuccess(
      coupon,
    );
  }
}

/// @nodoc
const $AuthStateType = _$AuthStateTypeTearOff();

/// @nodoc
mixin _$AuthStateType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateTypeCopyWith<$Res> {
  factory $AuthStateTypeCopyWith(
          AuthStateType value, $Res Function(AuthStateType) then) =
      _$AuthStateTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateTypeCopyWithImpl<$Res>
    implements $AuthStateTypeCopyWith<$Res> {
  _$AuthStateTypeCopyWithImpl(this._value, this._then);

  final AuthStateType _value;
  // ignore: unused_field
  final $Res Function(AuthStateType) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AuthStateTypeCopyWithImpl<$Res>
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
    return 'AuthStateType.initial()';
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
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
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
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
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
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthStateType {
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
    extends _$AuthStateTypeCopyWithImpl<$Res>
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
    return 'AuthStateType.loadingInProgress()';
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
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) {
    return loadingInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
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
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
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
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (loadingInProgress != null) {
      return loadingInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadingInProgress implements AuthStateType {
  const factory _LoadingInProgress() = _$_LoadingInProgress;
}

/// @nodoc
abstract class _$LoadingSuccessCopyWith<$Res> {
  factory _$LoadingSuccessCopyWith(
          _LoadingSuccess value, $Res Function(_LoadingSuccess) then) =
      __$LoadingSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingSuccessCopyWithImpl<$Res>
    extends _$AuthStateTypeCopyWithImpl<$Res>
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
    return 'AuthStateType.loadingSuccess()';
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
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) {
    return loadingSuccess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
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
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
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
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingSuccess implements AuthStateType {
  const factory _LoadingSuccess() = _$_LoadingSuccess;
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
class __$LoadingFailedCopyWithImpl<$Res>
    extends _$AuthStateTypeCopyWithImpl<$Res>
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
    return 'AuthStateType.loadingFailed(failure: $failure)';
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
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
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
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
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
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadingFailed implements AuthStateType {
  const factory _LoadingFailed(AppFailure failure) = _$_LoadingFailed;

  AppFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LogedOutCopyWith<$Res> {
  factory _$LogedOutCopyWith(_LogedOut value, $Res Function(_LogedOut) then) =
      __$LogedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$LogedOutCopyWithImpl<$Res> extends _$AuthStateTypeCopyWithImpl<$Res>
    implements _$LogedOutCopyWith<$Res> {
  __$LogedOutCopyWithImpl(_LogedOut _value, $Res Function(_LogedOut) _then)
      : super(_value, (v) => _then(v as _LogedOut));

  @override
  _LogedOut get _value => super._value as _LogedOut;
}

/// @nodoc

class _$_LogedOut implements _LogedOut {
  const _$_LogedOut();

  @override
  String toString() {
    return 'AuthStateType.logedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LogedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) {
    return logedOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (logedOut != null) {
      return logedOut();
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
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
  }) {
    return logedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (logedOut != null) {
      return logedOut(this);
    }
    return orElse();
  }
}

abstract class _LogedOut implements AuthStateType {
  const factory _LogedOut() = _$_LogedOut;
}

/// @nodoc
abstract class _$LoadingCouponSuccessCopyWith<$Res> {
  factory _$LoadingCouponSuccessCopyWith(_LoadingCouponSuccess value,
          $Res Function(_LoadingCouponSuccess) then) =
      __$LoadingCouponSuccessCopyWithImpl<$Res>;
  $Res call({CouponModel? coupon});
}

/// @nodoc
class __$LoadingCouponSuccessCopyWithImpl<$Res>
    extends _$AuthStateTypeCopyWithImpl<$Res>
    implements _$LoadingCouponSuccessCopyWith<$Res> {
  __$LoadingCouponSuccessCopyWithImpl(
      _LoadingCouponSuccess _value, $Res Function(_LoadingCouponSuccess) _then)
      : super(_value, (v) => _then(v as _LoadingCouponSuccess));

  @override
  _LoadingCouponSuccess get _value => super._value as _LoadingCouponSuccess;

  @override
  $Res call({
    Object? coupon = freezed,
  }) {
    return _then(_LoadingCouponSuccess(
      coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as CouponModel?,
    ));
  }
}

/// @nodoc

class _$_LoadingCouponSuccess implements _LoadingCouponSuccess {
  const _$_LoadingCouponSuccess(this.coupon);

  @override
  final CouponModel? coupon;

  @override
  String toString() {
    return 'AuthStateType.loadingCouponSuccess(coupon: $coupon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingCouponSuccess &&
            (identical(other.coupon, coupon) ||
                const DeepCollectionEquality().equals(other.coupon, coupon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(coupon);

  @JsonKey(ignore: true)
  @override
  _$LoadingCouponSuccessCopyWith<_LoadingCouponSuccess> get copyWith =>
      __$LoadingCouponSuccessCopyWithImpl<_LoadingCouponSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
    required TResult Function() logedOut,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
  }) {
    return loadingCouponSuccess(coupon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    TResult Function()? logedOut,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (loadingCouponSuccess != null) {
      return loadingCouponSuccess(coupon);
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
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
  }) {
    return loadingCouponSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    required TResult orElse(),
  }) {
    if (loadingCouponSuccess != null) {
      return loadingCouponSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingCouponSuccess implements AuthStateType {
  const factory _LoadingCouponSuccess(CouponModel? coupon) =
      _$_LoadingCouponSuccess;

  CouponModel? get coupon => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingCouponSuccessCopyWith<_LoadingCouponSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
