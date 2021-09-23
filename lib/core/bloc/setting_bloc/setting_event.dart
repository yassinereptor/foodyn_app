part of 'setting_bloc.dart';

@freezed
class SettingEvent with _$SettingEvent {
  const factory SettingEvent.getPlans() = _GetPlans;
  const factory SettingEvent.getPayments() = _GetPayments;
}