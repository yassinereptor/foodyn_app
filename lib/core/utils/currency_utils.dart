import 'package:foodyn_rest/core/enums/currency.type.dart';

class CurrencyUtils {
    static String toStringCurrency(CurrencyType type) {
      switch(type){
        case CurrencyType.MAD:
          return "MAD";
        case CurrencyType.USD:
          return "USD";
        case CurrencyType.EUR:
          return "EUR";
      }
    }
}