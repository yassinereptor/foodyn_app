import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/data/models/coupon_model.dart';
import 'package:foodyn_eatery/core/data/models/membership_model.dart';
import 'package:foodyn_eatery/core/enums/image.type.dart';
import '../../domain/repositories/i_config_repository.dart';
import '../../domain/repositories/i_language_repository.dart';
import 'package:logger/logger.dart';
import '../../data/models/record_model.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/entities/auth_status.dart';
import '../../domain/repositories/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final IConfigRepository _configRepository;
  final ILanguageRepository _languageRepository;
  final Logger _logger;

  AuthBloc(
    this._authRepository,
    this._configRepository,
    this._languageRepository,
    this._logger,
  ) : super(AuthState(
            type: AuthStateType.initial(), status: AuthStatus.initial()));

  @override
  Stream<AuthState> mapEventToState(AuthEvent gEvent) async* {
    yield* gEvent.when(
      started: () => _startedHandler(),
      login: (email, password) => _loginHandler(email, password),
      register: (email, password) => _registerHandler(email, password),
      forgetPassword: (email) => _forgetPasswordHandler(email),
      logout: () => _logoutHandler(),
      jwtIsExpired: () => _jwtIsExpiredHandler(),
      uploadImage: (type, file) => _uploadImageHandler(type, file),
      updateUser: (profile) => _updateUserHandler(profile),
      saveMembership: (planId, periodId, couponId) => _saveMembershipHandler(planId, periodId, couponId),
      checkCouponStatus: (code) => _checkCouponStatus(code)
    );
  }

  @override
  void onEvent(AuthEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<AuthState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<AuthState> _startedHandler() async* {
    AppFailure? appFailure;
    String? token;
    UserModel? user;
    RecordModel? record;

    yield state.copyWith(type: AuthStateType.loadingInProgress());

    Locale? locale = await _languageRepository.getLanguage();
    (await _authRepository.getToken()).fold((failure) {
      appFailure = failure;
    }, (value) {
      token = value;
    });
    if (appFailure != null)
    {
      yield state.copyWith(
        type: AuthStateType.loadingStartedSuccess(),
        status: locale == null
            ? AuthStatus.firstTime()
            : AuthStatus.unauthenticated(),
        user: user
      );
    }
    else {
      (await _authRepository.getUser()).fold((failure) {
        appFailure = failure;
      }, (value) {
        user = value;
      });
      if (appFailure != null)
        yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
      else {
        (await _configRepository.getLocalRecord()).fold((failure) {
          appFailure = failure;
        }, (value) {
          record = value;
        });
        if (appFailure != null)
          yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
        else {
          (await _configRepository.setRemoteRecord(record)).fold((failure) {
            appFailure = failure;
          }, (value) {
            record = value;
          });
          if (appFailure != null)
            yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
          else yield state.copyWith(
                type: AuthStateType.loadingStartedSuccess(),
                status: AuthStatus.authenticated(),
                user: user,
                token: token,
              );
        }
      }
    }
  }

  Stream<AuthState> _loginHandler(String email, String password) async* {
    AppFailure? appFailure;
    String? token;
    UserModel? user;
    RecordModel? record;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository
        .login(UserModel(email: email, password: password))).fold((failure) {
      appFailure = failure;
    }, (value) {
      token = value.token;
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else {
      (await _authRepository.getUser()).fold((failure) {
        appFailure = failure;
      }, (value) {
        user = value;
      });
      if (appFailure != null)
        yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
      else {
        (await _configRepository.getLocalRecord()).fold((failure) {
          appFailure = failure;
        }, (value) {
          record = value;
        });
        if (appFailure != null)
          yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
        else {
          (await _configRepository.setRemoteRecord(record)).fold((failure) {
            appFailure = failure;
          }, (value) {
            record = value;
          });
          if (appFailure != null)
            yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
          else yield state.copyWith(
                type: AuthStateType.loadingSuccess(),
                status: AuthStatus.authenticated(),
                user: user,
                token: token,
              );
        }
      }
    }
  }

  Stream<AuthState> _registerHandler(String email, String password) async* {
    AppFailure? appFailure;
    UserModel? user = new UserModel(email: email, password: password);
    String? token;
    RecordModel? record;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository.register(user)).fold((failure) {
      appFailure = failure;
    }, (value) {
      token = value.token;
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else {
      (await _authRepository.getUser()).fold((failure) {
        appFailure = failure;
      }, (value) {
        user = value;
      });
      if (appFailure != null)
        yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
      else {
        (await _configRepository.getLocalRecord()).fold((failure) {
          appFailure = failure;
        }, (value) {
          record = value;
        });
        if (appFailure != null)
          yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
        else {
          (await _configRepository.setRemoteRecord(record)).fold((failure) {
            appFailure = failure;
          }, (value) {
            record = value;
          });
          if (appFailure != null)
            yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
          else yield state.copyWith(
                type: AuthStateType.loadingSuccess(),
                status: AuthStatus.authenticated(),
                user: user,
                token: token,
              );
        }
      }
    }
  }

  Stream<AuthState> _forgetPasswordHandler(String email) async* {
    AppFailure? appFailure;
    UserModel user = new UserModel(email: email);

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository.forgetPassword(user)).fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(
          type: AuthStateType.loadingSuccess(),
          status: AuthStatus.unauthenticated(),
          user: null);
  }

  Stream<AuthState> _logoutHandler() async* {
    AppFailure? appFailure;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository.logout()).fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(
          type: AuthStateType.logedOut(),
          status: AuthStatus.unauthenticated(),
          user: null,
          token: null);
  }

  Stream<AuthState> _jwtIsExpiredHandler() async* {
    yield state.copyWith(
        type: AuthStateType.loadingFailed(AppFailure.expiredJwt()));
  }

  Stream<AuthState> _uploadImageHandler(ImageType type, File file) async* {
    AppFailure? appFailure;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository.uploadImage(file)).fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(type: AuthStateType.loadingSuccess());
  }


  Stream<AuthState> _updateUserHandler(UserModel user) async* {
    AppFailure? appFailure;
    UserModel? userModel;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository.updateUser(user)).fold((failure) {
      appFailure = failure;
    }, (value) {
      userModel = value;
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(
                type: AuthStateType.loadingSuccess(),
                status: AuthStatus.authenticated(),
                user: userModel,
              );
  }

  Stream<AuthState> _saveMembershipHandler(int planId, int periodId, int? couponId) async* {
    AppFailure? appFailure;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    (await _authRepository.saveMembership(planId, periodId, couponId)).fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield state.copyWith(type: AuthStateType.loadingFailed(appFailure!));
    else
      yield state.copyWith(
                type: AuthStateType.loadingSuccess(),
              );
  }

  Stream<AuthState> _checkCouponStatus(String code) async* {
    AppFailure? appFailure;
    CouponModel? coupon;

    if (code.isEmpty)
      yield state.copyWith(type: AuthStateType.initial());
    else {
      (await _authRepository.checkCouponStatus(code)).fold((failure) {
        appFailure = failure;
      }, (value) {
        coupon = value;
      });
      if (appFailure != null || coupon == null)
        yield state.copyWith(type: AuthStateType.loadingFailed((appFailure != null) ? appFailure! : AppFailure.local()));
      else
        yield state.copyWith(
                type: AuthStateType.loadingCouponSuccess(coupon),
              );
    }
  }
}
