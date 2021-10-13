import 'dart:convert';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/bloc/config_bloc/config_bloc.dart';
import 'package:foodyn_rest/core/data/models/location_model.dart';
import 'package:foodyn_rest/core/data/models/user_model.dart';
import 'package:foodyn_rest/core/utils/resource_utils.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../../../../core/bloc/geolocation_bloc/geolocation_bloc.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../widgets/dropdown_form_widget.dart';
import '../widgets/geolocation_text_form_widget.dart';
import '../widgets/text_form_widget.dart';
import 'geolocation_page.dart';
import 'register_image_page.dart';
import 'verify_otp_page.dart';

class CompleteRegisterPage extends StatefulWidget {
  static const kRouteName = "/complete-register";

  const CompleteRegisterPage({Key? key}) : super(key: key);

  @override
  _CompleteRegisterPageState createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  int _selectedDialCode = 0;
  int _selectedDialCodeIndex = 0;
  int _selectedCountryIndex = 0;
  int _selectedCityIndex = 0;
  String? _selectedCountryName;
  String? _selectedCityName;
  int? _selectedGenderIndex;
  List<LocationModel> _locations = [];
  late GoogleMapController _mapController;
  List<Marker> _markersList = [];
  List<String> _genderList = ["Male", "Female", "Other"];
  LatLng? _selectedMarker;
  late LatLng _defaultSelectedMarker;
  late AuthBloc _authBloc;
  late GeolocationBloc _geolocationBloc;
  late ConfigBloc _configBloc;
  TextEditingController _fullnameTextEditingController =
      new TextEditingController();
  TextEditingController _usernameTextEditingController =
      new TextEditingController();
  TextEditingController _phoneNumberTextEditingController =
      new TextEditingController();
  TextEditingController _adresseTextEditingController =
      new TextEditingController();
  bool _isFirsttimeMap = true;
  UserModel _userModel = new UserModel();
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  List<String> _cities = [];

  @override
  void initState() {
    _defaultSelectedMarker = LatLng(31.6298, -8.0101);
    _geolocationBloc = getIt<GeolocationBloc>();
    _authBloc = context.read<AuthBloc>();
    _configBloc =  context.read<ConfigBloc>();
    if (_configBloc.state.locations != null && _configBloc.state.locations!.isNotEmpty) {
      _locations = _configBloc.state.locations!;
      _locations.sort((a, b) {
        return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
      });
      _cities.clear();
      _locations[_selectedCountryIndex].states!.forEach((element) {
        _cities.addAll(element.cities!);
      });
      _cities.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
    }
    _onFillFields();
    super.initState();
  }

