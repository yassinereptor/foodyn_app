import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class IDioModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(
        baseUrl: dotenv.env["SERVER_LINK"]!,
        connectTimeout: int.parse(dotenv.env["SERVER_TIMEOUT"]!),
        sendTimeout: int.parse(dotenv.env["SERVER_TIMEOUT"]!),
        receiveTimeout: int.parse(dotenv.env["SERVER_TIMEOUT"]!),
        headers: {
          "Content-Type": "application/json",
        },
      ));
}
