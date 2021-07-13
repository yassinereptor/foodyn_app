part of 'languages_bloc.dart';

@freezed
abstract class LanguagesEvent with _$LanguagesEvent {
  const factory LanguagesEvent.started() = _Started;
}