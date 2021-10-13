

import 'package:foodyn_rest/core/bloc/config_bloc/config_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../config/injectable/injection.dart';

bool isAr() {
  // ignore: close_sinks
  final _configBloc = getIt<ConfigBloc>();
  return _configBloc.state.locale != null && _configBloc.state.locale!.languageCode == "ar";
}

bool isFr() {
  // ignore: close_sinks
  final _configBloc = getIt<ConfigBloc>();
  return _configBloc.state.locale != null && _configBloc.state.locale!.languageCode == "fr";
}

bool isEn() {
  // ignore: close_sinks
  final _configBloc = getIt<ConfigBloc>();
  return _configBloc.state.locale != null && _configBloc.state.locale!.languageCode == "en";
}