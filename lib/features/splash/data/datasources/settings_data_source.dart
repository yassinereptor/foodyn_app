import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:foodyn_rest/core/utils/global_utils.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeptions.dart';

abstract class ISettingsLocalDataSource {
  Future<Either<AuthFailure?, RecordModel>> loadSettings();
}

@Injectable(as: ISettingsLocalDataSource)
class SettingsLocalDataSource implements ISettingsLocalDataSource {
  final SharedPreferences prefs;

  SettingsLocalDataSource(this.prefs);

  @override
  Future<Either<AuthFailure?, RecordModel>> loadSettings() async {
    var dio = Dio();
    Response<String> response;
    RecordModel recordModel;

    String? link = dotenv.env["WHOIS_LINK"];
    response = await dio.get(link!);
    if (response.statusCode != 200)
      return Left(new AuthFailure.server(status: response.statusCode!, message: response.statusMessage!));
    recordModel = RecordModel.fromJson(json.decode(response.data!));
    return Right(recordModel);
  }
}
