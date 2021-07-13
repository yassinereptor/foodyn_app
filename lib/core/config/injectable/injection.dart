import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String environment) async =>
    $initGetIt(getIt, environment: environment);

class Env {
  static const dev = "dev";
  static const prod = "prod";
  static const test = "test";
}
