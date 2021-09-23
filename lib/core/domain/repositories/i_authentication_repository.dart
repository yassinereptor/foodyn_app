import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodyn_rest/core/data/models/auth_response_model.dart';
import 'package:foodyn_rest/core/data/models/coupon_model.dart';
import 'package:foodyn_rest/core/data/models/image_model.dart';
import 'package:foodyn_rest/core/data/models/payment_model.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/data/models/profile_model.dart';
import 'package:foodyn_rest/core/data/models/record_model.dart';
import 'package:foodyn_rest/core/data/models/user_model.dart';
import '../../enums/image.type.dart';

import '../entities/auth_failure.dart';

abstract class IAuthenticationRepository {

  Future<Either<AuthFailure, AuthResponseModel>> login(UserModel user);
  Future<Either<AuthFailure, AuthResponseModel>> register(UserModel user);
  Future<Either<AuthFailure, AuthResponseModel>> forgetPassword(UserModel user);
  Future<Either<AuthFailure, bool>> logout();
  Future<Either<AuthFailure, bool?>> resendConfirmationEmail(String email);
  Future<Either<AuthFailure, ImageModel?>> uploadImage(ImageType type, File file);
  Future<Either<AuthFailure, UserModel?>> getUser();
  Future<Either<AuthFailure, ProfileModel?>> getProfile();
  Future<Either<AuthFailure, RecordModel?>> saveRecord(RecordModel record);
  Future<Either<AuthFailure, ProfileModel?>> saveProfile(ProfileModel profile);
  Future<Either<AuthFailure, CouponModel?>> checkCouponStatus(String code);
  Future<Either<AuthFailure, List<PlanModel>?>> getPlans();
  Future<Either<AuthFailure, List<PaymentModel>?>> getPayments();
}
