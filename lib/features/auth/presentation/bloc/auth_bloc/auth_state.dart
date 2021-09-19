part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStateType type,
    required AuthStatus status,
    UserModel? user,
    String? token,
    Locale? locale,
  }) = _AuthState;
}

@freezed
abstract class AuthStateType with _$AuthStateType {
  const factory AuthStateType.initial() = _Initial;
  const factory AuthStateType.loadingInProgress() = _LoadingInProgress;
  const factory AuthStateType.loadingSuccess() = _LoadingSuccess;
  const factory AuthStateType.loadingFailed(AuthFailure failure) = _LoadingFailed;
  const factory AuthStateType.logedOut() = _LogedOut;
}
