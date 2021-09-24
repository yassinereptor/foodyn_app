import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../data/models/coupon_model.dart';
import '../../data/models/image_model.dart';
import '../../data/models/profile_model.dart';
import '../../enums/image.type.dart';

import '../entities/app_failure.dart';

abstract class IProfileRepository {
  Future<Either<AppFailure, ImageModel?>> uploadImage(ImageType type, File file);
  Future<Either<AppFailure, ProfileModel?>> getProfile();
  Future<Either<AppFailure, ProfileModel?>> saveProfile(ProfileModel profile);
  Future<Either<AppFailure, CouponModel?>> checkCouponStatus(String code);
}
