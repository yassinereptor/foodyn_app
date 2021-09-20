// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../../features/auth/data/datasources/authentication_local_data_source.dart'
    as _i9;
import '../../../features/auth/data/datasources/authentication_remote_data_source.dart'
    as _i10;
import '../../../features/auth/data/repositories/authentication_repository.dart'
    as _i20;
import '../../../features/auth/domain/repositories/i_authentication_repository.dart'
    as _i19;
import '../../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i25;
import '../../../features/auth/presentation/bloc/geolocation_bloc/geolocation_bloc.dart'
    as _i4;
import '../../../features/auth/presentation/bloc/mail_bloc/mail_bloc.dart'
    as _i21;
import '../../../features/auth/presentation/bloc/otp_bloc/otp_bloc.dart'
    as _i22;
import '../../../features/auth/presentation/bloc/plan_bloc/plan_bloc.dart'
    as _i23;
import '../../../features/auth/presentation/bloc/profile_bloc/profile_bloc.dart'
    as _i24;
import '../../../features/languages/presentation/bloc/languages_bloc/languages_bloc.dart'
    as _i18;
import '../../../features/splash/data/datasources/language_local_data_source.dart'
    as _i11;
import '../../../features/splash/data/datasources/settings_data_source.dart'
    as _i15;
import '../../../features/splash/data/repositories/language_repository.dart'
    as _i13;
import '../../../features/splash/data/repositories/settings_repository.dart'
    as _i17;
import '../../../features/splash/domain/repositories/i_language_repository.dart'
    as _i12;
import '../../../features/splash/domain/repositories/i_settings_repository.dart'
    as _i16;
import '../../modules/dio_module.dart' as _i26;
import '../../modules/modules.dart' as _i27;
import '../../network/network_info.dart' as _i14;
import '../../services/graphql_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final iDioModule = _$IDioModule();
  final iModules = _$IModules();
  gh.lazySingleton<_i3.Dio>(() => iDioModule.dio());
  gh.factory<_i4.GeolocationBloc>(() => _i4.GeolocationBloc());
  gh.lazySingleton<_i5.GraphQLService>(() => _i5.GraphQLService());
  gh.factory<_i6.InternetConnectionChecker>(
      () => iModules.dataConnectionChecker);
  gh.factory<_i7.Logger>(() => iModules.logger);
  await gh.factoryAsync<_i8.SharedPreferences>(() => iModules.prefs,
      preResolve: true);
  gh.factory<_i9.IAuthenticationLocalDataSource>(() =>
      _i9.AuthenticationLocalDataSource(
          get<_i5.GraphQLService>(), get<_i8.SharedPreferences>()));
  gh.factory<_i10.IAuthenticationRemoteDataSource>(() =>
      _i10.AuthenticationRemoteDataSource(
          get<_i3.Dio>(),
          get<_i5.GraphQLService>(),
          get<_i9.IAuthenticationLocalDataSource>()));
  gh.factory<_i11.ILanguageLocalDataSource>(
      () => _i11.LanguageLocalDataSource(get<_i8.SharedPreferences>()));
  gh.factory<_i12.ILanguageRepository>(
      () => _i13.LanguageRepository(get<_i11.ILanguageLocalDataSource>()));
  gh.lazySingleton<_i14.INetworkInfo>(
      () => _i14.NetworkInfo(get<_i6.InternetConnectionChecker>()));
  gh.factory<_i15.ISettingsLocalDataSource>(
      () => _i15.SettingsLocalDataSource(get<_i8.SharedPreferences>()));
  gh.factory<_i16.ISettingsRepository>(
      () => _i17.SettingsRepository(get<_i15.ISettingsLocalDataSource>()));
  gh.factory<_i18.LanguagesBloc>(() =>
      _i18.LanguagesBloc(get<_i8.SharedPreferences>(), get<_i7.Logger>()));
  gh.factory<_i19.IAuthenticationRepository>(() =>
      _i20.AuthenticationRepository(
          get<_i10.IAuthenticationRemoteDataSource>(),
          get<_i14.INetworkInfo>(),
          get<_i8.SharedPreferences>(),
          get<_i9.IAuthenticationLocalDataSource>()));
  gh.factory<_i21.MailBloc>(() => _i21.MailBloc(
      get<_i7.Logger>(),
      get<_i5.GraphQLService>(),
      get<_i9.IAuthenticationLocalDataSource>(),
      get<_i19.IAuthenticationRepository>()));
  gh.factory<_i22.OtpBloc>(() => _i22.OtpBloc(
      get<_i7.Logger>(),
      get<_i5.GraphQLService>(),
      get<_i9.IAuthenticationLocalDataSource>(),
      get<_i19.IAuthenticationRepository>()));
  gh.factory<_i23.PlanBloc>(() => _i23.PlanBloc(
      get<_i7.Logger>(),
      get<_i5.GraphQLService>(),
      get<_i9.IAuthenticationLocalDataSource>(),
      get<_i19.IAuthenticationRepository>()));
  gh.factory<_i24.ProfileBloc>(() => _i24.ProfileBloc(
      get<_i7.Logger>(),
      get<_i5.GraphQLService>(),
      get<_i9.IAuthenticationLocalDataSource>(),
      get<_i19.IAuthenticationRepository>()));
  gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(
      get<_i19.IAuthenticationRepository>(),
      get<_i9.IAuthenticationLocalDataSource>(),
      get<_i12.ILanguageRepository>(),
      get<_i16.ISettingsRepository>(),
      get<_i5.GraphQLService>(),
      get<_i8.SharedPreferences>(),
      get<_i7.Logger>()));
  return get;
}

class _$IDioModule extends _i26.IDioModule {}

class _$IModules extends _i27.IModules {}
