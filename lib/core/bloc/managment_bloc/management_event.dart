part of 'management_bloc.dart';

@freezed
class ManagementEvent with _$ManagementEvent {
  const factory ManagementEvent.started() = _Started;
  const factory ManagementEvent.getEateries() = _GetEateries;
  const factory ManagementEvent.getEatery(int id) = _GetEatery;
  const factory ManagementEvent.addEatery(EateryModel eateryModel, List<File> files) = _AddEatery;
}