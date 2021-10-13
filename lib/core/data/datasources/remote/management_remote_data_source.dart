import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_rest/core/data/models/eatery_model.dart';
import 'package:foodyn_rest/core/data/models/eatery_type_model.dart';
import 'package:foodyn_rest/core/data/models/membership_model.dart';
import 'package:foodyn_rest/core/queries/management_query.dart';
import '../local/auth_local_data_source.dart';
import '../../models/coupon_model.dart';
import '../../models/image_model.dart';
import '../../../enums/image.type.dart';
import '../../../queries/coupon_query.dart';
import '../../../queries/profile_query.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as img;
import 'package:blurhash_dart/blurhash_dart.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/services/graphql_service.dart';

abstract class IManagementRemoteDataSource {
  Future<bool> uploadEateryImages(List<File> imageList, int eateryId);
  Future<EateryModel?> saveEatery(EateryModel eateryModel);
  Future<List<EateryModel>?> getEateries();
  Future<EateryModel?> getEatery(int id);
}

@Injectable(as: IManagementRemoteDataSource)
class ManagementRemoteDataSource
    implements IManagementRemoteDataSource {
  final Dio _dio;
  final GraphQLService _graphQLService;
  final IAuthLocalDataSource _authLocalDataSource;

  ManagementRemoteDataSource(
    this._dio,
    this._graphQLService,
    this._authLocalDataSource
    );

  @override
  Future<EateryModel?> saveEatery(EateryModel eateryModel) async {
    final response = await _graphQLService.mutation(ManagementQuery.saveEateryMutation, variables: {
      "eatery": {
        "id": eateryModel.id,
        "title": eateryModel.title,
        "description": eateryModel.description,
        "adresse": eateryModel.adresse,
        "dialCode": eateryModel.dialCode,
        "phoneNumber": eateryModel.phoneNumber,
        "country": eateryModel.country,
        "city": eateryModel.city,
        "posLat": eateryModel.posLat,
        "posLng": eateryModel.posLng,
        "eateryTypes": [
          ...eateryModel.eateryTypes!.map((e) => {
            "id": e.id,
          })
        ],
        "sections": [
          ...eateryModel.sections!.map((e) => {
            "id": e.id,
            "title": e.title,
            "rows": e.rows,
            "columns": e.columns,
            "tables": [
              ...e.tables!.map((e) => {
                "id": e.id,
                "number": e.number,
                "row": e.row,
                "column": e.column
              })
            ]
          }),
        ]
      },
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    eateryModel = EateryModel.fromJson(result["insertOrUpdateEatery"]);
    return eateryModel;
  }


  @override
  Future<bool> uploadEateryImages(List<File> imageList, int eateryId) async {
    try {

      String? token = await this._authLocalDataSource.getToken();
      String url = dotenv.env["SERVER_IMAGE_UPLOAD"]!;
      
      url += "Eatery";

      List<BlurHash> blurHashes = [];
      
      imageList.forEach((file) {
        final image = img.decodeImage(file.readAsBytesSync().toList());
        final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);
        blurHashes.add(blurHash);
      });
      
      final response = await _dio.post(
        url,
        data: FormData.fromMap({
          "files": imageList.map((file) => MultipartFile.fromFileSync(
            file.path,
            filename: basename(file.path),
          )).toList(),
          "hashes": [
            ...blurHashes.map((e) => e.hash).toList()
          ],
          "eateryId": eateryId
        }),
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            "Authorization": "Bearer $token",
          }
        )
      );
      return true;
    } on DioError catch (e) {
      throw ServerExeption(
        status: e.hashCode,
        message: e.message,
      );
    }
  }

  @override
  Future<List<EateryModel>?> getEateries() async {
    final response = await _graphQLService.query(ManagementQuery.getCurrentEateriesQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    List<EateryModel> eateries = result["currentEateries"].map<EateryModel>((eatery) => EateryModel.fromJson(eatery)).toList();
    return eateries;
  }

  @override
  Future<EateryModel?> getEatery(int id) async {
    final response = await _graphQLService.query(ManagementQuery.getEateryQuery, variables: {
      "id": id
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    EateryModel eatery = EateryModel.fromJson(result["eatery"]);
    return eatery;
  }

}
