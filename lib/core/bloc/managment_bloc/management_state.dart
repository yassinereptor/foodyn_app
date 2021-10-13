part of 'management_bloc.dart';

@freezed
abstract class ManagementState with _$ManagementState {
  const factory ManagementState({
    required ManagementStateType type,
    List<EateryModel>? eateries,
    List<UserModel>? users,
  }) = _ManagementState;
}

@freezed
abstract class ManagementStateType with _$ManagementStateType {
  const factory ManagementStateType.initial() = _Initial;
  const factory ManagementStateType.loadingInProgress() = _LoadingInProgress;
  const factory ManagementStateType.loadingSuccess() = _LoadingSuccess;
  const factory ManagementStateType.loadingFailed(AppFailure failure) = _LoadingFailed;
}
