import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/data/models/membership_model.dart';
import '../../data/models/coupon_model.dart';
import '../../data/models/image_model.dart';
import '../../enums/image.type.dart';

import '../entities/app_failure.dart';

abstract class IManagementRepository {
  Future<Either<AppFailure, bool>> uploadEateryImages(List<File> imageList, int eateryId);
  Future<Either<AppFailure, EateryModel?>> saveEatery(EateryModel eateryModel);
  Future<Either<AppFailure, List<EateryModel>?>> getEateries();
  Future<Either<AppFailure, EateryModel?>> getEatery(int id);
}
