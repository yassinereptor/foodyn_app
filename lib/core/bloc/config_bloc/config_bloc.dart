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
      getPhoneResource: () => _getPhoneResourceHandler(),
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
    (await _configRepository.getRemoteRecord()).fold((failure) {
      appFailure = failure;
    }, (value) {
      record = value;
    });
    if (appFailure != null)
      yield ConfigState.loadingFailed(appFailure!);
    else
    {
      (await _configRepository.setLocalRecord(record)).fold((failure) {
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
    (await _configRepository.getPlans()).fold((failure) {
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
    (await _configRepository.getPayments()).fold((failure) {
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

    (await _languageRepository.setLanguage(lang)).fold((failure) {
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

  Stream<ConfigState> _getPhoneResourceHandler() async* {
    AppFailure? appFailure;
    List<String>? resource;

    yield ConfigState.loadingInProgress();
    (await _configRepository.getPhoneResource()).fold((failure) {
      appFailure = failure;
    }, (value) {
      resource = value;
    });
    if (appFailure != null)
      yield ConfigState.loadingFailed(appFailure!);
    else
      yield ConfigState.loadingResourcePhoneSuccess(resource);
  }
}
