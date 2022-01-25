import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_eatery/core/data/models/coupon_model.dart';
import 'package:foodyn_eatery/core/data/models/image_model.dart';
import 'package:foodyn_eatery/core/data/models/membership_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;
  final IAuthLocalDataSource _authLocalDataSource;
  final INetworkInfo _networkInfo;
  final SharedPreferences _sharedPreferences;

  AuthRepository(
    this._authRemoteDataSource,
    this._networkInfo,
    this._sharedPreferences,
    this._authLocalDataSource,
  );

  @override
  Future<Either<AppFailure, AuthResponseModel>> login(UserModel user) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.login(user);
      final tokenEither = await _authLocalDataSource.saveToken(response.token!);
      if (!tokenEither) return Left(AppFailure.storage());
      final loginEither = await _authLocalDataSource.saveLogin(user.email!);
      if (!loginEither) return Left(AppFailure.storage());
      return Right(response);
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        status: e.status!,
        message: e.message!,
      ));
    }
  }

  
  @override
  Future<Either<AppFailure, AuthResponseModel>> register(UserModel user) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.register(user);
      final tokenEither = await _authLocalDataSource.saveToken(response.token!);
      if (!tokenEither) return Left(AppFailure.storage());
      final loginEither = await _authLocalDataSource.saveLogin(user.email!);
      if (!loginEither) return Left(AppFailure.storage());
      return Right(response);
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        status: e.status!,
        message: e.message!,
      ));
    }
  }

  @override
  Future<Either<AppFailure, AuthResponseModel>> forgetPassword(UserModel user) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.forgetPassword(user);
      if (!(response.success!)) return Left(AppFailure.server());
      return Right(response);
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        status: e.status!,
        message: e.message!,
      ));
    }
  }

  @override
  Future<Either<AppFailure, bool>> logout() async {
    var response = await _sharedPreferences.remove("user_token");
    if (response == false) return Left(AppFailure.storage());
    response = await _sharedPreferences.remove("user_login");
    if (response == false) return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure, bool?>> resendConfirmationEmail(String email) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.resendConfirmationEmail(email);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AppFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AppFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AppFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AppFailure, UserModel?>> getUser() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.getUser();
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AppFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AppFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AppFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AppFailure?, String?>> getToken() async {
    final response = await _authLocalDataSource.getToken();
    if (response == null)
      return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure, ImageModel?>> uploadImage(File file) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.uploadImage(file);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AppFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AppFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AppFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AppFailure, UserModel?>> updateUser(UserModel profile) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.updateUser(profile);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AppFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AppFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AppFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AppFailure, CouponModel?>> checkCouponStatus(String code) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.checkCouponStatus(code);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AppFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AppFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AppFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AppFailure, MembershipModel?>> saveMembership(int planId, int periodId, int? couponId) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _authRemoteDataSource.saveMembership(planId, periodId, couponId);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AppFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AppFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AppFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AppFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

}
