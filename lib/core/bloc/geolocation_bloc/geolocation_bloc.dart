import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../config/injectable/injection.dart';
import '../../error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';
part 'geolocation_bloc.freezed.dart';

@injectable
class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  late Logger logger;
  late SharedPreferences prefs;

  GeolocationBloc() : super(_Initial()) {
    this.logger = getIt<Logger>();
    this.prefs = getIt<SharedPreferences>();
  }

  @override
  Stream<GeolocationState> mapEventToState(GeolocationEvent gEvent) async* {
    yield* gEvent.when(
      getGeolocation: () => _getGeolocationHandler(),
    );
  }

  @override
  void onEvent(GeolocationEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<GeolocationState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<GeolocationState> _getGeolocationHandler() async* {
    GeolocationFailure? failure = null;
    late Position position;
    late LatLng latlng;
    bool serviceEnabled;
    LocationPermission permission;

    yield GeolocationState.initial();
    yield GeolocationState.getGeolocationInProgress();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      failure = new GeolocationFailure(status: -1, message: 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        failure = new GeolocationFailure(status: -1, message: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      failure = new GeolocationFailure(status: -1, message: 
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    position = await Geolocator.getCurrentPosition();
    latlng = new LatLng(position.latitude, position.longitude);
    
    if (failure != null)
      yield GeolocationState.getGeolocationFailed(failure);
    else
      yield GeolocationState.getGeolocationSucceed(latlng);
  }
}
