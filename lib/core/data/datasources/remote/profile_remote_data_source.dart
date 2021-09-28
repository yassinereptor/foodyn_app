import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_rest/core/data/models/membership_model.dart';
import '../local/auth_local_data_source.dart';
import '../../models/coupon_model.dart';
import '../../models/image_model.dart';
import '../../models/profile_model.dart';
import '../../../enums/image.type.dart';
import '../../../queries/coupon_query.dart';
import '../../../queries/profile_query.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/services/graphql_service.dart';

abstract class IProfileRemoteDataSource {
  Future<ProfileModel?> getProfile();
  Future<ImageModel?> uploadImage(ImageType type, File file);
  Future<ProfileModel?> saveProfile(ProfileModel profile);
  Future<CouponModel?> checkCouponStatus(String code);
  Future<MembershipModel?> saveMembership(int planId, int periodId, int? couponId);
}

@Injectable(as: IProfileRemoteDataSource)
class ProfileRemoteDataSource
    implements IProfileRemoteDataSource {
  final Dio _dio;
  final GraphQLService _graphQLService;
  final IAuthLocalDataSource _authLocalDataSource;

  ProfileRemoteDataSource(
    this._dio,
    this._graphQLService,
    this._authLocalDataSource
    );

  @override
  Future<ProfileModel?> getProfile() async {
    final response = await _graphQLService.query(ProfileQuery.getCurrentProfileQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    ProfileModel profile = ProfileModel.fromJson(result["currentProfile"]);
    return profile;
  }

  @override
  Future<ImageModel?> uploadImage(ImageType type, File file) async {
    try {

      String? token = await this._authLocalDataSource.getToken();
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

      final response = await _dio.post(
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
    edited.remove("phoneNumberVerified");
    final response = await _graphQLService.mutation(ProfileQuery.saveProfileMutation, variables: {
      "profile": edited,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    ProfileModel profileModel= ProfileModel.fromJson(result["insertOrUpdateProfile"]);
    return profileModel;
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
    final response = await _graphQLService.mutation(ProfileQuery.saveMembershipMutation, variables: {
      "membership": object,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    MembershipModel membershipModel= MembershipModel.fromJson(result["insertOrUpdateMembership"]);
    return membershipModel;
  }

}
