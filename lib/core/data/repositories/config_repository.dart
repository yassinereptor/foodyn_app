import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_eatery/core/data/models/eatery_type_model.dart';
import 'package:foodyn_eatery/core/data/models/location_model.dart';
import 'package:foodyn_eatery/core/enums/config.type.dart';
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
    try {
      final response = await _configLocalDataSource.getRecord();
      return Right(response);
    } catch (e) {
      return Left(AppFailure.storage());
    }
  }

  @override
  Future<Either<AppFailure?, RecordModel?>> getRemoteRecord() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getRemoteRecord();
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
      final response = await _configRemoteDataSource.setRemoteRecord(record);
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
  Future<Either<AppFailure?, List<PaymentModel>?>> getRemotePayments() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getRemotePayments();
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
  Future<Either<AppFailure?, List<PaymentModel>?>> getLocalPayments() async {
    try {
      final response = await _configLocalDataSource.getLocalPayments();
      return Right(response);
    } catch (e) {
      return Left(AppFailure.storage());
    }
  }


  @override
  Future<Either<AppFailure?, bool>> setLocalPayments(List<PaymentModel>? resources) async {
    final response = await _configLocalDataSource.setLocalPayments(resources!);
    if (!response)
      return Left(AppFailure.storage());
    return Right(response);
  }


  @override
  Future<Either<AppFailure?, List<PlanModel>?>> getRemotePlans() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getRemotePlans();
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
  Future<Either<AppFailure?, List<PlanModel>?>> getLocalPlans() async {
    try {
      final response = await _configLocalDataSource.getLocalPlans();
      return Right(response);
    } catch (e) {
      return Left(AppFailure.storage());
    }
  }
  
  @override
  Future<Either<AppFailure?, bool>> setLocalPlans(List<PlanModel>? resources) async {
    final response = await _configLocalDataSource.setLocalPlans(resources!);
    if (!response)
      return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure?, DateTime?>> getLastRemoteConfig(ConfigType type) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getLastRemoteConfig(type);
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
  Future<Either<AppFailure?, DateTime?>> getLastLocalConfig(ConfigType type) async {
    try {
      final response = await _configLocalDataSource.getLastLocalConfig(type);
      return Right(response);
    } catch (e){
      return Left(AppFailure.storage());
    }
  }

  @override
  Future<Either<AppFailure?, bool>> setLastLocalConfig(DateTime date, ConfigType type) async {
    final response = await _configLocalDataSource.setLastLocalConfig(date, type);
    if (!response)
      return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure?, List<LocationModel>?>> getRemoteLocationResource() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getRemoteLocationResource();
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
  Future<Either<AppFailure?, List<LocationModel>?>> getLocalLocationResource() async {
    try {
      final response = await _configLocalDataSource.getLocalLocationResource();
      return Right(response);
    } catch (e) {
      return Left(AppFailure.storage());
    }
  }

  @override
  Future<Either<AppFailure?, bool>> setLocalLocationResource(List<LocationModel> resources) async {
    final response = await _configLocalDataSource.setLocalLocationResource(resources);
    if (!response)
      return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure?, List<EateryTypeModel>?>> getLocalEateryTypes() async {
    try {
      final response = await _configLocalDataSource.getLocalEateryTypes();
      return Right(response);
    } catch (e) {
      return Left(AppFailure.storage());
    }
  }

  @override
  Future<Either<AppFailure?, List<EateryTypeModel>?>> getRemoteEateryTypes() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected == false) return Left(AppFailure.network());
      final response = await _configRemoteDataSource.getRemoteEateryTypes();
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
  Future<Either<AppFailure?, bool>> setLocalEateryTypes(List<EateryTypeModel>? resources) async {
    final response = await _configLocalDataSource.setLocalEateryTypes(resources!);
    if (!response)
      return Left(AppFailure.storage());
    return Right(response);
  }

  @override
  Future<Either<AppFailure?, List<EateryTypeModel>?>> getLocalRules() {
    // TODO: implement getLocalRules
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure?, List<EateryTypeModel>?>> getRemoteRules() {
    // TODO: implement getRemoteRules
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure?, bool>> setLocalRules(List<EateryTypeModel>? resources) {
    // TODO: implement setLocalRules
    throw UnimplementedError();
  }

  

}
