import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';

abstract class ILanguageRepository {
  /// get Language
  Future<Locale?> getLanguage();

  /// set Language
  Future<Either<AuthFailure, Locale>> setLanguage(String lang);
}
