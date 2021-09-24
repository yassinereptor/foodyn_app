// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppFailureTearOff {
  const _$AppFailureTearOff();

  _Network network() {
    return const _Network();
  }

  _Server server({String? message, int? status}) {
    return _Server(
      message: message,
      status: status,
    );
  }

  _GraphQlServer graphQlserver(
      {List<GraphQLError> graphqlErrors = const [],
      LinkException? linkException}) {
    return _GraphQlServer(
      graphqlErrors: graphqlErrors,
      linkException: linkException,
    );
  }

  _Storage storage() {
    return const _Storage();
  }

  _Local local() {
    return const _Local();
  }

  _ExpiredCode expiredJwt() {
    return const _ExpiredCode();
  }

  _Unauthorized unauthorized() {
    return const _Unauthorized();
  }
}

/// @nodoc
const $AppFailure = _$AppFailureTearOff();

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res> implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  final AppFailure _value;
  // ignore: unused_field
  final $Res Function(AppFailure) _then;
}

/// @nodoc
abstract class _$NetworkCopyWith<$Res> {
  factory _$NetworkCopyWith(_Network value, $Res Function(_Network) then) =
      __$NetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$NetworkCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
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
    return 'AppFailure.network()';
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
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
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
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements AppFailure {
  const factory _Network() = _$_Network;
}

/// @nodoc
abstract class _$ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) then) =
      __$ServerCopyWithImpl<$Res>;
  $Res call({String? message, int? status});
}

