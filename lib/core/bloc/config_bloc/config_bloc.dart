import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:foodyn_eatery/core/data/models/eatery_type_model.dart';
import 'package:foodyn_eatery/core/data/models/location_model.dart';
import 'package:foodyn_eatery/core/enums/config.type.dart';
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

  ConfigBloc(this._logger, this._configRepository, this._languageRepository)
      : super(ConfigState(type: ConfigStateType.initial()));

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent gEvent,
  ) async* {
    yield* gEvent.when(
      started: () => _startedHandler(),
      getLocationResource: () => _getLocationResourceHandler(),
      getPlans: () => _getPlansHandler(),
      getPayments: () => _getPaymentsHandler(),
      getEateryTypes: () => _getEateryTypesHandler(),
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
    DateTime? lastRemoteConfig;
    DateTime? lastLocalConfig;
    bool canUpdate = false;
    List<LocationModel>? locationList;

    yield state.copyWith(type: ConfigStateType.loadingInProgress());
    Locale? locale = await _languageRepository.getLanguage();
    if (locale != null) S.load(locale);
    (await _configRepository.getRemoteRecord()).fold((failure) {
      appFailure = failure;
    }, (value) {
      record = value;
    });
    if (appFailure != null)
      yield state.copyWith(type: ConfigStateType.loadingFailed(appFailure!));
    else {
      (await _configRepository.setLocalRecord(record)).fold((failure) {
        appFailure = failure;
      }, (value) {
        record = value;
      });
      if (appFailure != null)
        yield state.copyWith(type: ConfigStateType.loadingFailed(appFailure!));
      else {
        (await _configRepository.getLastRemoteConfig(ConfigType.LOCATION)).fold((failure) {
          appFailure = failure;
        }, (value) {
          lastRemoteConfig = value;
        });
        if (appFailure != null)
          yield state.copyWith(
              type: ConfigStateType.loadingFailed(appFailure!));
        else {
          (await _configRepository.getLastLocalConfig(ConfigType.LOCATION)).fold((failure) {
            appFailure = failure;
          }, (value) {
            lastLocalConfig = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else {
            if (lastRemoteConfig == null ||
                lastLocalConfig == null ||
                (lastRemoteConfig!.compareTo(lastLocalConfig!) > 0))
              canUpdate = true;
            if (canUpdate == false) {
              (await _configRepository.getLocalLocationResource()).fold(
                  (failure) {
                appFailure = failure;
              }, (value) {
                locationList = value;
              });
              if (appFailure != null)
                yield state.copyWith(
                    type: ConfigStateType.loadingFailed(appFailure!));
              else
                yield state.copyWith(
                    type: ConfigStateType.loadingStartedSuccess(),
                    locale: locale,
                    locations: locationList);
            } else {
              (await _configRepository.getRemoteLocationResource()).fold(
                  (failure) {
                appFailure = failure;
              }, (value) {
                locationList = value;
              });
              if (appFailure != null)
                yield state.copyWith(
                    type: ConfigStateType.loadingFailed(appFailure!));
              else {
                (await _configRepository
                        .setLocalLocationResource(locationList!))
                    .fold((failure) {
                  appFailure = failure;
                }, (value) {});
                if (appFailure != null)
                  yield state.copyWith(
                      type: ConfigStateType.loadingFailed(appFailure!));
                else {
                  (await _configRepository
                        .setLastLocalConfig(DateTime.now(), ConfigType.LOCATION))
                    .fold((failure) {
                    appFailure = failure;
                  }, (value) {});
                  if (appFailure != null)
                    yield state.copyWith(
                        type: ConfigStateType.loadingFailed(appFailure!));
                  else
                    yield state.copyWith(
                      type: ConfigStateType.loadingStartedSuccess(),
                      locale: locale,
                      locations: locationList);
                }
              }
            }
          }
        }
      }
    }
  }

  Stream<ConfigState> _getPlansHandler() async* {
    AppFailure? appFailure;
    DateTime? lastRemoteConfig;
    DateTime? lastLocalConfig;
    bool canUpdate = false;
    List<PlanModel>? plans;

    yield state.copyWith(type: ConfigStateType.loadingInProgress());

    (await _configRepository.getLastRemoteConfig(ConfigType.PLAN)).fold((failure) {
      appFailure = failure;
    }, (value) {
      lastRemoteConfig = value;
    });
    if (appFailure != null)
      yield state.copyWith(
          type: ConfigStateType.loadingFailed(appFailure!));
    else {
      (await _configRepository.getLastLocalConfig(ConfigType.PLAN)).fold((failure) {
        appFailure = failure;
      }, (value) {
        lastLocalConfig = value;
      });
      if (appFailure != null)
        yield state.copyWith(
            type: ConfigStateType.loadingFailed(appFailure!));
      else {
        if (lastRemoteConfig == null ||
            lastLocalConfig == null ||
            (lastRemoteConfig!.compareTo(lastLocalConfig!) > 0))
          canUpdate = true;
        if (canUpdate == false) {
          (await _configRepository.getLocalPlans()).fold(
              (failure) {
            appFailure = failure;
          }, (value) {
            plans = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else
            yield state.copyWith(
                type: ConfigStateType.loadingSuccess(),
                plans: plans);
        } else {
          (await _configRepository.getRemotePlans()).fold(
              (failure) {
            appFailure = failure;
          }, (value) {
            plans = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else {
            (await _configRepository
                    .setLocalPlans(plans!))
                .fold((failure) {
              appFailure = failure;
            }, (value) {});
            if (appFailure != null)
              yield state.copyWith(
                  type: ConfigStateType.loadingFailed(appFailure!));
            else {
              (await _configRepository
                    .setLastLocalConfig(DateTime.now(), ConfigType.PLAN))
                .fold((failure) {
                appFailure = failure;
              }, (value) {});
              if (appFailure != null)
                yield state.copyWith(
                    type: ConfigStateType.loadingFailed(appFailure!));
              else
                yield state.copyWith(
                  type: ConfigStateType.loadingSuccess(),
                  plans: plans);
            }
          }
        }
      }
    }
  }

  Stream<ConfigState> _getPaymentsHandler() async* {
    AppFailure? appFailure;
    DateTime? lastRemoteConfig;
    DateTime? lastLocalConfig;
    bool canUpdate = false;
    List<PaymentModel>? payments;

    yield state.copyWith(type: ConfigStateType.loadingInProgress());

    (await _configRepository.getLastRemoteConfig(ConfigType.PAYMENT)).fold((failure) {
      appFailure = failure;
    }, (value) {
      lastRemoteConfig = value;
    });
    if (appFailure != null)
      yield state.copyWith(
          type: ConfigStateType.loadingFailed(appFailure!));
    else {
      (await _configRepository.getLastLocalConfig(ConfigType.PAYMENT)).fold((failure) {
        appFailure = failure;
      }, (value) {
        lastLocalConfig = value;
      });
      if (appFailure != null)
        yield state.copyWith(
            type: ConfigStateType.loadingFailed(appFailure!));
      else {
        if (lastRemoteConfig == null ||
            lastLocalConfig == null ||
            (lastRemoteConfig!.compareTo(lastLocalConfig!) > 0))
          canUpdate = true;
        if (canUpdate == false) {
          (await _configRepository.getLocalPayments()).fold(
              (failure) {
            appFailure = failure;
          }, (value) {
            payments = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else
            yield state.copyWith(
                type: ConfigStateType.loadingSuccess(),
                payments: payments);
        } else {
          (await _configRepository.getRemotePayments()).fold(
              (failure) {
            appFailure = failure;
          }, (value) {
            payments = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else {
            (await _configRepository
                    .setLocalPayments(payments!))
                .fold((failure) {
              appFailure = failure;
            }, (value) {});
            if (appFailure != null)
              yield state.copyWith(
                  type: ConfigStateType.loadingFailed(appFailure!));
            else {
              (await _configRepository
                    .setLastLocalConfig(DateTime.now(), ConfigType.PAYMENT))
                .fold((failure) {
                appFailure = failure;
              }, (value) {});
              if (appFailure != null)
                yield state.copyWith(
                    type: ConfigStateType.loadingFailed(appFailure!));
              else
                yield state.copyWith(
                  type: ConfigStateType.loadingSuccess(),
                  payments: payments);
            }
          }
        }
      }
    }
  }

  Stream<ConfigState> _getEateryTypesHandler() async* {
    AppFailure? appFailure;
    DateTime? lastRemoteConfig;
    DateTime? lastLocalConfig;
    bool canUpdate = false;
    List<EateryTypeModel>? eateryTypes;

    yield state.copyWith(type: ConfigStateType.loadingInProgress());

    (await _configRepository.getLastRemoteConfig(ConfigType.EATERYTYPE)).fold((failure) {
      appFailure = failure;
    }, (value) {
      lastRemoteConfig = value;
    });
    if (appFailure != null)
      yield state.copyWith(
          type: ConfigStateType.loadingFailed(appFailure!));
    else {
      (await _configRepository.getLastLocalConfig(ConfigType.EATERYTYPE)).fold((failure) {
        appFailure = failure;
      }, (value) {
        lastLocalConfig = value;
      });
      if (appFailure != null)
        yield state.copyWith(
            type: ConfigStateType.loadingFailed(appFailure!));
      else {
        if (lastRemoteConfig == null ||
            lastLocalConfig == null ||
            (lastRemoteConfig!.compareTo(lastLocalConfig!) > 0))
          canUpdate = true;
        if (canUpdate == false) {
          (await _configRepository.getLocalEateryTypes()).fold(
              (failure) {
            appFailure = failure;
          }, (value) {
            eateryTypes = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else
            yield state.copyWith(
                type: ConfigStateType.loadingSuccess(),
                eateryTypes: eateryTypes);
        } else {
          (await _configRepository.getRemoteEateryTypes()).fold(
              (failure) {
            appFailure = failure;
          }, (value) {
            eateryTypes = value;
          });
          if (appFailure != null)
            yield state.copyWith(
                type: ConfigStateType.loadingFailed(appFailure!));
          else {
            (await _configRepository
                    .setLocalEateryTypes(eateryTypes!))
                .fold((failure) {
              appFailure = failure;
            }, (value) {});
            if (appFailure != null)
              yield state.copyWith(
                  type: ConfigStateType.loadingFailed(appFailure!));
            else {
              (await _configRepository
                    .setLastLocalConfig(DateTime.now(), ConfigType.EATERYTYPE))
                .fold((failure) {
                appFailure = failure;
              }, (value) {});
              if (appFailure != null)
                yield state.copyWith(
                    type: ConfigStateType.loadingFailed(appFailure!));
              else
                yield state.copyWith(
                  type: ConfigStateType.loadingSuccess(),
                  eateryTypes: eateryTypes);
            }
          }
        }
      }
    }
  }

  Stream<ConfigState> _setLanguageHandler(String lang) async* {
    AppFailure? appFailure;
    Locale? locale;

    yield state.copyWith(type: ConfigStateType.loadingInProgress());
    (await _languageRepository.setLanguage(lang)).fold((failure) {
      appFailure = failure;
    }, (value) {
      locale = value;
      S.load(locale!);
    });
    if (appFailure != null)
      yield state.copyWith(type: ConfigStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(
          type: ConfigStateType.loadingSuccess(), locale: locale);
  }

  Stream<ConfigState> _getLocationResourceHandler() async* {
    AppFailure? appFailure;
    List<LocationModel>? resource;

    yield state.copyWith(type: ConfigStateType.loadingInProgress());
    (await _configRepository.getRemoteLocationResource()).fold((failure) {
      appFailure = failure;
    }, (value) {
      resource = value;
    });
    if (appFailure != null)
      yield state.copyWith(type: ConfigStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(
          type: ConfigStateType.loadingSuccess(), locations: resource);
  }
}
