part of 'config_bloc.dart';

@freezed
abstract class ConfigState with _$ConfigState {
  const factory ConfigState({
    required ConfigStateType type,
    Locale? locale,
    List<PlanModel>? plans,
    List<PaymentModel>? payments,
    List<EateryTypeModel>? eateryTypes,
    List<LocationModel>? locations,
  }) = _ConfigState;
}

@freezed
abstract class ConfigStateType with _$ConfigStateType {
  const factory ConfigStateType.initial() = _Initial;
  const factory ConfigStateType.loadingInProgress() = _LoadingInProgress;
  const factory ConfigStateType.loadingSuccess() = _LoadingSuccess;
  const factory ConfigStateType.loadingStartedSuccess() = _LoadingStartedSuccess;
  const factory ConfigStateType.loadingFailed(AppFailure failure) = _LoadingFailed;
}