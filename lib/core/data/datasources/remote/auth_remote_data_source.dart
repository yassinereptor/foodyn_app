import 'dart:convert';
import 'dart:io';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_eatery/core/data/datasources/local/auth_local_data_source.dart';
import 'package:foodyn_eatery/core/data/models/coupon_model.dart';
import 'package:foodyn_eatery/core/data/models/image_model.dart';
import 'package:foodyn_eatery/core/data/models/membership_model.dart';
import 'package:foodyn_eatery/core/queries/coupon_query.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as img;

import '../../../../core/error/exeptions.dart';
import '../../../../core/services/graphql_service.dart';
import '../../../queries/user_query.dart';
import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';

abstract class IAuthRemoteDataSource {
  /// Calls the https://preprod.men.gov.ma/identity/GetToken endpoint when dev envirenment.
  ///
  /// Throws a [ServerExeption] for all error codes.

  Future<AuthResponseModel> login(UserModel user);
  Future<AuthResponseModel> register(UserModel user);
  Future<AuthResponseModel> forgetPassword(UserModel user);
  Future<UserModel?> getUser();
  Future<bool?> resendConfirmationEmail(String email);
  Future<ImageModel?> uploadImage(File file);
  Future<UserModel?> updateUser(UserModel user);
  Future<CouponModel?> checkCouponStatus(String code);
  Future<MembershipModel?> saveMembership(int planId, int periodId, int? couponId);
}

@Injectable(as: IAuthRemoteDataSource)
class AuthRemoteDataSource
    implements IAuthRemoteDataSource {
  final Dio _dio;
  final GraphQLService _graphQLService;
  final IAuthLocalDataSource _authLocalDataSource;

  AuthRemoteDataSource(
    this._dio,
    this._graphQLService,
    this._authLocalDataSource
    );

  @override
  Future<AuthResponseModel> login(UserModel user) async {
    try {
      final response = await _dio.post(
        dotenv.env["SERVER_AUTH_LOGIN_LINK"]!,
        data: {
          "email": user.email,
          "password": user.password,
          "type": int.parse(dotenv.env["SERVER_AUTH_TYPE"].toString())
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }

  @override
  Future<AuthResponseModel> register(UserModel user) async {
    try {
      final response = await _dio.post(
        dotenv.env["SERVER_AUTH_REGISTER_LINK"]!,
        data: {
          "email": user.email,
          "password": user.password,
          "type": int.parse(dotenv.env["SERVER_AUTH_TYPE"].toString())
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }

  @override
  Future<AuthResponseModel> forgetPassword(UserModel user) async {
    try {
      final response = await _dio.post(
        dotenv.env["SERVER_AUTH_FORGETPASSWORD_LINK"]!,
        data: {
          "email": user.email,
          "type": int.parse(dotenv.env["SERVER_AUTH_TYPE"].toString())
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }


  @override
  Future<UserModel?> getUser() async {
    final response = await _graphQLService.query(UserQuery.getCurrentUserQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    UserModel user = UserModel.fromJson(result["currentUser"]);
    return user;
  }


  @override
  Future<bool?> resendConfirmationEmail(String email) async {
    final response = await _graphQLService.mutation(UserQuery.resendConfirmationEmailMutation, variables: {
      "email": email,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    return result["resendConfirmationEmail"];
  }

  @override
  Future<ImageModel?> uploadImage(File file) async {
    try {

      String? token = await this._authLocalDataSource.getToken();
      String url = dotenv.env["SERVER_IMAGE_UPLOAD"]!;

      url += "Profile";

      final image = img.decodeImage(file.readAsBytesSync().toList());
      final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);

      final response = await _dio.post(
        url,
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(
            file.path,
            filename: basename(file.path),
          ),
          "hash": blurHash.hash
        }),
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            "Authorization": "Bearer $token",
          }
        )
      );
      return ImageModel.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }

  @override
  Future<UserModel?> updateUser(UserModel user) async {
    final edited = user.toJson();
    edited.remove("image");
    edited.remove("phoneNumberVerified");
    edited.remove("memberships");
    edited.remove("type");
    edited.remove("email");
    edited.remove("password");
    edited.remove("verified");
    final response = await _graphQLService.mutation(UserQuery.updateUserMutation, variables: {
      "user": edited,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    UserModel userModel= UserModel.fromJson(result["updateUser"]);
    return userModel;
  }

  @override
  Future<CouponModel?> checkCouponStatus(String code) async {
    final response = await _graphQLService.mutation(CouponQuery.checkCouponStatusMutation, variables: {
      "code": code,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    if (result["checkCouponStatus"] == null)
      return null;
    CouponModel? couponModel = CouponModel.fromJson(result["checkCouponStatus"]);
    return couponModel;
  }

  @override
  Future<MembershipModel?> saveMembership(int planId, int periodId, int? couponId) async {
    Map<String, dynamic> object = {};
    object.putIfAbsent("planId", () => planId);
    object.putIfAbsent("periodId", () => periodId);
    object.putIfAbsent("couponId", () => couponId);
    final response = await _graphQLService.mutation(UserQuery.saveMembershipMutation, variables: {
      "membership": object,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    MembershipModel membershipModel= MembershipModel.fromJson(result["insertOrUpdateMembership"]);
    return membershipModel;
  }

}
