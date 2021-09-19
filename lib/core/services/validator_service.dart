import 'package:validators/validators.dart';

class ValidatorService {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty)
      return '● Required';
    else if (!isEmail(value))
      return '● Invalid Email';
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty)
      return '● Required';
    else if (value.length < 8)
      return '● Password less than 8';
    return null;
  }
}