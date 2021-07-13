part of 'splash_bloc.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    required SplashStateType type,
    required SplashStatus status,
    Locale? locale,
  }) = _SplashState;
}

@freezed
abstract class SplashStateType with _$SplashStateType {
  const factory SplashStateType.initial() = _Initial;
  const factory SplashStateType.getSplashInProgress() = _GetSplashInProgress;
  const factory SplashStateType.getSplashSucceed() = _GetSplashSucceed;
  const factory SplashStateType.getSplashFailed(SplashFailure failure) = _GetSplashFailed;
}
