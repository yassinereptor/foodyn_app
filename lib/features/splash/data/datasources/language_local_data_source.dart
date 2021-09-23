import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exeptions.dart';

abstract class ILanguageLocalDataSource {
  Future<Locale?> getLanguage();

  Future<Locale> setLanguage(String lang);
}

@Injectable(as: ILanguageLocalDataSource)
class LanguageLocalDataSource implements ILanguageLocalDataSource {
  final SharedPreferences prefs;

  LanguageLocalDataSource(this.prefs);

  @override
  Future<Locale?> getLanguage() async {
    final lang = prefs.getString("lang");
    if (lang != null) {
      final locale = lang.split("_").toList();
      return Locale(locale[0], locale.length == 2 ? locale[1] : null);
    }
    return null;
  }

  @override
  Future<Locale> setLanguage(String lang) async {
    final response = await prefs.setString("lang", lang);
    if (response == false)
      throw CacheExeption();
    else {
      final locale = lang.split("_").toList();
      return Locale(locale[0], locale.length == 2 ? locale[1] : null);
    }
  }
}
