import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_rest/core/data/models/auth_response_model.dart';
import 'package:foodyn_rest/core/data/models/coupon_model.dart';
import 'package:foodyn_rest/core/data/models/image_model.dart';
import 'package:foodyn_rest/core/data/models/payment_model.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/data/models/profile_model.dart';
import 'package:foodyn_rest/core/data/models/record_model.dart';
import 'package:foodyn_rest/core/data/models/user_model.dart';
import '../../enums/image.type.dart';
import '../../queries/coupon_query.dart';
import '../../queries/payment_query.dart';
import '../../queries/plan_query.dart';
import '../../queries/profile_query.dart';
import '../../queries/record_query.dart';
import '../../queries/user_query.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/services/graphql_service.dart';
import 'authentication_local_data_source.dart';

abstract class IAuthenticationRemoteDataSource {
  /// Calls the https://preprod.men.gov.ma/identity/GetToken endpoint when dev envirenment.
  ///
  /// Throws a [ServerExeption] for all error codes.

  Future<AuthResponseModel> login(UserModel user);
  Future<AuthResponseModel> register(UserModel user);
  Future<AuthResponseModel> forgetPassword(UserModel user);
  Future<UserModel?> getUser();
  Future<ProfileModel?> getProfile();
  Future<RecordModel?> saveRecord(RecordModel record);
  Future<bool?> resendConfirmationEmail(String email);
  Future<ImageModel?> uploadImage(ImageType type, File file);
  Future<ProfileModel?> saveProfile(ProfileModel profile);
  Future<List<PlanModel>?> getPlans();
  Future<List<PaymentModel>?> getPayments();
  Future<CouponModel?> checkCouponStatus(String code);
}

@Injectable(as: IAuthenticationRemoteDataSource)
class AuthenticationRemoteDataSource
    implements IAuthenticationRemoteDataSource {
  final Dio dio;
  final GraphQLService graphQL;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRemoteDataSource(
    this.dio,
    this.graphQL,
    this.authenticationLocalDataSource
    );

  @override
  Future<AuthResponseModel> login(UserModel user) async {
    try {
      final response = await dio.post(
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
      final response = await dio.post(
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
      final response = await dio.post(
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
  Future<RecordModel?> saveRecord(RecordModel newRecord) async {
    final edited = newRecord.toJson();
    edited.remove("id");
    edited.remove("user");
    edited.putIfAbsent("operator", () => edited["as"]);
    edited.remove("as");
    edited.remove("createdAt");
    edited.remove("updatedAt");
    edited.remove("deletedAt");
    final response = await graphQL.mutation(RecordQuery.saveRecordMutation, variables: {
      "record": edited,
    });
    final result = jsonDecode(response);

    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
 
    RecordModel record = RecordModel.fromJson(result["insertOrUpdateRecord"]);
    return record;
  }

  @override
  Future<UserModel?> getUser() async {
    final response = await graphQL.query(UserQuery.getCurrentUserQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    UserModel user = UserModel.fromJson(result["currentUser"]);
    return user;
  }

  @override
  Future<ProfileModel?> getProfile() async {
    final response = await graphQL.query(ProfileQuery.getCurrentProfileQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    ProfileModel profile = ProfileModel.fromJson(result["currentProfile"]);
    return profile;
  }

  @override
  Future<bool?> resendConfirmationEmail(String email) async {
    final response = await graphQL.mutation(UserQuery.resendConfirmationEmailMutation, variables: {
      "email": email,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    return result["resendConfirmationEmail"];
  }

  @override
  Future<ImageModel?> uploadImage(ImageType type, File file) async {
    try {

      AuthResponseModel? authResponseModel = await this.authenticationLocalDataSource.getToken();
      String token = authResponseModel!.token!;
      String url = dotenv.env["SERVER_IMAGE_UPLOAD"]!;

      switch (type) {
        case ImageType.PROFILE:
          url += "Profile";
          break;
        case ImageType.FOOD:
          url += "Food";
          break;
        case ImageType.REST:
          url += "Rest";
          break;
        case ImageType.CAT:
          url += "Cat";
          break;
        default:
      }

      final response = await dio.post(
        url,
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(
            file.path,
            filename: basename(file.path),
          ),
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
  Future<ProfileModel?> saveProfile(ProfileModel profile) async {
    final edited = profile.toJson();
    edited.remove("user");
    edited.remove("image");
    edited.remove("createdAt");
    edited.remove("updatedAt");
    edited.remove("deletedAt");
    edited.remove("phoneNumberVerified");
    final response = await graphQL.mutation(ProfileQuery.saveProfileMutation, variables: {
      "profile": edited,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    ProfileModel profileModel= ProfileModel.fromJson(result["insertOrUpdateProfile"]);
    return profileModel;
  }

  @override
  Future<List<PlanModel>?> getPlans() async {
    final response = await graphQL.query(PlanQuery.getPlansQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    List<PlanModel>? plans = result["plans"].map<PlanModel>((e) {
      return PlanModel.fromJson(e);
    }).toList();
    if (plans == null)
      plans = [];
    return plans;
  }

  @override
  Future<List<PaymentModel>?> getPayments() async {
    final response = await graphQL.query(PaymentQuery.getPaymentsQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    List<PaymentModel>? payments = result["payments"].map<PaymentModel>((e) {
      return PaymentModel.fromJson(e);
    }).toList();
    if (payments == null)
      payments = [];
    return payments;
  }

  @override
  Future<CouponModel?> checkCouponStatus(String code) async {
    final response = await graphQL.mutation(CouponQuery.checkCouponStatusMutation, variables: {
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

}
