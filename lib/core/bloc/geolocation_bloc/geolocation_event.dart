part of 'geolocation_bloc.dart';

@freezed
abstract class GeolocationEvent with _$GeolocationEvent {
  const factory GeolocationEvent.getGeolocation() = _GetGeolocation;
}