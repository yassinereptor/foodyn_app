import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../entities/app_failure.dart';

abstract class ILanguageRepository {
  /// get Language
  Future<Locale?> getLanguage();

  /// set Language
  Future<Either<AppFailure, Locale>> setLanguage(String lang);
}
