part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStateType type,
    required AuthStatus status,
    UserModel? user,
    String? token
  }) = _AuthState;
}

@freezed
abstract class AuthStateType with _$AuthStateType {
  const factory AuthStateType.initial() = _Initial;
  const factory AuthStateType.loadingInProgress() = _LoadingInProgress;
  const factory AuthStateType.loadingSuccess() = _LoadingSuccess;
  const factory AuthStateType.loadingStartedSuccess() = _LoadingStartedSuccess;
  const factory AuthStateType.loadingFailed(AppFailure failure) = _LoadingFailed;
  const factory AuthStateType.logedOut() = _LogedOut;
  const factory AuthStateType.loadingCouponSuccess(CouponModel? coupon) = _LoadingCouponSuccess;
}
