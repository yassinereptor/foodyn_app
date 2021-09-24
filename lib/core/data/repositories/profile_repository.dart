import 'dart:io';

import 'package:dartz/dartz.dart';
import '../datasources/remote/profile_remote_data_source.dart';
import '../models/coupon_model.dart';
import '../models/image_model.dart';
import '../models/profile_model.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../enums/image.type.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/app_failure.dart';

@Injectable(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  final IProfileRemoteDataSource _profileRemoteDataSource;
  final INetworkInfo _networkInfo;

  ProfileRepository(
    this._profileRemoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<AppFailure, ImageModel?>> uploadImage(ImageType type, File file) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _profileRemoteDataSource.uploadImage(type, file);
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
  Future<Either<AppFailure, ProfileModel?>> getProfile() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _profileRemoteDataSource.getProfile();
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
  Future<Either<AppFailure, ProfileModel?>> saveProfile(ProfileModel profile) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _profileRemoteDataSource.saveProfile(profile);
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
      final response = await _profileRemoteDataSource.checkCouponStatus(code);
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
