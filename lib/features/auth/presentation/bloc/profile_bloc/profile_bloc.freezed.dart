// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileEventTearOff {
  const _$ProfileEventTearOff();

  _UploadImage uploadImage(ImageType type, File file) {
    return _UploadImage(
      type,
      file,
    );
  }

  _saveProfile saveProfile(ProfileModel profile) {
    return _saveProfile(
      profile,
    );
  }
}

/// @nodoc
const $ProfileEvent = _$ProfileEventTearOff();

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_saveProfile value) saveProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_saveProfile value)? saveProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res> implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  final ProfileEvent _value;
  // ignore: unused_field
  final $Res Function(ProfileEvent) _then;
}

/// @nodoc
abstract class _$UploadImageCopyWith<$Res> {
  factory _$UploadImageCopyWith(
          _UploadImage value, $Res Function(_UploadImage) then) =
      __$UploadImageCopyWithImpl<$Res>;
  $Res call({ImageType type, File file});
}

/// @nodoc
class __$UploadImageCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
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
    return 'ProfileEvent.uploadImage(type: $type, file: $file)';
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
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
  }) {
    return uploadImage(type, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
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
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_saveProfile value) saveProfile,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_saveProfile value)? saveProfile,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class _UploadImage implements ProfileEvent {
  factory _UploadImage(ImageType type, File file) = _$_UploadImage;

  ImageType get type => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UploadImageCopyWith<_UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$saveProfileCopyWith<$Res> {
  factory _$saveProfileCopyWith(
          _saveProfile value, $Res Function(_saveProfile) then) =
      __$saveProfileCopyWithImpl<$Res>;
  $Res call({ProfileModel profile});
}

/// @nodoc
class __$saveProfileCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements _$saveProfileCopyWith<$Res> {
  __$saveProfileCopyWithImpl(
      _saveProfile _value, $Res Function(_saveProfile) _then)
      : super(_value, (v) => _then(v as _saveProfile));

  @override
  _saveProfile get _value => super._value as _saveProfile;

  @override
  $Res call({
    Object? profile = freezed,
  }) {
    return _then(_saveProfile(
      profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$_saveProfile implements _saveProfile {
  _$_saveProfile(this.profile);

  @override
  final ProfileModel profile;

  @override
  String toString() {
    return 'ProfileEvent.saveProfile(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _saveProfile &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality().equals(other.profile, profile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(profile);

  @JsonKey(ignore: true)
  @override
  _$saveProfileCopyWith<_saveProfile> get copyWith =>
      __$saveProfileCopyWithImpl<_saveProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
  }) {
    return saveProfile(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
    required TResult orElse(),
  }) {
    if (saveProfile != null) {
      return saveProfile(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_saveProfile value) saveProfile,
  }) {
    return saveProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_saveProfile value)? saveProfile,
    required TResult orElse(),
  }) {
    if (saveProfile != null) {
      return saveProfile(this);
    }
    return orElse();
  }
}

abstract class _saveProfile implements ProfileEvent {
  factory _saveProfile(ProfileModel profile) = _$_saveProfile;

  ProfileModel get profile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$saveProfileCopyWith<_saveProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadingInProgress loadingInProgress() {
    return const _LoadingInProgress();
  }

  _LoadingSuccess loadingSuccess() {
    return const _LoadingSuccess();
  }

  _LoadingProfileSuccess loadingProfileSuccess(ProfileModel? profile) {
    return _LoadingProfileSuccess(
      profile,
    );
  }

  _LoadingFailed loadingFailed(AuthFailure failure) {
    return _LoadingFailed(
      failure,
    );
  }
}

/// @nodoc
const $ProfileState = _$ProfileStateTearOff();

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
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
    return 'ProfileState.initial()';
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
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
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
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res>
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
    return 'ProfileState.loadingInProgress()';
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
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
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
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingInProgress != null) {
      return loadingInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadingInProgress implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res>
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
    return 'ProfileState.loadingSuccess()';
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
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingSuccess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
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
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
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
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingSuccess implements ProfileState {
  const factory _LoadingSuccess() = _$_LoadingSuccess;
}

/// @nodoc
abstract class _$LoadingProfileSuccessCopyWith<$Res> {
  factory _$LoadingProfileSuccessCopyWith(_LoadingProfileSuccess value,
          $Res Function(_LoadingProfileSuccess) then) =
      __$LoadingProfileSuccessCopyWithImpl<$Res>;
  $Res call({ProfileModel? profile});
}

/// @nodoc
class __$LoadingProfileSuccessCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements _$LoadingProfileSuccessCopyWith<$Res> {
  __$LoadingProfileSuccessCopyWithImpl(_LoadingProfileSuccess _value,
      $Res Function(_LoadingProfileSuccess) _then)
      : super(_value, (v) => _then(v as _LoadingProfileSuccess));

  @override
  _LoadingProfileSuccess get _value => super._value as _LoadingProfileSuccess;

  @override
  $Res call({
    Object? profile = freezed,
  }) {
    return _then(_LoadingProfileSuccess(
      profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
    ));
  }
}

/// @nodoc

class _$_LoadingProfileSuccess implements _LoadingProfileSuccess {
  const _$_LoadingProfileSuccess(this.profile);

  @override
  final ProfileModel? profile;

  @override
  String toString() {
    return 'ProfileState.loadingProfileSuccess(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingProfileSuccess &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality().equals(other.profile, profile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(profile);

  @JsonKey(ignore: true)
  @override
  _$LoadingProfileSuccessCopyWith<_LoadingProfileSuccess> get copyWith =>
      __$LoadingProfileSuccessCopyWithImpl<_LoadingProfileSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingProfileSuccess(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
    TResult Function(AuthFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingProfileSuccess != null) {
      return loadingProfileSuccess(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingInProgress value) loadingInProgress,
    required TResult Function(_LoadingSuccess value) loadingSuccess,
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingProfileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingProfileSuccess != null) {
      return loadingProfileSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingProfileSuccess implements ProfileState {
  const factory _LoadingProfileSuccess(ProfileModel? profile) =
      _$_LoadingProfileSuccess;

  ProfileModel? get profile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingProfileSuccessCopyWith<_LoadingProfileSuccess> get copyWith =>
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
class __$LoadingFailedCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
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
    return 'ProfileState.loadingFailed(failure: $failure)';
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
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(AuthFailure failure) loadingFailed,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
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
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadingFailed implements ProfileState {
  const factory _LoadingFailed(AuthFailure failure) = _$_LoadingFailed;

  AuthFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
