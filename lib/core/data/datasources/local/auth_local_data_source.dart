import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/graphql_service.dart';

abstract class IAuthLocalDataSource {
  Future<String?> getToken();
  Future<bool> saveToken(String token);
  Future<bool> saveLogin(String login);
}

@Injectable(as: IAuthLocalDataSource)
class AuthLocalDataSource implements IAuthLocalDataSource {
  final GraphQLService graphQL;
  final SharedPreferences prefs;

  AuthLocalDataSource(this.graphQL, this.prefs);

  @override
  Future<String?> getToken() async {
    final token = prefs.getString("user_token");
    if (token != null) {
      graphQL.setToken(token);
      return token;
    }
    return null;
  }

  @override
  Future<bool> saveToken(String token) async {
    final response = await prefs.setString("user_token", token);
    graphQL.setToken(token);
    return response;
  }

  @override
  Future<bool> saveLogin(String login) async {
    final response = await prefs.setString("user_login", login);
    return response;
  }


}
