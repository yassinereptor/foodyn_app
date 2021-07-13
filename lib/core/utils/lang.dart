

import '../config/injectable/injection.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';

bool isAr() {
  // ignore: close_sinks
  final _splashBloc = getIt<SplashBloc>();
  return _splashBloc.state.locale != null && _splashBloc.state.locale!.languageCode == "ar";
}

bool isFr() {
  // ignore: close_sinks
  final _splashBloc = getIt<SplashBloc>();
  return _splashBloc.state.locale != null && _splashBloc.state.locale!.languageCode == "fr";
}

bool isEn() {
  // ignore: close_sinks
  final _splashBloc = getIt<SplashBloc>();
  return _splashBloc.state.locale != null && _splashBloc.state.locale!.languageCode == "en";
}