  @override
  void dispose() {
    _geolocationBloc.close();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _addMarker(LatLng latlng) {
    final Marker marker = Marker(
      markerId: MarkerId("main_marker"),
      position: latlng,
      infoWindow: InfoWindow(title: "My Location"),
    );

    setState(() {
      _markersList = [marker];
      _mapController.animateCamera(CameraUpdate.newLatLng(latlng));
    });
  }

  void _onSuccess() {
    Routes.seafarer.navigate(RegisterImagePage.kRouteName);
  }

  void _onError(String? message) {}

  void _onFillFields() {
    if (_authBloc.state.user != null && _authBloc.state.user!.username != null) {
      UserModel userModel = _authBloc.state.user!;
      _usernameTextEditingController.text = userModel.username!;
      _fullnameTextEditingController.text = (userModel.fullname != null) ? userModel.fullname! : "";
      _adresseTextEditingController.text =
          (userModel.adresse != null) ? userModel.adresse! : "";
      _selectedDialCode =
          (userModel.dialCode != null) ? userModel.dialCode! : 145;
      _phoneNumberTextEditingController.text =
          (userModel.phoneNumber != null) ? userModel.phoneNumber! : "";
      _selectedCountryName = userModel.country;
      _selectedCityName = userModel.city;
      _selectedGenderIndex =
          (userModel.gender != null) ? userModel.gender! : 0;
      _selectedMarker =
          (userModel.posLat != null && userModel.posLng != null)
              ? new LatLng(userModel.posLat!, userModel.posLng!)
              : null;
    }
  }

  void _onCompleteRegister() {
    if (_formKey.currentState!.validate() && _authBloc.state.user != null) {
      _userModel.id = (_authBloc.state.user!.username != null)
          ? _authBloc.state.user!.id
          : null;
      _userModel.username= (_usernameTextEditingController.text.isEmpty)
          ? null
          : _usernameTextEditingController.text;
      _userModel.fullname = (_fullnameTextEditingController.text.isEmpty)
          ? null
          : _fullnameTextEditingController.text;
      _userModel.adresse = (_adresseTextEditingController.text.isEmpty)
          ? null
          : _adresseTextEditingController.text;
      _userModel.dialCode = _selectedDialCode;
      _userModel.phoneNumber =
          (_phoneNumberTextEditingController.text.isEmpty)
              ? null
              : _phoneNumberTextEditingController.text;
      _userModel.country = _selectedCountryName;
      _userModel.city = _selectedCityName;
      _userModel.gender = _selectedGenderIndex;
      _userModel.posLat =
          (_selectedMarker == null) ? null : _selectedMarker!.latitude;
      _userModel.posLng =
          (_selectedMarker == null) ? null : _selectedMarker!.longitude;
      _authBloc.add(AuthEvent.updateUser(_userModel));
    }
  }

  void _getGeolocation() {
    _geolocationBloc.add(GeolocationEvent.getGeolocation());
  }

  void _onGeolocationMapClicked() async {
    final results = await Routes.seafarer.navigate(GeolocationPage.kRouteName,
        params: {"latLng": (_markersList.isNotEmpty) ? _selectedMarker : null});
    if (results != null) {
      Marker marker = results[0];
      LatLng latLng = marker.position;
      setState(() {
        _selectedMarker = latLng;
        _addMarker(latLng);
        _isFirsttimeMap = false;
      });
    } else {
      setState(() {
        _selectedMarker = null;
        _isFirsttimeMap = true;
        _markersList = [];
      });
    }
  }

  void _onStateLoadingInProgress() {
    setState(() {
      _showModal = true;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onStateLoadingSuccess() {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      _onModalReset();
      if (_phoneNumberTextEditingController.text.isEmpty) {
        Routes.seafarer.navigate(RegisterImagePage.kRouteName);
      } else {
        Routes.seafarer.navigate(VerifyOtpPage.kRouteName, params: {
          "title": "Verify Phone Number",
          "logout": true,
          "onSuccess": _onSuccess,
          "onError": _onError,
        });
      }
    });
  }

  void _onStateLoadingFailure(AppFailure failure) {
    setState(() {
      _modalType = ModalContainerType.FAILURE;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      _onModalReset();
    });
  }

  void _onModalReset() {
    setState(() {
      _showModal = false;
      _modalType = ModalContainerType.LOADING;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => _geolocationBloc,
          ),
          BlocProvider.value(value: _configBloc),
          BlocProvider.value(value: _authBloc)
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.type.maybeWhen(
                    loadingInProgress: _onStateLoadingInProgress,
                    loadingSuccess: _onStateLoadingSuccess,
                    loadingFailed: _onStateLoadingFailure,
                    orElse: () {});
              },
            ),
            BlocListener<GeolocationBloc, GeolocationState>(
              listener: (context, state) {
                state.maybeWhen(
                    getGeolocationSucceed: (latlng) {
                      _selectedMarker = latlng;
                      _addMarker(latlng);
                      _isFirsttimeMap = false;
                    },
                    getGeolocationFailed: (failure) {},
                    orElse: () {});
              },
            ),
          ],
          child: BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
            Widget myLocationWidgetDefault =
                Icon(Icons.gps_fixed, color: GlobalTheme.kOrangeColor);
            Widget myLocationWidget = myLocationWidgetDefault;

            state.maybeWhen(
                getGeolocationInProgress: () {
                  myLocationWidget = IconButton(
                    onPressed: () {},
                    icon: FlareActor('assets/animations/loading_dark.flr',
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

            return ScaffoldContainerWidget(
              type: _modalType,
              show: _showModal,
              onReset: _onModalReset,
              logout: true,
              back: false,
              title: "Complete your registration",
              subtitle: "*: required",
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormWidget(
                            onChanged: (_) {},
                            hint: "Username *",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '● Please enter a username';
                              }
                              return null;
                            },
                            controller: _usernameTextEditingController,
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormWidget(
                            onChanged: (_) {},
                            hint: "Fullname",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return null;
                            },
                            controller: _fullnameTextEditingController,
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: DropdownFormWidget(
                                  onSelect: (name, index) => setState(() {
                                    _selectedGenderIndex = index;
                                  }),
                                  list: _genderList,
                                  modifyListOutput: (text) => text,
                                  modifySelectedOutput: (text) => text,
                                  searchForm: false,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: DropdownFormWidget(
                                  onSelect: (code, index) => setState(() {
                                    _selectedDialCodeIndex = index;
                                    final jsonResult = json.decode(code);
                                    _selectedDialCode = int.parse(jsonResult["dialCode"]);
                                  }),
                                  defaultIndex: _selectedDialCodeIndex,
                                  list: _locations.map((e) {
                                    return json.encode({
                                      "code": e.code!.toString(),
                                      "dialCode": e.dialCode!.toString(),
                                    });
                                  }).toList(),
                                  modifyListOutput: (text) {
                                    final jsonResult = json.decode(text);
                                    return jsonResult["code"] +
                                        " (+" +
                                        jsonResult["dialCode"] +
                                        ")";
                                  },
                                  modifySelectedOutput: (text) {
                                    final jsonResult = json.decode(text);
                                    return jsonResult["code"] +
                                        " (+" +
                                        jsonResult["dialCode"] +
                                        ")";
                                  },
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TextFormWidget(
                                  onChanged: (_) {},
                                  hint: "Phone number",
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    return null;
                                  },
                                  controller: _phoneNumberTextEditingController,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: GeolocationTextFormWidget(
                            onTap: _onGeolocationMapClicked,
                            controller: _adresseTextEditingController,
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: GlobalTheme.kOrangeColor, width: 1)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MediaQuery(
                                  data: MediaQuery.of(context).copyWith(
                                      size: Size(
                                          MediaQuery.of(context).size.width -
                                              38,
                                          148)),
                                  child: Stack(children: [
                                    GoogleMap(
                                      liteModeEnabled: true,
                                      zoomControlsEnabled: false,
                                      zoomGesturesEnabled: false,
                                      onMapCreated: _onMapCreated,
                                      markers: _markersList.toSet(),
                                      initialCameraPosition: CameraPosition(
                                        target: (_selectedMarker == null)
                                            ? _defaultSelectedMarker
                                            : _selectedMarker!,
                                        zoom: 13.0,
                                      ),
                                      onTap: (_) {
                                        _onGeolocationMapClicked();
                                      },
                                    ),
                                    _isFirsttimeMap
                                        ? InkWell(
                                            onTap: _getGeolocation,
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5.0, sigmaY: 5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Get Your Location",
                                                        style: TextStyle(
                                                            color: isDark(
                                                                    context)
                                                                ? GlobalTheme
                                                                    .kPrimaryColor
                                                                : GlobalTheme
                                                                    .kAccentColor),
                                                      ),
                                                      myLocationWidget,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ])),
                            ),
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: DropdownFormWidget(
                                  onSelect: (name, index) {
                                    setState(() {
                                      _selectedCountryIndex = index;
                                      _selectedCountryName = name;
                                      _cities.clear();
                                      _locations[_selectedCountryIndex].states!.forEach((element) {
                                        _cities.addAll(element.cities!);
                                      });
                                      _cities.sort((a, b) {
                                        return a.toLowerCase().compareTo(b.toLowerCase());
                                      });
                                    });
                                  },
                                  defaultIndex: _selectedCountryIndex,
                                  list: _locations.map((e) => e.name!).toList(),
                                  modifyListOutput: (text) => text,
                                  modifySelectedOutput: (text) => text,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: DropdownFormWidget(
                                  onSelect: (name, index) {
                                    setState(() {
                                      _selectedCityIndex = index;
                                      _selectedCityName = name;
                                    });
                                  },
                                  list: _cities,
                                  defaultIndex: _selectedCityIndex,
                                  modifyListOutput: (text) => text,
                                  modifySelectedOutput: (text) => text,
                                )),
                          ),
                        ],
                      ),
                      ButtonWidget(
                        onTap: _onCompleteRegister,
                        children: [
                          "Continue"
                              .text
                              .xl
                              .color((isDark(context))
                                  ? GlobalTheme.kPrimaryColor
                                  : GlobalTheme.kAccentColor)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
