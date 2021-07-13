import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/l10n/l10n.dart';
import '../../../../../features/splash/domain/entities/splash_failure.dart';
import '../../../../../features/splash/domain/entities/splash_status.dart';
import '../../../../../features/splash/domain/repositories/i_language_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Logger logger;
  final SharedPreferences prefs;
  final ILanguageRepository languageRepository;
  
  SplashBloc(this.prefs, this.logger, this.languageRepository) : super(SplashState(
            type: SplashStateType.initial(), status: SplashStatus.initial()));

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent gEvent,
  ) async* {
    yield* gEvent.when(
      started: () => _startedHandler(),
      setLanguage: (lang) => _setLanguageHandler(lang),
    );
  }

   @override
  void onEvent(SplashEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<SplashState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<SplashState> _startedHandler() async* {
    yield state.copyWith(type: SplashStateType.getSplashInProgress());
    Locale? locale = await languageRepository.getLanguage();
    if (locale != null) S.load(locale);
       yield state.copyWith(
          type: SplashStateType.getSplashSucceed(),
          status: locale == null
              ? SplashStatus.firstTime()
              : SplashStatus.start(),
          locale: locale,
        );
  }

  Stream<SplashState> _setLanguageHandler(String lang) async* {
    bool failed = false;
    SplashFailure? failure;
    Locale? locale;

    if (lang != state.locale.toString()) {
      final either = await languageRepository.setLanguage(lang);
      either.fold((l) {
        failed = true;
        failure = l;
      }, (r) {
        failed = false;
        locale = r;
      });

      if (failed)
        yield state.copyWith(type: SplashStateType.getSplashFailed(failure!));
      else {
        S.load(locale!);
        yield state.copyWith(type: SplashStateType.getSplashInProgress(), locale: locale!);
      }
    }
  }

}
