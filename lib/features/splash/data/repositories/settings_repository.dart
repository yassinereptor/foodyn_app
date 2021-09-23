import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_rest/core/data/models/record_model.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';
import '../datasources/settings_data_source.dart';
import '../../domain/repositories/i_settings_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';

@Injectable(as: ISettingsRepository)
class SettingsRepository implements ISettingsRepository {
  final ISettingsLocalDataSource settingsDataSource;

  SettingsRepository(this.settingsDataSource);

  @override
  Future<Either<AuthFailure?, RecordModel>> loadSettings() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await settingsDataSource.loadSettings();
        return response;
      }
      else
        return Left(AuthFailure.network());
    } on SocketException catch (_) {
      return Left(AuthFailure.network());
    } on CacheExeption {
      return Left(AuthFailure.storage());
    }  
  }
}
