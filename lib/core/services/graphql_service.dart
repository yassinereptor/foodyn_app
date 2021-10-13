import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../error/exeptions.dart';

@lazySingleton
class GraphQLService {
  late HttpLink _httpLink;
  Link? _link;
  String? _token;

  GraphQLService() {
    _httpLink = HttpLink(dotenv.env["SERVER_LINK"]! + "/graphql");
  }

  GraphQLClient get _client => _clientToQuery();

  Future<String> query(String query, {Map<String, dynamic> variables = const {}}) async {
    if (this._token != null && JwtDecoder.isExpired(this._token!)) throw JwtExpiredExeption();

    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);
    final result = await _client.query(options);

    if (result.hasException) {
      if (result.exception!.graphqlErrors.any((e) =>
          e.extensions != null &&
          e.extensions!["code"] == "AUTH_NOT_AUTHENTICATED"))
        throw JwtExpiredExeption();
      throw result.exception!;
    }
    return jsonEncode(result.data);
  }

  Future<String> mutation(String query,
      {Map<String, dynamic>? variables}) async {
    if (this._token != null &&  JwtDecoder.isExpired(this._token!)) throw JwtExpiredExeption();
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables!);

    final result = await _client.mutate(options).timeout(
      const Duration(milliseconds: 10000),
      onTimeout: () {
        throw OperationException();
      },
    );
    if (result.hasException && result.exception!.graphqlErrors.toString().contains("{statusCode: 401, message: Unauthorized}"))
      throw UnauthorizedExeption();
    if (result.hasException) throw result.exception!;
    return jsonEncode(result.data);
  }

  void setToken(String token) {
    AuthLink alink = AuthLink(getToken: () async => 'Bearer ' + token);
    this._token = token;
    this._link = alink.concat(this._httpLink);
  }

  void removeToken() {
    this._token = null;
    this._link = null;
  }

  Link? _getLink() {
    return this._link != null ? this._link : this._httpLink;
  }

  final policies = Policies(
    fetch: FetchPolicy.networkOnly,
  );

  GraphQLClient _clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: _getLink()!,
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }
}
