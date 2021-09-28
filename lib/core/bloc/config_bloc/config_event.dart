part of 'config_bloc.dart';

@freezed
class ConfigEvent with _$ConfigEvent {
  factory ConfigEvent.started() = _Started;
  factory ConfigEvent.getPhoneResource() = _GetResourcePhone;
  factory ConfigEvent.getPlans() = _GetPlans;
  factory ConfigEvent.getPayments() = _GetPayments;
  factory ConfigEvent.setLanguage(String lang) = _SetLanguage;
}