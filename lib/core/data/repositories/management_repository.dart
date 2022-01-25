import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_eatery/core/data/datasources/remote/management_remote_data_source.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/domain/repositories/i_management_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/app_failure.dart';

@Injectable(as: IManagementRepository)
class ManagementRepository implements IManagementRepository {
  final IManagementRemoteDataSource _managementRemoteDataSource;
  final INetworkInfo _networkInfo;

  ManagementRepository(
    this._managementRemoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<AppFailure, EateryModel?>> saveEatery(EateryModel eateryModel) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _managementRemoteDataSource.saveEatery(eateryModel);
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
  Future<Either<AppFailure, bool>> uploadEateryImages(List<File> imageList, int eateryId) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _managementRemoteDataSource.uploadEateryImages(imageList, eateryId);
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
  Future<Either<AppFailure, List<EateryModel>?>> getEateries() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _managementRemoteDataSource.getEateries();
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
  Future<Either<AppFailure, EateryModel?>> getEatery(int id) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _managementRemoteDataSource.getEatery(id);
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
