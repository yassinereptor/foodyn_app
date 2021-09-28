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

  _SaveProfile saveProfile(ProfileModel profile) {
    return _SaveProfile(
      profile,
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
const $ProfileEvent = _$ProfileEventTearOff();

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_SaveProfile value) saveProfile,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_SaveProfile value)? saveProfile,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
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
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return uploadImage(type, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
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
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_SaveProfile value) saveProfile,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_SaveProfile value)? saveProfile,
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

abstract class _UploadImage implements ProfileEvent {
  factory _UploadImage(ImageType type, File file) = _$_UploadImage;

  ImageType get type => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UploadImageCopyWith<_UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveProfileCopyWith<$Res> {
  factory _$SaveProfileCopyWith(
          _SaveProfile value, $Res Function(_SaveProfile) then) =
      __$SaveProfileCopyWithImpl<$Res>;
  $Res call({ProfileModel profile});
}

/// @nodoc
class __$SaveProfileCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements _$SaveProfileCopyWith<$Res> {
  __$SaveProfileCopyWithImpl(
      _SaveProfile _value, $Res Function(_SaveProfile) _then)
      : super(_value, (v) => _then(v as _SaveProfile));

  @override
  _SaveProfile get _value => super._value as _SaveProfile;

  @override
  $Res call({
    Object? profile = freezed,
  }) {
    return _then(_SaveProfile(
      profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$_SaveProfile implements _SaveProfile {
  _$_SaveProfile(this.profile);

  @override
  final ProfileModel profile;

  @override
  String toString() {
    return 'ProfileEvent.saveProfile(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SaveProfile &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality().equals(other.profile, profile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(profile);

  @JsonKey(ignore: true)
  @override
  _$SaveProfileCopyWith<_SaveProfile> get copyWith =>
      __$SaveProfileCopyWithImpl<_SaveProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return saveProfile(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
    TResult Function(int planId, int periodId, int? couponId)? saveMembership,
    TResult Function(String code)? checkCouponStatus,
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
    required TResult Function(_SaveProfile value) saveProfile,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return saveProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_SaveProfile value)? saveProfile,
    TResult Function(_SaveMembership value)? saveMembership,
    TResult Function(_CheckCouponStatus value)? checkCouponStatus,
    required TResult orElse(),
  }) {
    if (saveProfile != null) {
      return saveProfile(this);
    }
    return orElse();
  }
}

abstract class _SaveProfile implements ProfileEvent {
  factory _SaveProfile(ProfileModel profile) = _$_SaveProfile;

  ProfileModel get profile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SaveProfileCopyWith<_SaveProfile> get copyWith =>
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
class __$SaveMembershipCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
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
    return 'ProfileEvent.saveMembership(planId: $planId, periodId: $periodId, couponId: $couponId)';
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
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return saveMembership(planId, periodId, couponId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
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
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_SaveProfile value) saveProfile,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return saveMembership(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_SaveProfile value)? saveProfile,
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

abstract class _SaveMembership implements ProfileEvent {
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
    extends _$ProfileEventCopyWithImpl<$Res>
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
    return 'ProfileEvent.checkCouponStatus(code: $code)';
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
    required TResult Function(ImageType type, File file) uploadImage,
    required TResult Function(ProfileModel profile) saveProfile,
    required TResult Function(int planId, int periodId, int? couponId)
        saveMembership,
    required TResult Function(String code) checkCouponStatus,
  }) {
    return checkCouponStatus(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageType type, File file)? uploadImage,
    TResult Function(ProfileModel profile)? saveProfile,
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
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_SaveProfile value) saveProfile,
    required TResult Function(_SaveMembership value) saveMembership,
    required TResult Function(_CheckCouponStatus value) checkCouponStatus,
  }) {
    return checkCouponStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_SaveProfile value)? saveProfile,
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

abstract class _CheckCouponStatus implements ProfileEvent {
  factory _CheckCouponStatus(String code) = _$_CheckCouponStatus;

  String get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CheckCouponStatusCopyWith<_CheckCouponStatus> get copyWith =>
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

  _LoadingCouponSuccess loadingCouponSuccess(CouponModel? coupon) {
    return _LoadingCouponSuccess(
      coupon,
    );
  }

  _LoadingMembershipSuccess loadingMembershipSuccess(
      MembershipModel? membership) {
    return _LoadingMembershipSuccess(
      membership,
    );
  }

