import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:foodyn_rest/core/models/auth_response_model.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/services/graphql_service.dart';

abstract class IAuthenticationLocalDataSource {
  /// Calls the https://preprod.men.gov.ma/identity/GetToken endpoint when dev envirenment.
  ///
  /// Throws a [ServerExeption] for all error codes.

  Future<AuthResponseModel?> getToken();
  Future<RecordModel?> getRecord();
  Future<Either<AuthFailure, bool>> saveToken(String token);
  Future<Either<AuthFailure, bool>> saveLogin(String login);
  Future<Either<AuthFailure, bool>> saveRecord(RecordModel record);
}

@Injectable(as: IAuthenticationLocalDataSource)
class AuthenticationLocalDataSource implements IAuthenticationLocalDataSource {
  final GraphQLService graphQL;
  final SharedPreferences prefs;

  AuthenticationLocalDataSource(this.graphQL, this.prefs);

  @override
  Future<AuthResponseModel?> getToken() async {
    final token = prefs.getString("user_token");
    if (token != null) {
      graphQL.setToken(token);
      return AuthResponseModel(token: token);
    }
    return null;
  }

  @override
  Future<RecordModel?> getRecord() async {
    final record = prefs.getString("user_record");
    if (record != null) {
      final result = jsonDecode(record);
      return RecordModel.fromJson(result);
    }
    return null;
  }
  
  @override
  Future<Either<AuthFailure, bool>> saveToken(String token) async {
    final response = await prefs.setString("user_token", token);
    if (response == true) return Right(response);
    return Left(AuthFailure.storage());
  }

  @override
  Future<Either<AuthFailure, bool>> saveLogin(String login) async {
    final response = await prefs.setString("user_login", login);
    if (response == true) return Right(response);
    return Left(AuthFailure.storage());
  }

   @override
  Future<Either<AuthFailure, bool>> saveRecord(RecordModel record) async {
    final response = await prefs.setString("user_record", jsonEncode(record));
    if (response == true) return Right(response);
    return Left(AuthFailure.storage());
  }

}
