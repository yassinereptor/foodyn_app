import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class IDioModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(
        baseUrl: DotEnv().env["LOGIN_URL"]!,
        connectTimeout: 5000,
        sendTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          "Content-Type": "application/json",
        },
      ));
}
