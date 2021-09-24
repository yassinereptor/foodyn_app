import 'dart:io';

import 'package:dartz/dartz.dart';
import '../datasources/local/config_local_data_source.dart';
import '../datasources/remote/config_remote_data_source.dart';
import '../models/plan_model.dart';
import '../models/payment_model.dart';
import '../models/record_model.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_config_repository.dart';
import '../../network/network_info.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';

@Injectable(as: IConfigRepository)
class ConfigRepository implements IConfigRepository {
  final IConfigLocalDataSource _configLocalDataSource;
  final IConfigRemoteDataSource _configRemoteDataSource;
  final INetworkInfo _networkInfo;

  ConfigRepository(
    this._configLocalDataSource,
    this._configRemoteDataSource,
    this._networkInfo
    );

  @override
  Future<Either<AppFailure?, RecordModel?>> getLocalRecord() async {
    final response = await _configLocalDataSource.getRecord();
    if (response == null)
      return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure?, RecordModel?>> getRemoteRecord() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getRemote();
      return Right(response);
    } on SocketException catch (_) {
      return Left(AppFailure.network());
    } on CacheExeption {
      return Left(AppFailure.storage());
    }  
  }

  @override
  Future<Either<AppFailure?, RecordModel?>> setLocalRecord(RecordModel? record) async {
    final response = await _configLocalDataSource.setRecord(record);
    if (!response)
      return Left(AppFailure.storage());
    return Right(record);
  }

  @override
  Future<Either<AppFailure?, RecordModel?>> setRemoteRecord(RecordModel? record) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.setRemote(record);
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
  Future<Either<AppFailure?, List<PaymentModel>?>> getPayments() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getPayments();
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
  Future<Either<AppFailure?, List<PlanModel>?>> getPlans() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getPlans();
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
