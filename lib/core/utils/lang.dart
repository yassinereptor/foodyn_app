

import '../config/injectable/injection.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

bool isAr() {
  // ignore: close_sinks
  final _authBloc = getIt<AuthBloc>();
  return _authBloc.state.locale != null && _authBloc.state.locale!.languageCode == "ar";
}

bool isFr() {
  // ignore: close_sinks
  final _authBloc = getIt<AuthBloc>();
  return _authBloc.state.locale != null && _authBloc.state.locale!.languageCode == "fr";
}

bool isEn() {
  // ignore: close_sinks
  final _authBloc = getIt<AuthBloc>();
  return _authBloc.state.locale != null && _authBloc.state.locale!.languageCode == "en";
}