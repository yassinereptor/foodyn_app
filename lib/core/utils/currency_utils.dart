import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/plan_model.dart';

import '../enums/currency.type.dart';

class CurrencyUtils {
    PlanModel? _plan;

    CurrencyUtils(this._plan);

    String getMonthPrice() {
      var object = jsonDecode(_plan!.monthPrice!);
      String lang = "mad";
      return object[lang].toString();
    }

    String getYearPrice() {
      var object = jsonDecode(_plan!.yearPrice!);
      String lang = "mad";
      return object[lang].toString();
    }

    String? getCalcYearPrice() {
      var object = jsonDecode(_plan!.monthPrice!);
      String lang = "mad";
      if (object[lang] == 0)
        return null;
      var price = object[lang] * 12;
      return price.toString();
    }

    static Future<int?> getCurrencyIndex() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      int? index = sharedPreferences.getInt("user_settings_currency");
      return index;
    }

    static String toStringCurrency(int? index) {
      CurrencyType type = (index != null) ? CurrencyType.values[index] : CurrencyType.MAD;
      switch(type){
        case CurrencyType.MAD:
          return "MAD";
        case CurrencyType.USD:
          return "\$";
        case CurrencyType.EUR:
          return "€";
      }
    }
}