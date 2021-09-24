import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/bloc/geolocation_bloc/geolocation_bloc.dart';
import '../widgets/geolocation_app_bar_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocationPage extends StatefulWidget {
  static const kRouteName = "/geolocation";
  final LatLng? latLng;

  const GeolocationPage({Key? key, this.latLng}) : super(key: key);

  @override
  _GeolocationPageState createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  late GoogleMapController _mapController;
  late GeolocationBloc _geolocationBloc;
  List<Marker> _markers = [];

  late LatLng _center;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (widget.latLng != null)
      _add(widget.latLng!);
  }

  @override
  void initState() {
    super.initState();
    _geolocationBloc = getIt<GeolocationBloc>();
    _center = LatLng(31.6298, -8.0101);
  }

  @override
  void dispose() {
    _geolocationBloc.close();
    super.dispose();
  }

  void _add(LatLng latlng) {
    final Marker marker = Marker(
      markerId: MarkerId("main_marker"),
      position: latlng,
      infoWindow: InfoWindow(title: "My Location"),
    );

    setState(() {
      _markers = [marker];
      _mapController.animateCamera(CameraUpdate.newLatLng(latlng));
    });
  }

  void _onConfirmationClicked(){
    if (_markers.isNotEmpty)
      Routes.seafarer.pop([_markers.first]);
  }

  void _onDeleteClicked(){
    setState(() {
      _markers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top - 2;

    return BlocProvider(
      create: (context) => _geolocationBloc,
      child: BlocConsumer<GeolocationBloc, GeolocationState>(
        listener: (context, state) {
          state.maybeWhen(
              getGeolocationSucceed: (latlng) {
                _add(latlng);
              },
              getGeolocationFailed: (failure) {
              },
              orElse: () {});
        },
        builder: (context, state) {
          Widget myLocationWidgetDefault = IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.gps_fixed),
              color: GlobalTheme.kOrangeColor,
              onPressed: () =>
                  _geolocationBloc.add(GeolocationEvent.getGeolocation()));
          Widget myLocationWidget = myLocationWidgetDefault;

          state.maybeWhen(
              getGeolocationInProgress: () {
                myLocationWidget = IconButton(
                  onPressed: () {},
                  icon: FlareActor('assets/animations/loading_light.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "start"),
                  padding: EdgeInsets.all(0),
                );
              },
              getGeolocationSucceed: (latlng) {
                myLocationWidget = myLocationWidgetDefault;
              },
              getGeolocationFailed: (failure) {
                myLocationWidget = myLocationWidgetDefault;
              },
              orElse: () {});

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60 + statusBarHeight),
              child: Padding(
                padding:
                    EdgeInsets.only(top: statusBarHeight, left: 20, right: 20),
                child:
                    GeolocationAppBarWidget(myLocationWidget: myLocationWidget),
              ),
            ),
            floatingActionButton: (_markers.isNotEmpty) ?
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn1",
                        onPressed: _onConfirmationClicked,
                        backgroundColor: GlobalTheme.kOrangeColor,
                        child: Icon(
                          Icons.check,
                          color: isDark(context)
                              ? GlobalTheme.kPrimaryColor
                              : GlobalTheme.kAccentColor,
                        )),
                        SizedBox(
                    height: 10,
                  ),
                    FloatingActionButton(
                      heroTag: "btn2",
                        onPressed: _onDeleteClicked,
                        backgroundColor: GlobalTheme.kRedColor,
                        child: Icon(
                          Icons.clear,
                          color: isDark(context)
                              ? GlobalTheme.kPrimaryColor
                              : GlobalTheme.kAccentColor,
                        )),
                  ],
                ) : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            body: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers.toSet(),
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 13.0,
              ),
              onLongPress: (latlng) => _add(latlng),
            ),
          );
        },
      ),
    );
  }
}
