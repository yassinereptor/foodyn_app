import 'dart:convert';
import 'dart:io';

import 'package:foodyn_eatery/core/data/models/eatery_type_model.dart';
import 'package:foodyn_eatery/core/data/models/location_model.dart';
import 'package:foodyn_eatery/core/data/models/payment_model.dart';
import 'package:foodyn_eatery/core/data/models/plan_model.dart';
import 'package:foodyn_eatery/core/enums/config.type.dart';

import '../../models/record_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/services/graphql_service.dart';

abstract class IConfigLocalDataSource {
  Future<RecordModel?> getRecord();
  Future<bool> setRecord(RecordModel? record);

  Future<DateTime?> getLastLocalConfig(ConfigType type);
  Future<bool> setLastLocalConfig(DateTime date, ConfigType type);
  Future<List<LocationModel>?> getLocalLocationResource();
  Future<bool> setLocalLocationResource(List<LocationModel> resources);

  Future<List<PlanModel>?> getLocalPlans();
  Future<bool> setLocalPlans(List<PlanModel> resources);

  Future<List<PaymentModel>?> getLocalPayments();
  Future<bool> setLocalPayments(List<PaymentModel> resources);

  Future<List<EateryTypeModel>?> getLocalEateryTypes();
  Future<bool> setLocalEateryTypes(List<EateryTypeModel> resources);
}

@Injectable(as: IConfigLocalDataSource)
class ConfigLocalDataSource implements IConfigLocalDataSource {
  final SharedPreferences _sharedPreferences;

  ConfigLocalDataSource(
    this._sharedPreferences
  );

  @override
  Future<RecordModel?> getRecord() async {
    final record = _sharedPreferences.getString("user_record");
    if (record != null) {
      final result = jsonDecode(record);
      return RecordModel.fromJson(result);
    }
    return null;
  }
  
   @override
  Future<bool> setRecord(RecordModel? record) async {
    final response = await _sharedPreferences.setString("user_record", jsonEncode(record));
    return response;
  }

  @override
  Future<DateTime?> getLastLocalConfig(ConfigType type) async {
    final date = _sharedPreferences.getString("user_last_config_update_$type");
    if (date != null) {
      return DateTime.parse(date);
    }
    return null;
  }

   @override
  Future<bool> setLastLocalConfig(DateTime date, ConfigType type) async {
    final response = await _sharedPreferences.setString("user_last_config_update_$type", date.toString());
    return response;
  }

  @override
  Future<List<LocationModel>?> getLocalLocationResource() async {
    final data = _sharedPreferences.getString("user_config_location");
    if (data != null) {
      final jsonResult = json.decode(data);
      List<LocationModel>? result = jsonResult.map<LocationModel>((item) => LocationModel.fromJson(item)).toList();
      return result;
    }
    return null;
  }

  @override
  Future<bool> setLocalLocationResource(List<LocationModel> resources) async {
    final response = await _sharedPreferences.setString("user_config_location", json.encode(resources));
    return response;
  }

  
  @override
  Future<List<PlanModel>?> getLocalPlans() async {
    final data = _sharedPreferences.getString("user_config_plans");
    if (data != null) {
      final jsonResult = json.decode(data);
      List<PlanModel>? result = [...jsonResult.map((item) => PlanModel.fromJson(item))];
      return result;
    }
    return null;
  }
  
  @override
  Future<bool> setLocalPlans(List<PlanModel> resources) async {
    final response = await _sharedPreferences.setString("user_config_plans", json.encode(resources));
    return response;
  }

  @override
  Future<List<PaymentModel>?> getLocalPayments() async {
    final data = _sharedPreferences.getString("user_config_payments");
    if (data != null) {
      final jsonResult = json.decode(data);
      List<PaymentModel>? result = [...jsonResult.map((item) => PaymentModel.fromJson(item))];
      return result;
    }
    return null;
  }
  
  @override
  Future<bool> setLocalPayments(List<PaymentModel> resources) async {
    final response = await _sharedPreferences.setString("user_config_payments", json.encode(resources));
    return response;
  }


  @override
  Future<List<EateryTypeModel>?> getLocalEateryTypes() async {
    final data = _sharedPreferences.getString("user_config_eatery_types");
    if (data != null) {
      final jsonResult = json.decode(data);
      List<EateryTypeModel>? result = [...jsonResult.map((item) => EateryTypeModel.fromJson(item))];
      return result;
    }
    return null;
  }

  @override
  Future<bool> setLocalEateryTypes(List<EateryTypeModel> resources) async {
    final response = await _sharedPreferences.setString("user_config_eatery_types", json.encode(resources));
    return response;
  }

}
