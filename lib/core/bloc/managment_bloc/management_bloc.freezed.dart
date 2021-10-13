// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ManagementEventTearOff {
  const _$ManagementEventTearOff();

  _Started started() {
    return const _Started();
  }

  _GetEateries getEateries() {
    return const _GetEateries();
  }

  _GetEatery getEatery(int id) {
    return _GetEatery(
      id,
    );
  }

  _AddEatery addEatery(EateryModel eateryModel, List<File> files) {
    return _AddEatery(
      eateryModel,
      files,
    );
  }
}

/// @nodoc
const $ManagementEvent = _$ManagementEventTearOff();

/// @nodoc
mixin _$ManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getEateries,
    required TResult Function(int id) getEatery,
    required TResult Function(EateryModel eateryModel, List<File> files)
        addEatery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getEateries,
    TResult Function(int id)? getEatery,
    TResult Function(EateryModel eateryModel, List<File> files)? addEatery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetEateries value) getEateries,
    required TResult Function(_GetEatery value) getEatery,
    required TResult Function(_AddEatery value) addEatery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetEateries value)? getEateries,
    TResult Function(_GetEatery value)? getEatery,
    TResult Function(_AddEatery value)? addEatery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementEventCopyWith<$Res> {
  factory $ManagementEventCopyWith(
          ManagementEvent value, $Res Function(ManagementEvent) then) =
      _$ManagementEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ManagementEventCopyWithImpl<$Res>
    implements $ManagementEventCopyWith<$Res> {
  _$ManagementEventCopyWithImpl(this._value, this._then);

  final ManagementEvent _value;
  // ignore: unused_field
  final $Res Function(ManagementEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$ManagementEventCopyWithImpl<$Res>
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
    return 'ManagementEvent.started()';
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
    required TResult Function() getEateries,
    required TResult Function(int id) getEatery,
    required TResult Function(EateryModel eateryModel, List<File> files)
        addEatery,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getEateries,
    TResult Function(int id)? getEatery,
    TResult Function(EateryModel eateryModel, List<File> files)? addEatery,
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
    required TResult Function(_GetEateries value) getEateries,
    required TResult Function(_GetEatery value) getEatery,
    required TResult Function(_AddEatery value) addEatery,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetEateries value)? getEateries,
    TResult Function(_GetEatery value)? getEatery,
    TResult Function(_AddEatery value)? addEatery,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ManagementEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$GetEateriesCopyWith<$Res> {
  factory _$GetEateriesCopyWith(
          _GetEateries value, $Res Function(_GetEateries) then) =
      __$GetEateriesCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetEateriesCopyWithImpl<$Res>
    extends _$ManagementEventCopyWithImpl<$Res>
    implements _$GetEateriesCopyWith<$Res> {
  __$GetEateriesCopyWithImpl(
      _GetEateries _value, $Res Function(_GetEateries) _then)
      : super(_value, (v) => _then(v as _GetEateries));

  @override
  _GetEateries get _value => super._value as _GetEateries;
}

/// @nodoc

class _$_GetEateries implements _GetEateries {
  const _$_GetEateries();

  @override
  String toString() {
    return 'ManagementEvent.getEateries()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetEateries);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getEateries,
    required TResult Function(int id) getEatery,
    required TResult Function(EateryModel eateryModel, List<File> files)
        addEatery,
  }) {
    return getEateries();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getEateries,
    TResult Function(int id)? getEatery,
    TResult Function(EateryModel eateryModel, List<File> files)? addEatery,
    required TResult orElse(),
  }) {
    if (getEateries != null) {
      return getEateries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetEateries value) getEateries,
    required TResult Function(_GetEatery value) getEatery,
    required TResult Function(_AddEatery value) addEatery,
  }) {
    return getEateries(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetEateries value)? getEateries,
    TResult Function(_GetEatery value)? getEatery,
    TResult Function(_AddEatery value)? addEatery,
    required TResult orElse(),
  }) {
    if (getEateries != null) {
      return getEateries(this);
    }
    return orElse();
  }
}

abstract class _GetEateries implements ManagementEvent {
  const factory _GetEateries() = _$_GetEateries;
}

