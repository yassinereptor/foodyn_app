import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';


abstract class ISettingsRepository {
  /// load Settings
  Future<Either<AuthFailure?, RecordModel>> loadSettings();
}
