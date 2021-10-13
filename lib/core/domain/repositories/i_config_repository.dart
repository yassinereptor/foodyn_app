import 'package:dartz/dartz.dart';
import 'package:foodyn_rest/core/data/models/eatery_type_model.dart';
import 'package:foodyn_rest/core/data/models/location_model.dart';
import 'package:foodyn_rest/core/enums/config.type.dart';
import '../../data/models/payment_model.dart';
import '../../data/models/plan_model.dart';
import '../../data/models/record_model.dart';
import '../entities/app_failure.dart';

abstract class IConfigRepository {
  Future<Either<AppFailure?, List<LocationModel>?>> getRemoteLocationResource();
  Future<Either<AppFailure?, List<LocationModel>?>> getLocalLocationResource();
  Future<Either<AppFailure?, bool>> setLocalLocationResource(List<LocationModel> resources);

  Future<Either<AppFailure?, RecordModel?>> getRemoteRecord();
  Future<Either<AppFailure?, RecordModel?>> getLocalRecord();
  Future<Either<AppFailure?, RecordModel?>> setRemoteRecord(RecordModel? record);
  Future<Either<AppFailure?, RecordModel?>> setLocalRecord(RecordModel? record);

  Future<Either<AppFailure?, List<PlanModel>?>> getLocalPlans();
  Future<Either<AppFailure?, bool>> setLocalPlans(List<PlanModel>? resources);
  Future<Either<AppFailure?, List<PlanModel>?>> getRemotePlans();

  Future<Either<AppFailure?, List<PaymentModel>?>> getLocalPayments();
  Future<Either<AppFailure?, bool>> setLocalPayments(List<PaymentModel>? resources);
  Future<Either<AppFailure?, List<PaymentModel>?>> getRemotePayments();

  Future<Either<AppFailure?, DateTime?>> getLastLocalConfig(ConfigType type);
  Future<Either<AppFailure?, bool>> setLastLocalConfig(DateTime date, ConfigType type);
  Future<Either<AppFailure?, DateTime?>> getLastRemoteConfig(ConfigType type);

  Future<Either<AppFailure?, List<EateryTypeModel>?>> getLocalEateryTypes();
  Future<Either<AppFailure?, bool>> setLocalEateryTypes(List<EateryTypeModel>? resources);
  Future<Either<AppFailure?, List<EateryTypeModel>?>> getRemoteEateryTypes();
}