/// @nodoc
abstract class _$GetEateryCopyWith<$Res> {
  factory _$GetEateryCopyWith(
          _GetEatery value, $Res Function(_GetEatery) then) =
      __$GetEateryCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$GetEateryCopyWithImpl<$Res> extends _$ManagementEventCopyWithImpl<$Res>
    implements _$GetEateryCopyWith<$Res> {
  __$GetEateryCopyWithImpl(_GetEatery _value, $Res Function(_GetEatery) _then)
      : super(_value, (v) => _then(v as _GetEatery));

  @override
  _GetEatery get _value => super._value as _GetEatery;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_GetEatery(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetEatery implements _GetEatery {
  const _$_GetEatery(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ManagementEvent.getEatery(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetEatery &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$GetEateryCopyWith<_GetEatery> get copyWith =>
      __$GetEateryCopyWithImpl<_GetEatery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getEateries,
    required TResult Function(int id) getEatery,
    required TResult Function(EateryModel eateryModel, List<File> files)
        addEatery,
  }) {
    return getEatery(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getEateries,
    TResult Function(int id)? getEatery,
    TResult Function(EateryModel eateryModel, List<File> files)? addEatery,
    required TResult orElse(),
  }) {
    if (getEatery != null) {
      return getEatery(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetEateries value) getEateries,
    required TResult Function(_GetEatery value) getEatery,
    required TResult Function(_AddEatery value) addEatery,
  }) {
    return getEatery(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetEateries value)? getEateries,
    TResult Function(_GetEatery value)? getEatery,
    TResult Function(_AddEatery value)? addEatery,
    required TResult orElse(),
  }) {
    if (getEatery != null) {
      return getEatery(this);
    }
    return orElse();
  }
}

abstract class _GetEatery implements ManagementEvent {
  const factory _GetEatery(int id) = _$_GetEatery;

  int get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GetEateryCopyWith<_GetEatery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddEateryCopyWith<$Res> {
  factory _$AddEateryCopyWith(
          _AddEatery value, $Res Function(_AddEatery) then) =
      __$AddEateryCopyWithImpl<$Res>;
  $Res call({EateryModel eateryModel, List<File> files});
}

/// @nodoc
class __$AddEateryCopyWithImpl<$Res> extends _$ManagementEventCopyWithImpl<$Res>
    implements _$AddEateryCopyWith<$Res> {
  __$AddEateryCopyWithImpl(_AddEatery _value, $Res Function(_AddEatery) _then)
      : super(_value, (v) => _then(v as _AddEatery));

  @override
  _AddEatery get _value => super._value as _AddEatery;

  @override
  $Res call({
    Object? eateryModel = freezed,
    Object? files = freezed,
  }) {
    return _then(_AddEatery(
      eateryModel == freezed
          ? _value.eateryModel
          : eateryModel // ignore: cast_nullable_to_non_nullable
              as EateryModel,
      files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$_AddEatery implements _AddEatery {
  const _$_AddEatery(this.eateryModel, this.files);

  @override
  final EateryModel eateryModel;
  @override
  final List<File> files;

  @override
  String toString() {
    return 'ManagementEvent.addEatery(eateryModel: $eateryModel, files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddEatery &&
            (identical(other.eateryModel, eateryModel) ||
                const DeepCollectionEquality()
                    .equals(other.eateryModel, eateryModel)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(eateryModel) ^
      const DeepCollectionEquality().hash(files);

  @JsonKey(ignore: true)
  @override
  _$AddEateryCopyWith<_AddEatery> get copyWith =>
      __$AddEateryCopyWithImpl<_AddEatery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getEateries,
    required TResult Function(int id) getEatery,
    required TResult Function(EateryModel eateryModel, List<File> files)
        addEatery,
  }) {
    return addEatery(eateryModel, files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getEateries,
    TResult Function(int id)? getEatery,
    TResult Function(EateryModel eateryModel, List<File> files)? addEatery,
    required TResult orElse(),
  }) {
    if (addEatery != null) {
      return addEatery(eateryModel, files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetEateries value) getEateries,
    required TResult Function(_GetEatery value) getEatery,
    required TResult Function(_AddEatery value) addEatery,
  }) {
    return addEatery(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetEateries value)? getEateries,
    TResult Function(_GetEatery value)? getEatery,
    TResult Function(_AddEatery value)? addEatery,
    required TResult orElse(),
  }) {
    if (addEatery != null) {
      return addEatery(this);
    }
    return orElse();
  }
}

abstract class _AddEatery implements ManagementEvent {
  const factory _AddEatery(EateryModel eateryModel, List<File> files) =
      _$_AddEatery;

  EateryModel get eateryModel => throw _privateConstructorUsedError;
  List<File> get files => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddEateryCopyWith<_AddEatery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ManagementStateTearOff {
  const _$ManagementStateTearOff();

  _ManagementState call(
      {required ManagementStateType type,
      List<EateryModel>? eateries,
      List<UserModel>? users}) {
    return _ManagementState(
      type: type,
      eateries: eateries,
      users: users,
    );
  }
}

/// @nodoc
const $ManagementState = _$ManagementStateTearOff();

/// @nodoc
mixin _$ManagementState {
  ManagementStateType get type => throw _privateConstructorUsedError;
  List<EateryModel>? get eateries => throw _privateConstructorUsedError;
  List<UserModel>? get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagementStateCopyWith<ManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementStateCopyWith<$Res> {
  factory $ManagementStateCopyWith(
          ManagementState value, $Res Function(ManagementState) then) =
      _$ManagementStateCopyWithImpl<$Res>;
  $Res call(
      {ManagementStateType type,
      List<EateryModel>? eateries,
      List<UserModel>? users});

  $ManagementStateTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$ManagementStateCopyWithImpl<$Res>
    implements $ManagementStateCopyWith<$Res> {
  _$ManagementStateCopyWithImpl(this._value, this._then);

  final ManagementState _value;
  // ignore: unused_field
  final $Res Function(ManagementState) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? eateries = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ManagementStateType,
      eateries: eateries == freezed
          ? _value.eateries
          : eateries // ignore: cast_nullable_to_non_nullable
              as List<EateryModel>?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ));
  }

  @override
  $ManagementStateTypeCopyWith<$Res> get type {
    return $ManagementStateTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
abstract class _$ManagementStateCopyWith<$Res>
    implements $ManagementStateCopyWith<$Res> {
  factory _$ManagementStateCopyWith(
          _ManagementState value, $Res Function(_ManagementState) then) =
      __$ManagementStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ManagementStateType type,
      List<EateryModel>? eateries,
      List<UserModel>? users});

  @override
  $ManagementStateTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$ManagementStateCopyWithImpl<$Res>
    extends _$ManagementStateCopyWithImpl<$Res>
    implements _$ManagementStateCopyWith<$Res> {
  __$ManagementStateCopyWithImpl(
      _ManagementState _value, $Res Function(_ManagementState) _then)
      : super(_value, (v) => _then(v as _ManagementState));

  @override
  _ManagementState get _value => super._value as _ManagementState;

  @override
  $Res call({
    Object? type = freezed,
    Object? eateries = freezed,
    Object? users = freezed,
  }) {
    return _then(_ManagementState(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ManagementStateType,
      eateries: eateries == freezed
          ? _value.eateries
          : eateries // ignore: cast_nullable_to_non_nullable
              as List<EateryModel>?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ));
  }
}

/// @nodoc

class _$_ManagementState implements _ManagementState {
  const _$_ManagementState({required this.type, this.eateries, this.users});

  @override
  final ManagementStateType type;
  @override
  final List<EateryModel>? eateries;
  @override
  final List<UserModel>? users;

  @override
  String toString() {
    return 'ManagementState(type: $type, eateries: $eateries, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ManagementState &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.eateries, eateries) ||
                const DeepCollectionEquality()
                    .equals(other.eateries, eateries)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(eateries) ^
      const DeepCollectionEquality().hash(users);

  @JsonKey(ignore: true)
  @override
  _$ManagementStateCopyWith<_ManagementState> get copyWith =>
      __$ManagementStateCopyWithImpl<_ManagementState>(this, _$identity);
}

abstract class _ManagementState implements ManagementState {
  const factory _ManagementState(
      {required ManagementStateType type,
      List<EateryModel>? eateries,
      List<UserModel>? users}) = _$_ManagementState;

  @override
  ManagementStateType get type => throw _privateConstructorUsedError;
  @override
  List<EateryModel>? get eateries => throw _privateConstructorUsedError;
  @override
  List<UserModel>? get users => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ManagementStateCopyWith<_ManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ManagementStateTypeTearOff {
  const _$ManagementStateTypeTearOff();

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
}

/// @nodoc
const $ManagementStateType = _$ManagementStateTypeTearOff();

/// @nodoc
mixin _$ManagementStateType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingInProgress,
    required TResult Function() loadingSuccess,
    required TResult Function(AppFailure failure) loadingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingInProgress,
    TResult Function()? loadingSuccess,
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
abstract class $ManagementStateTypeCopyWith<$Res> {
  factory $ManagementStateTypeCopyWith(
          ManagementStateType value, $Res Function(ManagementStateType) then) =
      _$ManagementStateTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$ManagementStateTypeCopyWithImpl<$Res>
    implements $ManagementStateTypeCopyWith<$Res> {
  _$ManagementStateTypeCopyWithImpl(this._value, this._then);

  final ManagementStateType _value;
  // ignore: unused_field
  final $Res Function(ManagementStateType) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ManagementStateTypeCopyWithImpl<$Res>
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
    return 'ManagementStateType.initial()';
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

abstract class _Initial implements ManagementStateType {
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
    extends _$ManagementStateTypeCopyWithImpl<$Res>
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
    return 'ManagementStateType.loadingInProgress()';
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

abstract class _LoadingInProgress implements ManagementStateType {
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
    extends _$ManagementStateTypeCopyWithImpl<$Res>
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
    return 'ManagementStateType.loadingSuccess()';
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

abstract class _LoadingSuccess implements ManagementStateType {
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
    extends _$ManagementStateTypeCopyWithImpl<$Res>
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
    return 'ManagementStateType.loadingFailed(failure: $failure)';
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

abstract class _LoadingFailed implements ManagementStateType {
  const factory _LoadingFailed(AppFailure failure) = _$_LoadingFailed;

  AppFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