  _LoadingFailed loadingFailed(AppFailure failure) {
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
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
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
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
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
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
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
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
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
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
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
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
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
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
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
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
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
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
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
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
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
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
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
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
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
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
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
abstract class _$LoadingCouponSuccessCopyWith<$Res> {
  factory _$LoadingCouponSuccessCopyWith(_LoadingCouponSuccess value,
          $Res Function(_LoadingCouponSuccess) then) =
      __$LoadingCouponSuccessCopyWithImpl<$Res>;
  $Res call({CouponModel? coupon});
}

/// @nodoc
class __$LoadingCouponSuccessCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
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
    return 'ProfileState.loadingCouponSuccess(coupon: $coupon)';
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
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) {
    return loadingCouponSuccess(coupon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingCouponSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingCouponSuccess != null) {
      return loadingCouponSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingCouponSuccess implements ProfileState {
  const factory _LoadingCouponSuccess(CouponModel? coupon) =
      _$_LoadingCouponSuccess;

  CouponModel? get coupon => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingCouponSuccessCopyWith<_LoadingCouponSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingMembershipSuccessCopyWith<$Res> {
  factory _$LoadingMembershipSuccessCopyWith(_LoadingMembershipSuccess value,
          $Res Function(_LoadingMembershipSuccess) then) =
      __$LoadingMembershipSuccessCopyWithImpl<$Res>;
  $Res call({MembershipModel? membership});
}

/// @nodoc
class __$LoadingMembershipSuccessCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements _$LoadingMembershipSuccessCopyWith<$Res> {
  __$LoadingMembershipSuccessCopyWithImpl(_LoadingMembershipSuccess _value,
      $Res Function(_LoadingMembershipSuccess) _then)
      : super(_value, (v) => _then(v as _LoadingMembershipSuccess));

  @override
  _LoadingMembershipSuccess get _value =>
      super._value as _LoadingMembershipSuccess;

  @override
  $Res call({
    Object? membership = freezed,
  }) {
    return _then(_LoadingMembershipSuccess(
      membership == freezed
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as MembershipModel?,
    ));
  }
}

/// @nodoc

class _$_LoadingMembershipSuccess implements _LoadingMembershipSuccess {
  const _$_LoadingMembershipSuccess(this.membership);

  @override
  final MembershipModel? membership;

  @override
  String toString() {
    return 'ProfileState.loadingMembershipSuccess(membership: $membership)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingMembershipSuccess &&
            (identical(other.membership, membership) ||
                const DeepCollectionEquality()
                    .equals(other.membership, membership)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(membership);

  @JsonKey(ignore: true)
  @override
  _$LoadingMembershipSuccessCopyWith<_LoadingMembershipSuccess> get copyWith =>
      __$LoadingMembershipSuccessCopyWithImpl<_LoadingMembershipSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(ProfileModel? profile) loadingProfileSuccess,
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) {
    return loadingMembershipSuccess(membership);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
    TResult Function(ProfileModel? profile)? loadingProfileSuccess,
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
    TResult Function(AppFailure failure)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingMembershipSuccess != null) {
      return loadingMembershipSuccess(membership);
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
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
    required TResult Function(_LoadingFailed value) loadingFailed,
  }) {
    return loadingMembershipSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingInProgress value)? loadingInProgress,
    TResult Function(_LoadingSuccess value)? loadingSuccess,
    TResult Function(_LoadingProfileSuccess value)? loadingProfileSuccess,
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
    TResult Function(_LoadingFailed value)? loadingFailed,
    required TResult orElse(),
  }) {
    if (loadingMembershipSuccess != null) {
      return loadingMembershipSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadingMembershipSuccess implements ProfileState {
  const factory _LoadingMembershipSuccess(MembershipModel? membership) =
      _$_LoadingMembershipSuccess;

  MembershipModel? get membership => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingMembershipSuccessCopyWith<_LoadingMembershipSuccess> get copyWith =>
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
    required TResult Function(CouponModel? coupon) loadingCouponSuccess,
    required TResult Function(MembershipModel? membership)
        loadingMembershipSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
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
    TResult Function(CouponModel? coupon)? loadingCouponSuccess,
    TResult Function(MembershipModel? membership)? loadingMembershipSuccess,
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
    required TResult Function(_LoadingProfileSuccess value)
        loadingProfileSuccess,
    required TResult Function(_LoadingCouponSuccess value) loadingCouponSuccess,
    required TResult Function(_LoadingMembershipSuccess value)
        loadingMembershipSuccess,
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
    TResult Function(_LoadingCouponSuccess value)? loadingCouponSuccess,
    TResult Function(_LoadingMembershipSuccess value)? loadingMembershipSuccess,
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
  const factory _LoadingFailed(AppFailure failure) = _$_LoadingFailed;

  AppFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
