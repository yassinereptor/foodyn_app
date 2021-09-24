import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../data/models/payment_model.dart';
import '../../data/models/plan_model.dart';
import '../../data/models/record_model.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_config_repository.dart';
import '../../domain/repositories/i_language_repository.dart';
import '../../l10n/l10n.dart';

part 'config_bloc.freezed.dart';
part 'config_event.dart';
part 'config_state.dart';

@injectable
class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final ILanguageRepository _languageRepository;
  final IConfigRepository _configRepository;
  final Logger _logger;

  ConfigBloc(
    this._logger,
    this._configRepository,
    this._languageRepository
  ) : super(_Initial());

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent gEvent,
  ) async* {
    yield* gEvent.when(
      started: () => _startedHandler(),
      getPlans: () => _getPlansHandler(),
      getPayments: () => _getPaymentsHandler(),
      setLanguage: (lang) => _setLanguageHandler(lang),
    );
  }

  @override
  void onEvent(ConfigEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<ConfigState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<ConfigState> _startedHandler() async* {
    AppFailure? appFailure;
    RecordModel? record;

    yield ConfigState.loadingInProgress();
    Locale? locale = await _languageRepository.getLanguage();
    if (locale != null) S.load(locale);
    var either = await _configRepository.getRemoteRecord();
    either.fold((failure) {
      appFailure = failure;
    }, (value) {
      record = value;
    });
    if (appFailure != null)
      yield ConfigState.loadingFailed(appFailure!);
    else
    {
      final either = await _configRepository.setLocalRecord(record);
      either.fold((failure) {
        appFailure = failure;
      }, (value) {
        record = value;
      });
      if (appFailure != null)
        yield ConfigState.loadingFailed(appFailure!);
      else
        yield ConfigState.loadingSuccess();
    }
  }

  Stream<ConfigState> _getPlansHandler() async* {
    AppFailure? appFailure;
    List<PlanModel>? plans;

    yield ConfigState.loadingInProgress();
    final either = await _configRepository.getPlans();
    either.fold((failure) {
      appFailure = failure;
    }, (value) {
      plans = value;
    });
    if (appFailure != null)
      yield ConfigState.loadingFailed(appFailure!);
    else
      yield ConfigState.loadingPlansSuccess(plans);
  }

  Stream<ConfigState> _getPaymentsHandler() async* {
    AppFailure? appFailure;
    List<PaymentModel>? payments;

    yield ConfigState.loadingInProgress();
    final either = await _configRepository.getPayments();
    either.fold((failure) {
      appFailure = failure;
    }, (value) {
      payments = value;
    });
    if (appFailure != null)
      yield ConfigState.loadingFailed(appFailure!);
    else
      yield ConfigState.loadingPaymentsSuccess(payments);
  }

  Stream<ConfigState> _setLanguageHandler(String lang) async* {
    AppFailure? appFailure;
    Locale? locale;

    final either = await _languageRepository.setLanguage(lang);
    either.fold((failure) {
      appFailure = failure;
    }, (value) {
      locale = value;
      S.load(locale!);
    });
    if (appFailure != null)
      yield ConfigState.loadingFailed(appFailure!);
    else
      yield ConfigState.loadingLanguageSuccess(locale);
  }
}
