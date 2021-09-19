import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exeptions.dart';
import '../../domain/repositories/i_language_repository.dart';
import '../datasources/language_local_data_source.dart';

@Injectable(as: ILanguageRepository)
class LanguageRepository implements ILanguageRepository {
  final ILanguageLocalDataSource localeDataSource;

  LanguageRepository(this.localeDataSource);

  @override
  Future<Locale?> getLanguage() async {
    final response = await localeDataSource.getLanguage();
    return response;
  }

  @override
  Future<Either<AuthFailure, Locale>> setLanguage(String lang) async {
    try {
      final response = await localeDataSource.setLanguage(lang);
      return Right(response);
    } on CacheExeption {
      return Left(AuthFailure.storage());
    }
  }
}
