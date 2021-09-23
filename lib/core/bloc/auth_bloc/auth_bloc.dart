import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/datasources/authentication_local_data_source.dart';
import '../../data/models/auth_response_model.dart';
import '../../data/models/record_model.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/auth_failure.dart';
import '../../domain/entities/auth_status.dart';
import '../../domain/repositories/i_authentication_repository.dart';
import '../../l10n/l10n.dart';
import '../../services/graphql_service.dart';
import '../../../features/splash/domain/repositories/i_language_repository.dart';
import '../../../features/splash/domain/repositories/i_settings_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository authenticationRepository;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;
  final ILanguageRepository languageRepository;
  final ISettingsRepository settingsRepository;
  final Logger logger;
  final GraphQLService graphQL;
  final SharedPreferences prefs;

  AuthBloc(
    this.authenticationRepository,
    this.authenticationLocalDataSource,
    this.languageRepository,
    this.settingsRepository,
    this.graphQL,
    this.prefs,
    this.logger,
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
      setLanguage: (lang) => _setLanguageHandler(lang),
    );
  }

  @override
  void onEvent(AuthEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<AuthState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<AuthState> _startedHandler() async* {
    bool failed = false;
    AuthFailure? failure;
    AuthResponseModel? authResponseModel;
    UserModel? userModel;
    RecordModel? recordModel;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    Locale? locale = await languageRepository.getLanguage();
    if (locale != null) S.load(locale);
    final either = await settingsRepository.loadSettings();
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      recordModel = r;
      authenticationLocalDataSource.saveRecord(r);
    });
    if (failed)
      yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
    else {
      authResponseModel = await authenticationLocalDataSource.getToken();
      if (authResponseModel != null) {
        final recordEither =
            await authenticationRepository.saveRecord(recordModel!);
        recordEither.fold((l) {
          failed = true;
          failure = l;
        }, (r) {
          failed = false;
          authenticationLocalDataSource.saveRecord(r!);
        });
        if (failed)
          yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
        else {
          final userEither = await authenticationRepository.getUser();
          userEither.fold((l) {
            failed = true;
            failure = l;
          }, (r) {
            failed = false;
            userModel = r;
          });
          if (failed)
            yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
          else
            yield state.copyWith(
              type: AuthStateType.loadingSuccess(),
              status: AuthStatus.authenticated(),
              locale: locale,
              user: userModel,
              token: authResponseModel.token,
            );
        }
      } else
        yield state.copyWith(
          type: AuthStateType.loadingSuccess(),
          status: locale == null
              ? AuthStatus.firstTime()
              : AuthStatus.unauthenticated(),
          locale: locale,
          user: userModel,
        );
    }
  }

  Stream<AuthState> _loginHandler(String email, String password) async* {
    bool failed = false;
    AuthFailure? failure;
    String? token;
    UserModel? userModel;
    RecordModel? recordModel;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    final either = await authenticationRepository
        .login(UserModel(email: email, password: password));
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      token = r.token;
    });
    if (failed)
      yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
    else {
      recordModel = await authenticationLocalDataSource.getRecord();
      if (recordModel == null)
        yield state.copyWith(
            type: AuthStateType.loadingFailed(AuthFailure.local()));
      else {
        await authenticationLocalDataSource.getToken();
        final recordEither =
            await authenticationRepository.saveRecord(recordModel);
        recordEither.fold((l) {
          failed = true;
          failure = l;
        }, (r) {
          failed = false;
          authenticationLocalDataSource.saveRecord(r!);
        });
        if (failed)
          yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
        else {
          final userEither = await authenticationRepository.getUser();
          userEither.fold((l) {
            failed = true;
            failure = l;
          }, (r) {
            failed = false;
            userModel = r;
          });
          if (failed)
            yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
          else
            yield state.copyWith(
              type: AuthStateType.loadingSuccess(),
              status: AuthStatus.authenticated(),
              user: userModel,
              token: token,
            );
        }
      }
    }
  }

  Stream<AuthState> _registerHandler(String email, String password) async* {
    bool failed = false;
    AuthFailure? failure;
    UserModel? userModel = new UserModel(email: email, password: password);
    String? token;
    RecordModel? recordModel;

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    final either = await authenticationRepository.register(userModel);
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      token = r.token;
    });
    if (failed)
      yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
    else {
      recordModel = await authenticationLocalDataSource.getRecord();
      if (recordModel == null)
        yield state.copyWith(
            type: AuthStateType.loadingFailed(AuthFailure.local()));
      else {
        await authenticationLocalDataSource.getToken();
        final recordEither =
            await authenticationRepository.saveRecord(recordModel);
        recordEither.fold((l) {
          failed = true;
          failure = l;
        }, (r) {
          failed = false;
          authenticationLocalDataSource.saveRecord(r!);
        });
        if (failed)
          yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
        else {
          final userEither = await authenticationRepository.getUser();
          userEither.fold((l) {
            failed = true;
            failure = l;
          }, (r) {
            failed = false;
            userModel = r;
          });
          if (failed)
            yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
          else
            yield state.copyWith(
              type: AuthStateType.loadingSuccess(),
              status: AuthStatus.authenticated(),
              user: userModel,
              token: token,
            );
        }
      }
    }
  }

  Stream<AuthState> _forgetPasswordHandler(String email) async* {
    bool failed = false;
    AuthFailure? failure;
    UserModel user = new UserModel(email: email);

    yield state.copyWith(type: AuthStateType.loadingInProgress());
    final either = await authenticationRepository.forgetPassword(user);
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
    });
    if (failed)
      yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
    else
      yield state.copyWith(
          type: AuthStateType.loadingSuccess(),
          status: AuthStatus.unauthenticated(),
          user: null);
  }

  Stream<AuthState> _logoutHandler() async* {
    bool failed = false;
    AuthFailure? failure;
    yield state.copyWith(type: AuthStateType.loadingInProgress());

    final either = await authenticationRepository.logout();
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
    });
    if (failed)
      yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
    else
      yield state.copyWith(
          type: AuthStateType.logedOut(),
          status: AuthStatus.unauthenticated(),
          user: null,
          token: null);
  }

  Stream<AuthState> _jwtIsExpiredHandler() async* {
    yield state.copyWith(
        type: AuthStateType.loadingFailed(AuthFailure.expiredJwt()));
  }

  Stream<AuthState> _setLanguageHandler(String lang) async* {
    bool failed = false;
    AuthFailure? failure;
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
        yield state.copyWith(type: AuthStateType.loadingFailed(failure!));
      else {
        S.load(locale!);
        yield state.copyWith(
            type: AuthStateType.loadingSuccess(), locale: locale!);
      }
    }
  }
}
