import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.network() = _Network;
  const factory AuthFailure.server({
    String? message,
    int? status,
  }) = _Server;
  const factory AuthFailure.graphQlserver({
    @Default([]) List<GraphQLError> graphqlErrors,
    LinkException? linkException
  }) = _GraphQlServer;

  const factory AuthFailure.storage() = _Storage;
  const factory AuthFailure.local() = _Local;
  const factory AuthFailure.expiredJwt() = _ExpiredCode;
  const factory AuthFailure.unauthorized() = _Unauthorized;
}
