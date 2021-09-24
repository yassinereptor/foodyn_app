import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/services/graphql_service.dart';
import '../../../queries/user_query.dart';
import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';

abstract class IAuthRemoteDataSource {
  /// Calls the https://preprod.men.gov.ma/identity/GetToken endpoint when dev envirenment.
  ///
  /// Throws a [ServerExeption] for all error codes.

  Future<AuthResponseModel> login(UserModel user);
  Future<AuthResponseModel> register(UserModel user);
  Future<AuthResponseModel> forgetPassword(UserModel user);
  Future<UserModel?> getUser();
  Future<bool?> resendConfirmationEmail(String email);
}

@Injectable(as: IAuthRemoteDataSource)
class AuthRemoteDataSource
    implements IAuthRemoteDataSource {
  final Dio _dio;
  final GraphQLService _graphQLService;

  AuthRemoteDataSource(
    this._dio,
    this._graphQLService,
    );

  @override
  Future<AuthResponseModel> login(UserModel user) async {
    try {
      final response = await _dio.post(
        dotenv.env["SERVER_AUTH_LOGIN_LINK"]!,
        data: {
          "email": user.email,
          "password": user.password,
          "type": int.parse(dotenv.env["SERVER_AUTH_TYPE"].toString())
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }

  @override
  Future<AuthResponseModel> register(UserModel user) async {
    try {
      final response = await _dio.post(
        dotenv.env["SERVER_AUTH_REGISTER_LINK"]!,
        data: {
          "email": user.email,
          "password": user.password,
          "type": int.parse(dotenv.env["SERVER_AUTH_TYPE"].toString())
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }

  @override
  Future<AuthResponseModel> forgetPassword(UserModel user) async {
    try {
      final response = await _dio.post(
        dotenv.env["SERVER_AUTH_FORGETPASSWORD_LINK"]!,
        data: {
          "email": user.email,
          "type": int.parse(dotenv.env["SERVER_AUTH_TYPE"].toString())
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }


  @override
  Future<UserModel?> getUser() async {
    final response = await _graphQLService.query(UserQuery.getCurrentUserQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    UserModel user = UserModel.fromJson(result["currentUser"]);
    return user;
  }


  @override
  Future<bool?> resendConfirmationEmail(String email) async {
    final response = await _graphQLService.mutation(UserQuery.resendConfirmationEmailMutation, variables: {
      "email": email,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    return result["resendConfirmationEmail"];
  }

}
