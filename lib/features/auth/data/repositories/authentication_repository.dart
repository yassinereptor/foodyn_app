import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_rest/core/enums/image.type.dart';
import 'package:foodyn_rest/core/models/auth_response_model.dart';
import 'package:foodyn_rest/core/models/image_model.dart';
import 'package:foodyn_rest/core/models/plan_model.dart';
import 'package:foodyn_rest/core/models/profile_model.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:foodyn_rest/core/models/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_failure.dart';
import '../../domain/repositories/i_authentication_repository.dart';
import '../datasources/authentication_local_data_source.dart';
import '../datasources/authentication_remote_data_source.dart';

@Injectable(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationRemoteDataSource remoteDataSource;
  final IAuthenticationLocalDataSource localDataSource;
  final INetworkInfo networkInfo;
  final SharedPreferences prefs;

  AuthenticationRepository(
    this.remoteDataSource,
    this.networkInfo,
    this.prefs,
    this.localDataSource,
  );

  @override
  Future<Either<AuthFailure, AuthResponseModel>> login(UserModel user) async {
    late bool failed;
    late AuthFailure failure;
    
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.login(user);
      final tokenEither = await localDataSource.saveToken(response.token!);
      tokenEither.fold((l) {
        failed = true;
        failure = l;
      }, (r) {
        failed = false;
      });
      if (failed) return Left(failure);
      final loginEither = await localDataSource.saveLogin(user.email!);
      loginEither.fold((l) {
        failed = true;
        failure = l;
      }, (r) {
        failed = false;
      });
      if (failed) return Left(failure);
      return Right(response);
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        status: e.status!,
        message: e.message!,
      ));
    }
  }

  
  @override
  Future<Either<AuthFailure, AuthResponseModel>> register(UserModel user) async {
    late bool failed;
    late AuthFailure failure;
    
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.register(user);
      final tokenEither = await localDataSource.saveToken(response.token!);
      tokenEither.fold((l) {
        failed = true;
        failure = l;
      }, (r) {
        failed = false;
      });
      if (failed) return Left(failure);
      final loginEither = await localDataSource.saveLogin(user.email!);
      loginEither.fold((l) {
        failed = true;
        failure = l;
      }, (r) {
        failed = false;
      });
      if (failed) return Left(failure);
      return Right(response);
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        status: e.status!,
        message: e.message!,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, AuthResponseModel>> forgetPassword(UserModel user) async {
    late bool failed;
    late AuthFailure failure;
    
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.forgetPassword(user);
      if (response.success == false) {
        failed = true;
        failure = AuthFailure.server();
      } else {
        failed = false;
      };
      if (failed) return Left(failure);
      return Right(response);
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        status: e.status!,
        message: e.message!,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, bool>> logout() async {
    var response = await prefs.remove("user_token");
    if (response == false) return Left(AuthFailure.storage());
    response = await prefs.remove("user_login");
    if (response == false) return Left(AuthFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AuthFailure, bool?>> resendConfirmationEmail(String email) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.resendConfirmationEmail(email);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, ImageModel?>> uploadImage(ImageType type, File file) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.uploadImage(type, file);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, UserModel?>> getUser() async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.getUser();
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, ProfileModel?>> getProfile() async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.getProfile();
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, RecordModel?>> saveRecord(RecordModel record) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.saveRecord(record);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, ProfileModel?>> saveProfile(ProfileModel profile) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.saveProfile(profile);
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }

   @override
  Future<Either<AuthFailure, List<PlanModel>?>> getPlans() async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected == false) return Left(AuthFailure.network());
      final response = await remoteDataSource.getPlans();
      return Right(response);
    } on UnauthorizedExeption {
      return Left(AuthFailure.unauthorized());
    } on JwtExpiredExeption {
      return Left(AuthFailure.expiredJwt());
    } on ServerExeption catch (e) {
      return Left(AuthFailure.server(
        message: e.message,
      ));
    } on OperationException catch (error) {
      return Left(AuthFailure.graphQlserver(
        linkException: error.linkException,
        graphqlErrors: error.graphqlErrors,
      ));
    }
  }
}
