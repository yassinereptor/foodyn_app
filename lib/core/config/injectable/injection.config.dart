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

import '../../bloc/auth_bloc/auth_bloc.dart' as _i26;
import '../../bloc/config_bloc/config_bloc.dart' as _i27;
import '../../bloc/geolocation_bloc/geolocation_bloc.dart' as _i9;
import '../../bloc/managment_bloc/management_bloc.dart' as _i24;
import '../../bloc/send_bloc/send_bloc.dart' as _i25;
import '../../data/datasources/local/auth_local_data_source.dart' as _i10;
import '../../data/datasources/local/config_local_data_source.dart' as _i12;
import '../../data/datasources/local/language_local_data_source.dart' as _i13;
import '../../data/datasources/remote/auth_remote_data_source.dart' as _i11;
import '../../data/datasources/remote/config_remote_data_source.dart' as _i5;
import '../../data/datasources/remote/management_remote_data_source.dart'
    as _i16;
import '../../data/repositories/auth_repository.dart' as _i19;
import '../../data/repositories/config_repository.dart' as _i21;
import '../../data/repositories/language_repository.dart' as _i15;
import '../../data/repositories/management_repository.dart' as _i23;
import '../../domain/repositories/i_auth_repository.dart' as _i18;
import '../../domain/repositories/i_config_repository.dart' as _i20;
import '../../domain/repositories/i_language_repository.dart' as _i14;
import '../../domain/repositories/i_management_repository.dart' as _i22;
import '../../modules/dio_module.dart' as _i28;
import '../../modules/modules.dart' as _i29;
import '../../network/network_info.dart' as _i17;
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
  gh.factory<_i5.IConfigRemoteDataSource>(
      () => _i5.ConfigRemoteDataSource(get<_i4.GraphQLService>()));
  gh.factory<_i6.InternetConnectionChecker>(
      () => iModules.dataConnectionChecker);
  gh.factory<_i7.Logger>(() => iModules.logger);
  await gh.factoryAsync<_i8.SharedPreferences>(() => iModules.prefs,
      preResolve: true);
  gh.factory<_i9.GeolocationBloc>(() => _i9.GeolocationBloc(get<_i7.Logger>()));
  gh.factory<_i10.IAuthLocalDataSource>(() => _i10.AuthLocalDataSource(
      get<_i4.GraphQLService>(), get<_i8.SharedPreferences>()));
  gh.factory<_i11.IAuthRemoteDataSource>(() => _i11.AuthRemoteDataSource(
      get<_i3.Dio>(),
      get<_i4.GraphQLService>(),
      get<_i10.IAuthLocalDataSource>()));
  gh.factory<_i12.IConfigLocalDataSource>(
      () => _i12.ConfigLocalDataSource(get<_i8.SharedPreferences>()));
  gh.factory<_i13.ILanguageLocalDataSource>(
      () => _i13.LanguageLocalDataSource(get<_i8.SharedPreferences>()));
  gh.factory<_i14.ILanguageRepository>(
      () => _i15.LanguageRepository(get<_i13.ILanguageLocalDataSource>()));
  gh.factory<_i16.IManagementRemoteDataSource>(() =>
      _i16.ManagementRemoteDataSource(get<_i3.Dio>(), get<_i4.GraphQLService>(),
          get<_i10.IAuthLocalDataSource>()));
  gh.lazySingleton<_i17.INetworkInfo>(
      () => _i17.NetworkInfo(get<_i6.InternetConnectionChecker>()));
  gh.factory<_i18.IAuthRepository>(() => _i19.AuthRepository(
      get<_i11.IAuthRemoteDataSource>(),
      get<_i17.INetworkInfo>(),
      get<_i8.SharedPreferences>(),
      get<_i10.IAuthLocalDataSource>()));
  gh.factory<_i20.IConfigRepository>(() => _i21.ConfigRepository(
      get<_i12.IConfigLocalDataSource>(),
      get<_i5.IConfigRemoteDataSource>(),
      get<_i17.INetworkInfo>()));
  gh.factory<_i22.IManagementRepository>(() => _i23.ManagementRepository(
      get<_i16.IManagementRemoteDataSource>(), get<_i17.INetworkInfo>()));
  gh.factory<_i24.ManagementBloc>(() => _i24.ManagementBloc(
      get<_i7.Logger>(), get<_i22.IManagementRepository>()));
  gh.factory<_i25.SendBloc>(
      () => _i25.SendBloc(get<_i7.Logger>(), get<_i18.IAuthRepository>()));
  gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(
      get<_i18.IAuthRepository>(),
      get<_i20.IConfigRepository>(),
      get<_i14.ILanguageRepository>(),
      get<_i7.Logger>()));
  gh.factory<_i27.ConfigBloc>(() => _i27.ConfigBloc(get<_i7.Logger>(),
      get<_i20.IConfigRepository>(), get<_i14.ILanguageRepository>()));
  return get;
}

class _$IDioModule extends _i28.IDioModule {}

class _$IModules extends _i29.IModules {}
