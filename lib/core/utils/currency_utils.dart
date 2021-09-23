import 'dart:convert';

import 'package:foodyn_rest/core/data/models/plan_model.dart';

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

    static String toStringCurrency() {
      CurrencyType type = CurrencyType.MAD;
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