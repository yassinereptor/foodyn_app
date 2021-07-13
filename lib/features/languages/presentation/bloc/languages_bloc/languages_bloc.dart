import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'languages_event.dart';
part 'languages_state.dart';
part 'languages_bloc.freezed.dart';

@injectable
class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  Logger logger;
  SharedPreferences prefs;

  LanguagesBloc(this.prefs, this.logger) : super(_Initial());

  @override
  Stream<LanguagesState> mapEventToState(
    LanguagesEvent gEvent,
  ) async* {
    yield* gEvent.when(
      started: () => _startedHandler(),
    );
  }

   @override
  void onEvent(LanguagesEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<LanguagesState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<LanguagesState> _startedHandler() async* {
    yield LanguagesState.initial();
    yield LanguagesState.getLanguagesInProgress();
    yield LanguagesState.getLanguagesSucceed();
  }

}

