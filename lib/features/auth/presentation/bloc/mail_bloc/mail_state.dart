part of 'mail_bloc.dart';

@freezed
class MailState with _$MailState {
  const factory MailState.initial() = _Initial;
  const factory MailState.loadingInProgress() = _LoadingInProgress;
  const factory MailState.loadingSuccess(UserModel? user) = _LoadingSuccess;
  const factory MailState.loadingFailed(AuthFailure failure) = _LoadingFailed;
}
