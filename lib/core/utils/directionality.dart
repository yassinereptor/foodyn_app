import 'package:flutter/cupertino.dart';

bool isLTR(BuildContext context) {
  return Directionality.of(context) == TextDirection.ltr;
}

bool isRTL(BuildContext context) {
  return Directionality.of(context) == TextDirection.rtl;
}