/// @nodoc
class __$ServerCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
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
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Server implements _Server {
  const _$_Server({this.message, this.status});

  @override
  final String? message;
  @override
  final int? status;

  @override
  String toString() {
    return 'AppFailure.server(message: $message, status: $status)';
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
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return server(message, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
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
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server implements AppFailure {
  const factory _Server({String? message, int? status}) = _$_Server;

  String? get message => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ServerCopyWith<_Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GraphQlServerCopyWith<$Res> {
  factory _$GraphQlServerCopyWith(
          _GraphQlServer value, $Res Function(_GraphQlServer) then) =
      __$GraphQlServerCopyWithImpl<$Res>;
  $Res call({List<GraphQLError> graphqlErrors, LinkException? linkException});
}

/// @nodoc
class __$GraphQlServerCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
    implements _$GraphQlServerCopyWith<$Res> {
  __$GraphQlServerCopyWithImpl(
      _GraphQlServer _value, $Res Function(_GraphQlServer) _then)
      : super(_value, (v) => _then(v as _GraphQlServer));

  @override
  _GraphQlServer get _value => super._value as _GraphQlServer;

  @override
  $Res call({
    Object? graphqlErrors = freezed,
    Object? linkException = freezed,
  }) {
    return _then(_GraphQlServer(
      graphqlErrors: graphqlErrors == freezed
          ? _value.graphqlErrors
          : graphqlErrors // ignore: cast_nullable_to_non_nullable
              as List<GraphQLError>,
      linkException: linkException == freezed
          ? _value.linkException
          : linkException // ignore: cast_nullable_to_non_nullable
              as LinkException?,
    ));
  }
}

/// @nodoc

class _$_GraphQlServer implements _GraphQlServer {
  const _$_GraphQlServer({this.graphqlErrors = const [], this.linkException});

  @JsonKey(defaultValue: const [])
  @override
  final List<GraphQLError> graphqlErrors;
  @override
  final LinkException? linkException;

  @override
  String toString() {
    return 'AppFailure.graphQlserver(graphqlErrors: $graphqlErrors, linkException: $linkException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GraphQlServer &&
            (identical(other.graphqlErrors, graphqlErrors) ||
                const DeepCollectionEquality()
                    .equals(other.graphqlErrors, graphqlErrors)) &&
            (identical(other.linkException, linkException) ||
                const DeepCollectionEquality()
                    .equals(other.linkException, linkException)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(graphqlErrors) ^
      const DeepCollectionEquality().hash(linkException);

  @JsonKey(ignore: true)
  @override
  _$GraphQlServerCopyWith<_GraphQlServer> get copyWith =>
      __$GraphQlServerCopyWithImpl<_GraphQlServer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return graphQlserver(graphqlErrors, linkException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (graphQlserver != null) {
      return graphQlserver(graphqlErrors, linkException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return graphQlserver(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (graphQlserver != null) {
      return graphQlserver(this);
    }
    return orElse();
  }
}

abstract class _GraphQlServer implements AppFailure {
  const factory _GraphQlServer(
      {List<GraphQLError> graphqlErrors,
      LinkException? linkException}) = _$_GraphQlServer;

  List<GraphQLError> get graphqlErrors => throw _privateConstructorUsedError;
  LinkException? get linkException => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GraphQlServerCopyWith<_GraphQlServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StorageCopyWith<$Res> {
  factory _$StorageCopyWith(_Storage value, $Res Function(_Storage) then) =
      __$StorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$StorageCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
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
    return 'AppFailure.storage()';
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
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return storage();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
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
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class _Storage implements AppFailure {
  const factory _Storage() = _$_Storage;
}

/// @nodoc
abstract class _$LocalCopyWith<$Res> {
  factory _$LocalCopyWith(_Local value, $Res Function(_Local) then) =
      __$LocalCopyWithImpl<$Res>;
}

/// @nodoc
class __$LocalCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
    implements _$LocalCopyWith<$Res> {
  __$LocalCopyWithImpl(_Local _value, $Res Function(_Local) _then)
      : super(_value, (v) => _then(v as _Local));

  @override
  _Local get _value => super._value as _Local;
}

/// @nodoc

class _$_Local implements _Local {
  const _$_Local();

  @override
  String toString() {
    return 'AppFailure.local()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Local);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return local();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class _Local implements AppFailure {
  const factory _Local() = _$_Local;
}

/// @nodoc
abstract class _$ExpiredCodeCopyWith<$Res> {
  factory _$ExpiredCodeCopyWith(
          _ExpiredCode value, $Res Function(_ExpiredCode) then) =
      __$ExpiredCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$ExpiredCodeCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
    implements _$ExpiredCodeCopyWith<$Res> {
  __$ExpiredCodeCopyWithImpl(
      _ExpiredCode _value, $Res Function(_ExpiredCode) _then)
      : super(_value, (v) => _then(v as _ExpiredCode));

  @override
  _ExpiredCode get _value => super._value as _ExpiredCode;
}

/// @nodoc

class _$_ExpiredCode implements _ExpiredCode {
  const _$_ExpiredCode();

  @override
  String toString() {
    return 'AppFailure.expiredJwt()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ExpiredCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return expiredJwt();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (expiredJwt != null) {
      return expiredJwt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return expiredJwt(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (expiredJwt != null) {
      return expiredJwt(this);
    }
    return orElse();
  }
}

abstract class _ExpiredCode implements AppFailure {
  const factory _ExpiredCode() = _$_ExpiredCode;
}

/// @nodoc
abstract class _$UnauthorizedCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(
          _Unauthorized value, $Res Function(_Unauthorized) then) =
      __$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(
      _Unauthorized _value, $Res Function(_Unauthorized) _then)
      : super(_value, (v) => _then(v as _Unauthorized));

  @override
  _Unauthorized get _value => super._value as _Unauthorized;
}

/// @nodoc

class _$_Unauthorized implements _Unauthorized {
  const _$_Unauthorized();

  @override
  String toString() {
    return 'AppFailure.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String? message, int? status) server,
    required TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)
        graphQlserver,
    required TResult Function() storage,
    required TResult Function() local,
    required TResult Function() expiredJwt,
    required TResult Function() unauthorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String? message, int? status)? server,
    TResult Function(
            List<GraphQLError> graphqlErrors, LinkException? linkException)?
        graphQlserver,
    TResult Function()? storage,
    TResult Function()? local,
    TResult Function()? expiredJwt,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Server value) server,
    required TResult Function(_GraphQlServer value) graphQlserver,
    required TResult Function(_Storage value) storage,
    required TResult Function(_Local value) local,
    required TResult Function(_ExpiredCode value) expiredJwt,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Server value)? server,
    TResult Function(_GraphQlServer value)? graphQlserver,
    TResult Function(_Storage value)? storage,
    TResult Function(_Local value)? local,
    TResult Function(_ExpiredCode value)? expiredJwt,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements AppFailure {
  const factory _Unauthorized() = _$_Unauthorized;
}
