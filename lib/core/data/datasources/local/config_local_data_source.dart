import 'dart:convert';
import 'dart:io';

import '../../models/record_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/services/graphql_service.dart';

abstract class IConfigLocalDataSource {
  Future<RecordModel?> getRecord();
  Future<bool> setRecord(RecordModel? record);
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

}
