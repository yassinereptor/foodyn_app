// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'splash_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SplashFailureTearOff {
  const _$SplashFailureTearOff();

  _Network network() {
    return const _Network();
  }

  _Server server({required String message, required int status}) {
    return _Server(
      message: message,
      status: status,
    );
  }

  _Storage storage() {
    return const _Storage();
  }
}

/// @nodoc
const $SplashFailure = _$SplashFailureTearOff();

/// @nodoc
mixin _$SplashFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message, int status) server,
    required TResult Function() storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message, int status)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_Storage value) storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashFailureCopyWith<$Res> {
  factory $SplashFailureCopyWith(
          SplashFailure value, $Res Function(SplashFailure) then) =
      _$SplashFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashFailureCopyWithImpl<$Res>
    implements $SplashFailureCopyWith<$Res> {
  _$SplashFailureCopyWithImpl(this._value, this._then);

  final SplashFailure _value;
  // ignore: unused_field
  final $Res Function(SplashFailure) _then;
}

/// @nodoc
abstract class _$NetworkCopyWith<$Res> {
  factory _$NetworkCopyWith(_Network value, $Res Function(_Network) then) =
      __$NetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$NetworkCopyWithImpl<$Res> extends _$SplashFailureCopyWithImpl<$Res>
    implements _$NetworkCopyWith<$Res> {
  __$NetworkCopyWithImpl(_Network _value, $Res Function(_Network) _then)
      : super(_value, (v) => _then(v as _Network));

  @override
  _Network get _value => super._value as _Network;
}

/// @nodoc
class _$_Network implements _Network {
  const _$_Network();

  @override
  String toString() {
    return 'SplashFailure.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Network);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message, int status) server,
    required TResult Function() storage,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message, int status)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_Storage value) storage,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements SplashFailure {
  const factory _Network() = _$_Network;
}

/// @nodoc
abstract class _$ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) then) =
      __$ServerCopyWithImpl<$Res>;
  $Res call({String message, int status});
}

/// @nodoc
class __$ServerCopyWithImpl<$Res> extends _$SplashFailureCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(_Server _value, $Res Function(_Server) _then)
      : super(_value, (v) => _then(v as _Server));

  @override
  _Server get _value => super._value as _Server;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_Server(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_Server implements _Server {
  const _$_Server({required this.message, required this.status});

  @override
  final String message;
  @override
  final int status;

  @override
  String toString() {
    return 'SplashFailure.server(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Server &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$ServerCopyWith<_Server> get copyWith =>
      __$ServerCopyWithImpl<_Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message, int status) server,
    required TResult Function() storage,
  }) {
    return server(message, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message, int status)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_Storage value) storage,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server implements SplashFailure {
  const factory _Server({required String message, required int status}) =
      _$_Server;

  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ServerCopyWith<_Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StorageCopyWith<$Res> {
  factory _$StorageCopyWith(_Storage value, $Res Function(_Storage) then) =
      __$StorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$StorageCopyWithImpl<$Res> extends _$SplashFailureCopyWithImpl<$Res>
    implements _$StorageCopyWith<$Res> {
  __$StorageCopyWithImpl(_Storage _value, $Res Function(_Storage) _then)
      : super(_value, (v) => _then(v as _Storage));

  @override
  _Storage get _value => super._value as _Storage;
}

/// @nodoc
class _$_Storage implements _Storage {
  const _$_Storage();

  @override
  String toString() {
    return 'SplashFailure.storage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Storage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message, int status) server,
    required TResult Function() storage,
  }) {
    return storage();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message, int status)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_Storage value) storage,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class _Storage implements SplashFailure {
  const factory _Storage() = _$_Storage;
}
