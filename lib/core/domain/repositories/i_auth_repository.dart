import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_eatery/core/data/models/coupon_model.dart';
import 'package:foodyn_eatery/core/data/models/image_model.dart';
import 'package:foodyn_eatery/core/data/models/membership_model.dart';
import '../../data/models/auth_response_model.dart';
import '../../data/models/user_model.dart';

import '../entities/app_failure.dart';

abstract class IAuthRepository {

  Future<Either<AppFailure?, AuthResponseModel>> login(UserModel user);
  Future<Either<AppFailure?, AuthResponseModel>> register(UserModel user);
  Future<Either<AppFailure?, AuthResponseModel>> forgetPassword(UserModel user);
  Future<Either<AppFailure?, bool>> logout();
  Future<Either<AppFailure?, bool?>> resendConfirmationEmail(String email);
  Future<Either<AppFailure?, UserModel?>> getUser();
  Future<Either<AppFailure?, String?>> getToken();
  Future<Either<AppFailure, ImageModel?>> uploadImage(File file);
  Future<Either<AppFailure, UserModel?>> updateUser(UserModel user);
  Future<Either<AppFailure, MembershipModel?>> saveMembership(int planId, int periodId, int? couponId);
  Future<Either<AppFailure, CouponModel?>> checkCouponStatus(String code);
}
