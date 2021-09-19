part of 'geolocation_bloc.dart';

@freezed
abstract class GeolocationState with _$GeolocationState {
  const factory GeolocationState.initial() = _Initial;
  const factory GeolocationState.getGeolocationInProgress() = _GetGeolocationInProgress;
  const factory GeolocationState.getGeolocationSucceed(LatLng latlng) = _GetGeolocationSucceed;
  const factory GeolocationState.getGeolocationFailed(GeolocationFailure failure) = _GetGeolocationFailed;
}
