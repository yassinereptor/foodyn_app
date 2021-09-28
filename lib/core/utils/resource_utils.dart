import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResourceUtils {
  BuildContext _context;

  ResourceUtils(this._context);

  Future<List<String>> getPhoneResource() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userResourcesPhone = sharedPreferences.getString("user_resources_phone");
    String value = await DefaultAssetBundle.of(_context)
        .loadString(userResourcesPhone!);
    final jsonResult = json.decode(value);
    return [...jsonResult.map((item) => json.encode(item))];
  }
}