part of 'languages_bloc.dart';

@freezed
abstract class LanguagesState with _$LanguagesState {
  const factory LanguagesState.initial() = _Initial;
  const factory LanguagesState.getLanguagesInProgress() = _GetLanguagesInProgress;
  const factory LanguagesState.getLanguagesSucceed() = _GetLanguagesSucceed;
  const factory LanguagesState.getLanguagesFailed() = _GetLanguagesFailed;
}
