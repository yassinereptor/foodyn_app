// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:logger/logger.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../bloc/auth_bloc/auth_bloc.dart' as _i28;
import '../../bloc/config_bloc/config_bloc.dart' as _i29;
import '../../bloc/geolocation_bloc/geolocation_bloc.dart' as _i12;
import '../../bloc/mail_bloc/mail_bloc.dart' as _i27;
import '../../bloc/otp_bloc/otp_bloc.dart' as _i10;
import '../../bloc/profile_bloc/profile_bloc.dart' as _i22;
import '../../data/datasources/local/auth_local_data_source.dart' as _i13;
import '../../data/datasources/local/config_local_data_source.dart' as _i14;
import '../../data/datasources/local/language_local_data_source.dart' as _i15;
import '../../data/datasources/local/profile_local_data_source.dart' as _i7;
import '../../data/datasources/remote/auth_remote_data_source.dart' as _i5;
import '../../data/datasources/remote/config_remote_data_source.dart' as _i6;
import '../../data/datasources/remote/profile_remote_data_source.dart' as _i19;
import '../../data/repositories/auth_repository.dart' as _i24;
import '../../data/repositories/config_repository.dart' as _i26;
import '../../data/repositories/language_repository.dart' as _i17;
import '../../data/repositories/profile_repository.dart' as _i21;
import '../../domain/repositories/i_auth_repository.dart' as _i23;
import '../../domain/repositories/i_config_repository.dart' as _i25;
import '../../domain/repositories/i_language_repository.dart' as _i16;
import '../../domain/repositories/i_profile_repository.dart' as _i20;
import '../../modules/dio_module.dart' as _i30;
import '../../modules/modules.dart' as _i31;
import '../../network/network_info.dart' as _i18;
import '../../services/graphql_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final iDioModule = _$IDioModule();
  final iModules = _$IModules();
  gh.lazySingleton<_i3.Dio>(() => iDioModule.dio());
  gh.lazySingleton<_i4.GraphQLService>(() => _i4.GraphQLService());
  gh.factory<_i5.IAuthRemoteDataSource>(() =>
      _i5.AuthRemoteDataSource(get<_i3.Dio>(), get<_i4.GraphQLService>()));
  gh.factory<_i6.IConfigRemoteDataSource>(
      () => _i6.ConfigRemoteDataSource(get<_i4.GraphQLService>()));
  gh.factory<_i7.IProfileLocalDataSource>(() => _i7.ProfileLocalDataSource());
  gh.factory<_i8.InternetConnectionChecker>(
      () => iModules.dataConnectionChecker);
  gh.factory<_i9.Logger>(() => iModules.logger);
  gh.factory<_i10.OtpBloc>(() => _i10.OtpBloc(get<_i9.Logger>()));
  await gh.factoryAsync<_i11.SharedPreferences>(() => iModules.prefs,
      preResolve: true);
  gh.factory<_i12.GeolocationBloc>(
      () => _i12.GeolocationBloc(get<_i9.Logger>()));
  gh.factory<_i13.IAuthLocalDataSource>(() => _i13.AuthLocalDataSource(
      get<_i4.GraphQLService>(), get<_i11.SharedPreferences>()));
  gh.factory<_i14.IConfigLocalDataSource>(
      () => _i14.ConfigLocalDataSource(get<_i11.SharedPreferences>()));
  gh.factory<_i15.ILanguageLocalDataSource>(
      () => _i15.LanguageLocalDataSource(get<_i11.SharedPreferences>()));
  gh.factory<_i16.ILanguageRepository>(
      () => _i17.LanguageRepository(get<_i15.ILanguageLocalDataSource>()));
  gh.lazySingleton<_i18.INetworkInfo>(
      () => _i18.NetworkInfo(get<_i8.InternetConnectionChecker>()));
  gh.factory<_i19.IProfileRemoteDataSource>(() => _i19.ProfileRemoteDataSource(
      get<_i3.Dio>(),
      get<_i4.GraphQLService>(),
      get<_i13.IAuthLocalDataSource>()));
  gh.factory<_i20.IProfileRepository>(() => _i21.ProfileRepository(
      get<_i19.IProfileRemoteDataSource>(), get<_i18.INetworkInfo>()));
  gh.factory<_i22.ProfileBloc>(() =>
      _i22.ProfileBloc(get<_i9.Logger>(), get<_i20.IProfileRepository>()));
  gh.factory<_i23.IAuthRepository>(() => _i24.AuthRepository(
      get<_i5.IAuthRemoteDataSource>(),
      get<_i18.INetworkInfo>(),
      get<_i11.SharedPreferences>(),
      get<_i13.IAuthLocalDataSource>()));
  gh.factory<_i25.IConfigRepository>(() => _i26.ConfigRepository(
      get<_i14.IConfigLocalDataSource>(),
      get<_i6.IConfigRemoteDataSource>(),
      get<_i18.INetworkInfo>()));
  gh.factory<_i27.MailBloc>(
      () => _i27.MailBloc(get<_i9.Logger>(), get<_i23.IAuthRepository>()));
  gh.factory<_i28.AuthBloc>(() => _i28.AuthBloc(
      get<_i23.IAuthRepository>(),
      get<_i25.IConfigRepository>(),
      get<_i16.ILanguageRepository>(),
      get<_i9.Logger>()));
  gh.factory<_i29.ConfigBloc>(() => _i29.ConfigBloc(get<_i9.Logger>(),
      get<_i25.IConfigRepository>(), get<_i16.ILanguageRepository>()));
  return get;
}

class _$IDioModule extends _i30.IDioModule {}

class _$IModules extends _i31.IModules {}
