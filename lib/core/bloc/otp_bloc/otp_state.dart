part of 'otp_bloc.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loadingSending() = _LoadingSending;
  const factory OtpState.loadingSent() = _LoadingSent;
  const factory OtpState.loadingInProgress() = _LoadingInProgress;
  const factory OtpState.loadingSuccess() = _LoadingSuccess;
  const factory OtpState.loadingFailed(AuthFailure failure) = _LoadingFailed;
}
