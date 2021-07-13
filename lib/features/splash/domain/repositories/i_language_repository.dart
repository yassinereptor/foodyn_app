import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../entities/splash_failure.dart';

abstract class ILanguageRepository {
  /// get Language
  Future<Locale?> getLanguage();

  /// set Language
  Future<Either<SplashFailure, Locale>> setLanguage(String lang);
}
