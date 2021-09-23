import 'dart:convert';

import 'package:flutter/cupertino.dart';

class StringUtils {
  static String getTranslatedString(Locale locale, String description) {
    //.replaceAll('\n', '\\n')
    var object = jsonDecode(description);
    var lang = "en";
    switch (locale.countryCode) {
      case "en":
        lang = "en";
        break;
      case "ar":
        lang = "ar";
        break;
      case "fr":
        lang = "fr";
        break;
      default:
    }
    return object[lang];
  }
}