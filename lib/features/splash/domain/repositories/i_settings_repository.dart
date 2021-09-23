import 'package:dartz/dartz.dart';
import 'package:foodyn_rest/core/data/models/record_model.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';

abstract class ISettingsRepository {
  /// load Settings
  Future<Either<AuthFailure?, RecordModel>> loadSettings();
}
