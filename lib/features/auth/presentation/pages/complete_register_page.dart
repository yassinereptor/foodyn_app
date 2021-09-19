import 'dart:convert';
import 'dart:ui';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/injectable/injection.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/models/profile_model.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/widgets/modal_container_widget.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/geolocation_bloc/geolocation_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/geolocation_page.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/verify_otp_page.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/bottom_sheet_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/dropdown_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/geolocation_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import 'choose_plan_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class CompleteRegisterPage extends StatefulWidget {
  static const kRouteName = "/complete-register";

  const CompleteRegisterPage({Key? key}) : super(key: key);

  @override
  _CompleteRegisterPageState createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  int _selectedDialCodeIndex = 0;
  int _selectedCountryIndex = 0;
  int _selectedGenderIndex = 0;
  List<String> _phoneCodes = [
    '{"name": "Morocco","dialCode": "+212","code": "MA"}'
  ];
  late GoogleMapController _mapController;
  List<Marker> _markersList = [];
  List<String> _genderList = ["Male", "Female", "Other"];
  LatLng? _selectedMarker;
  late LatLng _defaultSelectedMarker;
  late AuthBloc _authBloc;
  late ProfileBloc _profileBloc;
  late GeolocationBloc _geolocationBloc;
  TextEditingController _fullnameTextEditingController =
      new TextEditingController();
  TextEditingController _phoneNumberTextEditingController =
      new TextEditingController();
  TextEditingController _adresseTextEditingController =
      new TextEditingController();
  TextEditingController _cityTextEditingController =
      new TextEditingController();
  TextEditingController _zipCodeTextEditingController =
      new TextEditingController();
  bool _isFirsttimeMap = true;
  ProfileModel _profileModel = new ProfileModel();
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

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
    if (_authBloc.state.user != null && _authBloc.state.user!.profile != null) {
      ProfileModel profileModel = _authBloc.state.user!.profile!;
      _fullnameTextEditingController.text = profileModel.fullname!;
       _adresseTextEditingController.text = (profileModel.adresse != null) ? profileModel.adresse! : "";
      _selectedDialCodeIndex = (profileModel.dialCode != null) ? profileModel.dialCode! : 145;
       _phoneNumberTextEditingController.text = (profileModel.phoneNumber != null) ? profileModel.phoneNumber! : "";
      _selectedCountryIndex = (profileModel.country != null) ? profileModel.country! : 145;
      _cityTextEditingController.text = (profileModel.city != null) ? profileModel.city! : "";
      _zipCodeTextEditingController.text = (profileModel.zipCode != null) ? profileModel.zipCode!.toString() : "";
      _selectedGenderIndex = (profileModel.gender != null) ? profileModel.gender! : 0;
      _selectedMarker = (profileModel.posLat != null && profileModel.posLng != null) ? new LatLng(profileModel.posLat!, profileModel.posLng!) : null;
    }
  }

  void _onCompleteRegister() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate() && _authBloc.state.user != null) {
      _profileModel.id = (_authBloc.state.user!.profile != null) ? _authBloc.state.user!.profile!.id : null;
      _profileModel.fullname = (_fullnameTextEditingController.text.isEmpty)
          ? null
          : _fullnameTextEditingController.text;
      _profileModel.adresse = (_adresseTextEditingController.text.isEmpty)
          ? null
          : _adresseTextEditingController.text;
      _profileModel.dialCode = _selectedDialCodeIndex;
      _profileModel.phoneNumber =
          (_phoneNumberTextEditingController.text.isEmpty)
              ? null
              : _phoneNumberTextEditingController.text;
      _profileModel.country = _selectedCountryIndex;
      _profileModel.city = (_cityTextEditingController.text.isEmpty)
          ? null
          : _cityTextEditingController.text;
      _profileModel.zipCode = (_zipCodeTextEditingController.text.isEmpty)
          ? null
          : int.parse(_zipCodeTextEditingController.text.toString());
      _profileModel.gender = _selectedGenderIndex;
      _profileModel.posLat =
          (_selectedMarker == null) ? null : _selectedMarker!.latitude;
      _profileModel.posLng =
          (_selectedMarker == null) ? null : _selectedMarker!.longitude;
      _profileBloc.add(ProfileEvent.saveProfile(_profileModel));
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
    }
    else {
      setState(() {
        _selectedMarker = null;
        _isFirsttimeMap = true;
        _markersList = [];
      });
    }
  }

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString("assets/raw/phone.json")
        .then((value) {
      final jsonResult = json.decode(value);
      setState(() {
        _phoneCodes = [...jsonResult.map((item) => json.encode(item))];
        _selectedCountryIndex = _selectedDialCodeIndex = 145;
      });
    });
    _defaultSelectedMarker = LatLng(31.6298, -8.0101);
    _authBloc = context.read<AuthBloc>();
    _geolocationBloc = getIt<GeolocationBloc>();
    _profileBloc = getIt<ProfileBloc>();
    _onFillFields();
    super.initState();
  }

  @override
  void dispose() {
    _geolocationBloc.close();
    super.dispose();
  }

  
  void _onTypeloadingInProgress () {
    
  }

  void _onTypeloadingSuccess () {
  }

  void _onTypeloadingProfileSuccess (ProfileModel? profile) {
    _authBloc.state.user!.profile = profile;
    setState(() {
        _modalType = ModalContainerType.SUCCESS;
    });
      Future.delayed(Duration(milliseconds: 2000), () {
        setState(() {
          _showModal = false;
          _modalType = ModalContainerType.LOADING;
        });
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

  void _onTypeloadingFailure (AuthFailure failure) {
    setState(() {
      _modalType = ModalContainerType.FAILURE;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _showModal = false;
        _modalType = ModalContainerType.LOADING;
      });
    });
  }

  void _modalReset() {
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
          BlocProvider(
            create: (context) => _authBloc,
          ),
          BlocProvider(
            create: (context) => _profileBloc,
          )
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                state.maybeWhen(
                  loadingInProgress: _onTypeloadingInProgress,
                  loadingSuccess: _onTypeloadingSuccess,
                  loadingProfileSuccess: _onTypeloadingProfileSuccess,
                  loadingFailed: _onTypeloadingFailure,
                  orElse: (){}
                );
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
                    getGeolocationFailed: (failure) {
                    },
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

            return Scaffold(
                body: ModalContainerWidget(
                onLoading: _modalReset,
                onSucceed: _modalReset,
                onFailed: _modalReset,
                type: _modalType,
                show: _showModal,
                child: SafeArea(
                              child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverAppBarWidget(logout: true, back: false),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Container(
                            child: Column(
                              children: [
                                ResendEmailWidget(),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 15),
                                      child: "Complete your registration"
                                          .text
                                          .xl2
                                          .make(),
                                    ),
                                  ],
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 15),
                                            child: "*: required".text.sm.make(),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: TextFormWidget(
                                            onChanged: (_) {},
                                            hint: "Full name *",
                                            keyboardType: TextInputType.name,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return '● Please enter your full name';
                                              }
                                              return null;
                                            },
                                            controller:
                                                _fullnameTextEditingController,
                                          )),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: DropdownFormWidget(
                                                  onSelect: (index) =>
                                                      setState(() {
                                                    _selectedGenderIndex = index;
                                                  }),
                                                  list: _genderList,
                                                  defaultIndex:
                                                      _selectedGenderIndex,
                                                  modifyListOutput: (text) =>
                                                      text,
                                                  modifySelectedOutput: (text) =>
                                                      text,
                                                  searchForm: false,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: DropdownFormWidget(
                                                  onSelect: (index) =>
                                                      setState(() {
                                                    _selectedDialCodeIndex =
                                                        index;
                                                  }),
                                                  list: _phoneCodes,
                                                  defaultIndex:
                                                      _selectedDialCodeIndex,
                                                  modifyListOutput: (text) {
                                                    final jsonResult =
                                                        json.decode(text);
                                                    return jsonResult["name"] +
                                                        " (" +
                                                        jsonResult["dialCode"] +
                                                        ")";
                                                  },
                                                  modifySelectedOutput: (text) {
                                                    final jsonResult =
                                                        json.decode(text);
                                                    return jsonResult["code"] +
                                                        " (" +
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
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: TextFormWidget(
                                                  onChanged: (_) {},
                                                  hint: "Phone number",
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  validator: (value) {
                                                    // if (value == null ||
                                                    //     value.isEmpty) {
                                                    //   return '● Please enter some text';
                                                    // }
                                                    return null;
                                                  },
                                                  controller:
                                                      _phoneNumberTextEditingController,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: GeolocationTextFormWidget(
                                            onTap: _onGeolocationMapClicked,
                                            controller:
                                                _adresseTextEditingController,
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        GlobalTheme.kOrangeColor,
                                                    width: 1)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: MediaQuery(
                                                  data: MediaQuery.of(context)
                                                      .copyWith(
                                                          size: Size(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  38,
                                                              148)),
                                                  child: Stack(children: [
                                                    GoogleMap(
                                                      liteModeEnabled: true,
                                                      zoomControlsEnabled: false,
                                                      zoomGesturesEnabled: false,
                                                      onMapCreated: _onMapCreated,
                                                      markers:
                                                          _markersList.toSet(),
                                                      initialCameraPosition:
                                                          CameraPosition(
                                                        target: (_selectedMarker ==
                                                                null)
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
                                                            onTap:
                                                                _getGeolocation,
                                                            child: BackdropFilter(
                                                              filter: ImageFilter
                                                                  .blur(
                                                                      sigmaX: 5.0,
                                                                      sigmaY:
                                                                          5.0),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            .5)),
                                                                child: Center(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "Get Your Location",
                                                                        style: TextStyle(
                                                                            color: isDark(context)
                                                                                ? GlobalTheme.kPrimaryColor
                                                                                : GlobalTheme.kAccentColor),
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
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: DropdownFormWidget(
                                                  onSelect: (index) {
                                                    setState(() {
                                                      _selectedCountryIndex =
                                                          index;
                                                    });
                                                  },
                                                  list: _phoneCodes,
                                                  defaultIndex:
                                                      _selectedCountryIndex,
                                                  modifyListOutput: (text) {
                                                    final jsonResult =
                                                        json.decode(text);
                                                    return jsonResult["name"];
                                                  },
                                                  modifySelectedOutput: (text) {
                                                    final jsonResult =
                                                        json.decode(text);
                                                    return jsonResult["name"] +
                                                        " (" +
                                                        jsonResult["code"] +
                                                        ")";
                                                  },
                                                )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: TextFormWidget(
                                                  onChanged: (_) {},
                                                  hint: "City",
                                                  keyboardType:
                                                      TextInputType.text,
                                                  validator: (value) {
                                                    // if (value == null ||
                                                    //     value.isEmpty) {
                                                    //   return '● Please enter some text';
                                                    // }
                                                    return null;
                                                  },
                                                  controller:
                                                      _cityTextEditingController,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: TextFormWidget(
                                                  onChanged: (_) {},
                                                  hint: "Zip Code",
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    // if (value == null ||
                                                    //     value.isEmpty) {
                                                    //   return '● Please enter some text';
                                                    // }
                                                    return null;
                                                  },
                                                  controller:
                                                      _zipCodeTextEditingController,
                                                )),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: _onCompleteRegister,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: GlobalTheme.kOrangeColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: Vx.mH32,
                                          height: 65.0,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                "Continue"
                                                    .text
                                                    .xl
                                                    .color((isDark(context))
                                                        ? GlobalTheme
                                                            .kPrimaryColor
                                                        : GlobalTheme
                                                            .kAccentColor)
                                                    .make(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                              ),
                            ),
                ));
          }),
        ));
  }
}
