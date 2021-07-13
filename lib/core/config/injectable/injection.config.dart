// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../../features/languages/presentation/bloc/languages_bloc/languages_bloc.dart'
    as _i11;
import '../../../features/splash/data/datasources/language_local_data_source.dart'
    as _i7;
import '../../../features/splash/data/repositories/language_repository.dart'
    as _i9;
import '../../../features/splash/domain/repositories/i_language_repository.dart'
    as _i8;
import '../../../features/splash/presentation/bloc/splash_bloc/splash_bloc.dart'
    as _i12;
import '../../modules/dio_module.dart' as _i13;
import '../../modules/modules.dart' as _i14;
import '../../network/network_info.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final iDioModule = _$IDioModule();
  final iModules = _$IModules();
  gh.lazySingleton<_i3.Dio>(() => iDioModule.dio());
  gh.factory<_i4.InternetConnectionChecker>(
      () => iModules.dataConnectionChecker);
  gh.factory<_i5.Logger>(() => iModules.logger);
  await gh.factoryAsync<_i6.SharedPreferences>(() => iModules.prefs,
      preResolve: true);
  gh.factory<_i7.ILanguageLocalDataSource>(
      () => _i7.LanguageLocalDataSource(get<_i6.SharedPreferences>()));
  gh.factory<_i8.ILanguageRepository>(
      () => _i9.LanguageRepository(get<_i7.ILanguageLocalDataSource>()));
  gh.lazySingleton<_i10.INetworkInfo>(
      () => _i10.NetworkInfo(get<_i4.InternetConnectionChecker>()));
  gh.factory<_i11.LanguagesBloc>(() =>
      _i11.LanguagesBloc(get<_i6.SharedPreferences>(), get<_i5.Logger>()));
  gh.factory<_i12.SplashBloc>(() => _i12.SplashBloc(
      get<_i6.SharedPreferences>(),
      get<_i5.Logger>(),
      get<_i8.ILanguageRepository>()));
  return get;
}

class _$IDioModule extends _i13.IDioModule {}

class _$IModules extends _i14.IModules {}
