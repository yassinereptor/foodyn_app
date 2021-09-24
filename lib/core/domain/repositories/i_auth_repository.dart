import 'package:dartz/dartz.dart';
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
}
