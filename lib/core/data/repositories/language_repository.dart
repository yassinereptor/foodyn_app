import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_language_repository.dart';
import '../datasources/local/language_local_data_source.dart';

@Injectable(as: ILanguageRepository)
class LanguageRepository implements ILanguageRepository {
  final ILanguageLocalDataSource _languageLocalDataSource;

  LanguageRepository(this._languageLocalDataSource);

  @override
  Future<Locale?> getLanguage() async {
    final response = await _languageLocalDataSource.getLanguage();
    return response;
  }

  @override
  Future<Either<AppFailure, Locale>> setLanguage(String lang) async {
    try {
      final response = await _languageLocalDataSource.setLanguage(lang);
      return Right(response);
    } on CacheExeption {
      return Left(AppFailure.storage());
    }
  }
}
