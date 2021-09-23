part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.loadingInProgress() = _LoadingInProgress;
  const factory SettingState.loadingPlansSuccess(List<PlanModel>? plans) = _LoadingPlansSuccess;
  const factory SettingState.loadingPaymentsSuccess(List<PaymentModel>? payments) = _LoadingPaymentsSuccess;
  const factory SettingState.loadingFailed(AuthFailure failure) = _LoadingFailed;
}
