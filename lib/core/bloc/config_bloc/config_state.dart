part of 'config_bloc.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState.initial() = _Initial;
  const factory ConfigState.loadingInProgress() = _LoadingInProgress;
  const factory ConfigState.loadingPlansSuccess(List<PlanModel>? plans) = _LoadingPlansSuccess;
  const factory ConfigState.loadingPaymentsSuccess(List<PaymentModel>? payments) = _LoadingPaymentsSuccess;
  const factory ConfigState.loadingLanguageSuccess(Locale? locale) = _LoadingLanguageSuccess;
  const factory ConfigState.loadingResourcePhoneSuccess(List<String>? resource) = _LoadingResourcePhoneSuccess;
  const factory ConfigState.loadingSuccess() = _LoadingSuccess;
  const factory ConfigState.loadingFailed(AppFailure failure) = _LoadingFailed;
}
