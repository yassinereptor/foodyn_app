part of 'splash_bloc.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  factory SplashEvent.started() = _Started;
  factory SplashEvent.setLanguage(String lang) = _SetLanguage;
}