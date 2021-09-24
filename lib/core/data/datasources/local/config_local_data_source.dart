import 'dart:convert';

import '../../models/record_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/graphql_service.dart';

abstract class IConfigLocalDataSource {
  Future<RecordModel?> getRecord();
  Future<bool> setRecord(RecordModel? record);
}

@Injectable(as: IConfigLocalDataSource)
class ConfigLocalDataSource implements IConfigLocalDataSource {
  final GraphQLService graphQL;
  final SharedPreferences prefs;

  ConfigLocalDataSource(this.graphQL, this.prefs);

  @override
  Future<RecordModel?> getRecord() async {
    final record = prefs.getString("user_record");
    if (record != null) {
      final result = jsonDecode(record);
      return RecordModel.fromJson(result);
    }
    return null;
  }
  
   @override
  Future<bool> setRecord(RecordModel? record) async {
    final response = await prefs.setString("user_record", jsonEncode(record));
    return response;
  }

}
