import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'app_failure.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const factory AppFailure.network() = _Network;
  const factory AppFailure.server({
    String? message,
    int? status,
  }) = _Server;
  const factory AppFailure.graphQlserver({
    @Default([]) List<GraphQLError> graphqlErrors,
    LinkException? linkException
  }) = _GraphQlServer;

  const factory AppFailure.storage() = _Storage;
  const factory AppFailure.local() = _Local;
  const factory AppFailure.expiredJwt() = _ExpiredCode;
  const factory AppFailure.unauthorized() = _Unauthorized;
}
