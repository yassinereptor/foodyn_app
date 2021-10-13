part of 'send_bloc.dart';

@freezed
class SendState with _$SendState {
  const factory SendState.initial() = _Initial;
  const factory SendState.loadingInProgress() = _LoadingInProgress;
  const factory SendState.loadingSuccess(UserModel? user) = _LoadingSuccess;
  const factory SendState.loadingFailed(AppFailure failure) = _LoadingFailed;
}
