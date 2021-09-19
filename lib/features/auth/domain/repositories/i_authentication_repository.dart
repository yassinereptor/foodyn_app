import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/enums/image.type.dart';
import 'package:foodyn_rest/core/models/auth_response_model.dart';
import 'package:foodyn_rest/core/models/image_model.dart';
import 'package:foodyn_rest/core/models/profile_model.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:foodyn_rest/core/models/user_model.dart';

import 'package:meta/meta.dart';

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
}
