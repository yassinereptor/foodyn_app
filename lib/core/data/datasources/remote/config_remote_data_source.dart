import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../models/payment_model.dart';
import '../../models/plan_model.dart';
import '../../models/record_model.dart';
import '../../../error/exeptions.dart';
import '../../../queries/payment_query.dart';
import '../../../queries/plan_query.dart';
import '../../../queries/record_query.dart';
import '../../../services/graphql_service.dart';
import 'package:injectable/injectable.dart';

abstract class IConfigRemoteDataSource {
  Future<List<String>?> getPhoneResource();
  Future<RecordModel?> getRemote();
  Future<RecordModel?> setRemote(RecordModel? record);
  Future<List<PlanModel>?> getPlans();
  Future<List<PaymentModel>?> getPayments();
}

@Injectable(as: IConfigRemoteDataSource)
class ConfigRemoteDataSource implements IConfigRemoteDataSource {
  final GraphQLService _graphQLService;

  ConfigRemoteDataSource(
    this._graphQLService
    );

  @override
  Future<RecordModel?> getRemote() async {
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
  Future<List<PaymentModel>?> getPayments() async {
    final response = await _graphQLService.query(PaymentQuery.getPaymentsQuery);
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
  Future<List<PlanModel>?> getPlans() async {
    final response = await _graphQLService.query(PlanQuery.getPlansQuery);
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
  Future<RecordModel?> setRemote(RecordModel? record) async {
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
  Future<List<String>?> getPhoneResource() async {
    var dio = Dio();
    Response<String> response;

    String? link = dotenv.env["SERVER_LINK"];
    link = link! + "/json/phone.json";
    response = await dio.get(link);
    if (response.statusCode != 200)
      throw ServerExeption(status: response.statusCode!, message: response.statusMessage!);
    final jsonResult = json.decode(response.data!);
    List<String>? result = [...jsonResult.map((item) => json.encode(item))];
    return result;
  }
}
