import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_eatery/core/data/models/eatery_type_model.dart';
import 'package:foodyn_eatery/core/data/models/location_model.dart';
import 'package:foodyn_eatery/core/enums/config.type.dart';
import 'package:foodyn_eatery/core/queries/config_query.dart';
import '../../models/payment_model.dart';
import '../../models/plan_model.dart';
import '../../models/record_model.dart';
import '../../../error/exeptions.dart';
import '../../../queries/record_query.dart';
import '../../../services/graphql_service.dart';
import 'package:injectable/injectable.dart';

abstract class IConfigRemoteDataSource {
  Future<List<LocationModel>?> getRemoteLocationResource();
  Future<RecordModel?> getRemoteRecord();
  Future<RecordModel?> setRemoteRecord(RecordModel? record);
  Future<List<PlanModel>?> getRemotePlans();
  Future<List<PaymentModel>?> getRemotePayments();
  Future<List<EateryTypeModel>?> getRemoteEateryTypes();
  Future<DateTime?> getLastRemoteConfig(ConfigType type);
}

@Injectable(as: IConfigRemoteDataSource)
class ConfigRemoteDataSource implements IConfigRemoteDataSource {
  final GraphQLService _graphQLService;

  ConfigRemoteDataSource(
    this._graphQLService
    );

  @override
  Future<RecordModel?> getRemoteRecord() async {
    var dio = Dio();
    Response<String> response;
    RecordModel recordModel;

    String? link = dotenv.env["WHOIS_LINK"];
    response = await dio.get(link!);
    if (response.statusCode != 200)
      throw ServerExeption(status: response.statusCode!, message: response.statusMessage!);
    recordModel = RecordModel.fromJson(json.decode(response.data!));
    return recordModel;
  }

  @override
  Future<List<PaymentModel>?> getRemotePayments() async {
    final response = await _graphQLService.query(ConfigQuery.getPaymentsQuery);
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
  Future<List<PlanModel>?> getRemotePlans() async {
    final response = await _graphQLService.query(ConfigQuery.getPlansQuery);
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
  Future<RecordModel?> setRemoteRecord(RecordModel? record) async {
    if (record == null)
      return null;
    final edited = record.toJson();
    edited.remove("id");
    edited.remove("user");
    edited.putIfAbsent("operator", () => edited["as"]);
    edited.remove("as");
    final response = await _graphQLService.mutation(RecordQuery.saveRecordMutation, variables: {
      "record": edited,
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    RecordModel newRecord = RecordModel.fromJson(result["insertOrUpdateRecord"]);
    return newRecord;
  }

  @override
  Future<List<LocationModel>?> getRemoteLocationResource() async {
    var dio = Dio();
    Response<String> response;

    String? link = dotenv.env["SERVER_LINK"];
    link = link! + "/json/location.json";
    response = await dio.get(link);
    if (response.statusCode != 200)
      throw ServerExeption(status: response.statusCode!, message: response.statusMessage!);
    final jsonResult = json.decode(response.data!);
    List<LocationModel>? result = jsonResult.map<LocationModel>((item) => LocationModel.fromJson(item)).toList();
    return result;
  }

  @override
  Future<DateTime?> getLastRemoteConfig(ConfigType type) async {
    final response = await _graphQLService.query(ConfigQuery.getLastRemoteConfig, variables: {
      "type": type.index
    });
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    if (result["lastRemoteConfig"] == null)
      return null;
    DateTime? createdAt = DateTime.parse(result["lastRemoteConfig"]["createdAt"]);
    return createdAt;
  }

  @override
  Future<List<EateryTypeModel>?> getRemoteEateryTypes() async {
    final response = await _graphQLService.query(ConfigQuery.getEateryTypesQuery);
    final result = jsonDecode(response);
    if (result["errors"] != null)
      throw ServerExeption(message: result["errors"][0]["message"]);
    List<EateryTypeModel>? eateryTypeModel = result["eateryTypes"].map<EateryTypeModel>((e) {
      return EateryTypeModel.fromJson(e);
    }).toList();
    if (eateryTypeModel == null)
      eateryTypeModel = [];
    return eateryTypeModel;
  }

}
