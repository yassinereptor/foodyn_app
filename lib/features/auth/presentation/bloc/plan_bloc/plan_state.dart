part of 'plan_bloc.dart';

@freezed
class PlanState with _$PlanState {
  const factory PlanState.initial() = _Initial;
  const factory PlanState.loadingInProgress() = _LoadingInProgress;
  const factory PlanState.loadingSuccess(List<PlanModel>? plans) = _LoadingSuccess;
  const factory PlanState.loadingFailed(AuthFailure failure) = _LoadingFailed;
}
