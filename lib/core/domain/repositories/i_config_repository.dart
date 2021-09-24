import 'package:dartz/dartz.dart';
import '../../data/models/payment_model.dart';
import '../../data/models/plan_model.dart';
import '../../data/models/record_model.dart';
import '../entities/app_failure.dart';

abstract class IConfigRepository {
  Future<Either<AppFailure?, RecordModel?>> getRemoteRecord();
  Future<Either<AppFailure?, RecordModel?>> getLocalRecord();
  Future<Either<AppFailure?, RecordModel?>> setRemoteRecord(RecordModel? record);
  Future<Either<AppFailure?, RecordModel?>> setLocalRecord(RecordModel? record);
  Future<Either<AppFailure?, List<PlanModel>?>> getPlans();
  Future<Either<AppFailure?, List<PaymentModel>?>> getPayments();
}
