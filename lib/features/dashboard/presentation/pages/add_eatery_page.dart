import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/config_bloc/config_bloc.dart';
import 'package:foodyn_eatery/core/bloc/geolocation_bloc/geolocation_bloc.dart';
import 'package:foodyn_eatery/core/bloc/managment_bloc/management_bloc.dart';
import 'package:foodyn_eatery/core/config/injectable/injection.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/data/models/eatery_type_model.dart';
import 'package:foodyn_eatery/core/data/models/location_model.dart';
import 'package:foodyn_eatery/core/data/models/section_model.dart';
import 'package:foodyn_eatery/core/domain/entities/app_failure.dart';
import 'package:foodyn_eatery/core/utils/string_utils.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/geolocation_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/dropdown_form_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/geolocation_text_form_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/image_item_model.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/tag_item_model.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/tables_map_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/aspect_ratio_image_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';

class AddEateryPage extends StatefulWidget {
  static const kRouteName = "/add-restaurant";

  const AddEateryPage({Key? key}) : super(key: key);

  @override
  _AddEateryPageState createState() => _AddEateryPageState();
}

class _AddEateryPageState extends State<AddEateryPage> {
  final _formKey = GlobalKey<FormState>();
  List<ImageItemModel> _imageItemList = [];
  TextEditingController _titleTextEditingController =
      new TextEditingController();
  TextEditingController _descriptionTextEditingController =
      new TextEditingController();
  TextEditingController _phoneTextEditingController =
      new TextEditingController();
  String? _selectedCountryName;
  String? _selectedCityName;
   int _selectedDialCodeIndex = -1;
  int _selectedCountryIndex = -1;
  int _selectedCityIndex = -1;
  int _selectedDialCode = 0;
  late GoogleMapController _mapController;
  List<Marker> _markersList = [];
  LatLng? _selectedMarker;
  late LatLng _defaultSelectedMarker;
  TextEditingController _adresseTextEditingController =
      new TextEditingController();
  TextEditingController _cityTextEditingController =
      new TextEditingController();
  late GeolocationBloc _geolocationBloc;
  late ConfigBloc _configBloc;
  late ManagementBloc _managementBloc;
  bool _isFirsttimeMap = true;
  List<LocationModel> _locations = [];
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  EateryModel? _eateryModel;
  List<EateryTypeModel> _addEateryTypesList = [];
  List<EateryTypeModel>? _eateryTypesList = [];
  List<SectionModel> _sectionList = [];
  List<String> _cities = [];

  @override
  void initState() {
    _geolocationBloc = getIt<GeolocationBloc>();
    _managementBloc = getIt<ManagementBloc>();
    _configBloc = context.read<ConfigBloc>();
    _configBloc.add(ConfigEvent.getEateryTypes());
    _defaultSelectedMarker = LatLng(31.6298, -8.0101);
    if (_configBloc.state.locations != null && _configBloc.state.locations!.isNotEmpty) {
      _locations = _configBloc.state.locations!;
      _locations.sort((a, b) {
        return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
      });
      _cities.clear();
      _locations[0].states!.forEach((element) {
        _cities.addAll(element.cities!);
      });
      _cities.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _geolocationBloc.close();
    _managementBloc.close();
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

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);

    if (result != null) {
        List<File> files = result.files.map((e) => File(e.path!)).toList();
        files.forEach((file) async {
          var decodedImage = await decodeImageFromList(file.readAsBytesSync());
          setState(() {
            _imageItemList.add(
            ImageItemModel(file: file, aspectRatio: decodedImage.width / decodedImage.height)
          );
          });
        });
    }
  }

  String _getFileSize(File file, int decimals) {
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  void _onTapTableMap() async {
    var results = await Routes.seafarer.navigate(TablesMapPage.kRouteName);
    if (results != null)
      setState(() {
        _sectionList = results[0];
      });
  }

  void _onComplete() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      _eateryModel = EateryModel(
        title: _titleTextEditingController.text,
        description: (_descriptionTextEditingController.text.isEmptyOrNull) ? null : _descriptionTextEditingController.text,
        dialCode: _selectedDialCode,
        phoneNumber: (_phoneTextEditingController.text.isEmptyOrNull) ? null : _phoneTextEditingController.text,
        adresse: (_adresseTextEditingController.text.isEmptyOrNull) ? null : _adresseTextEditingController.text,
        posLat: (_selectedMarker != null) ? _selectedMarker!.latitude : null,
        posLng: (_selectedMarker != null) ? _selectedMarker!.longitude : null,
        country: _selectedCountryName,
        city: (_cityTextEditingController.text.isEmptyOrNull) ? null : _cityTextEditingController.text,
        eateryTypes: _addEateryTypesList,
        sections: _sectionList
      );
      _managementBloc.add(ManagementEvent.addEatery(_eateryModel!, _imageItemList.map((e) => e.file).toList()));
    }
  }

  
  void _onStateLoadingInProgress() {
    setState(() {
      _showModal = true;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onStateLoadingManagementSuccess() {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      Routes.seafarer.pop([true]);
    });
  }

  void _onStateLoadingSuccess() {
    _onModalReset();
    setState(() {
      _eateryTypesList = _configBloc.state.eateryTypes;
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
          BlocProvider(create: (context) => _geolocationBloc),
          BlocProvider(create: (context) => _managementBloc),
        ],
        child: MultiBlocListener(
          listeners: [
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
            BlocListener<ConfigBloc, ConfigState>(
              listener: (context, state) {
                state.type.maybeWhen(
                  loadingInProgress: _onStateLoadingInProgress,
                  loadingSuccess: _onStateLoadingSuccess,
                  loadingFailed: _onStateLoadingFailure,
                  orElse: () {});
              },
            ),
            BlocListener<ManagementBloc, ManagementState>(
              listener: (context, state) {
                state.type.maybeWhen(
                  loadingInProgress: _onStateLoadingInProgress,
                  loadingSuccess: _onStateLoadingManagementSuccess,
                  loadingFailed: _onStateLoadingFailure,
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
                      icon: FlareActor(
                          isDark(context)
                              ? 'assets/animations/loading_dark.flr'
                              : 'assets/animations/loading_light.flr',
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
                show: _showModal,
                type: _modalType,
                onReset: _onModalReset,
                logout: false,
                title: "Add Eatery",
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TextFormWidget(
                                  onChanged: (_) {},
                                  hint: "Title *",
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '● Please enter title';
                                    }
                                    return null;
                                  },
                                  controller: _titleTextEditingController,
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TextFormWidget(
                                  onChanged: (_) {},
                                  hint: "Description",
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    return null;
                                  },
                                  controller: _descriptionTextEditingController,
                                )),
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
                                        hint: "Dial Code",
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
                                        controller: _phoneTextEditingController,
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                      color: isDark(context)
                                          ? GlobalTheme.kPrimaryLightColor
                                          : GlobalTheme.kAccentDarkColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: _addEateryTypesList.isEmpty
                                      ? Center(
                                          child:
                                              "Add one or more activities of you eatery"
                                                  .text
                                                  .sm
                                                  .make(),
                                        )
                                      : Wrap(
                                          runSpacing: 10,
                                          spacing: 10,
                                          children: [
                                              ..._addEateryTypesList.map((e) =>
                                                  Container(
                                                    height: 40,
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: GlobalTheme.kOrangeColor,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            StringUtils.getTranslatedString(_configBloc.state.locale!, e.title!).text.sm.bold
                                                                .color(GlobalTheme.kAccentColor)
                                                                .make(),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                _eateryTypesList!
                                                                    .add(e);
                                                                _addEateryTypesList
                                                                    .remove(e);
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              color: GlobalTheme.kAccentColor,
                                                              size: 30,
                                                            ))
                                                      ],
                                                    ),
                                                  ))
                                            ]),
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Container(
                                  child: Wrap(
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: [
                                        ..._eateryTypesList!.map((e) => InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _addEateryTypesList.add(e);
                                                  _eateryTypesList!.remove(e);
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                    color: GlobalTheme.kOrangeColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    StringUtils.getTranslatedString(_configBloc.state.locale!, e.title!).text.sm.bold
                                                        .color(GlobalTheme.kAccentColor)
                                                        .make(),
                                                  ],
                                                ),
                                              ),
                                            ))
                                      ]),
                                )),
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
                                          color: GlobalTheme.kOrangeColor,
                                          width: 1)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            size: Size(
                                                MediaQuery.of(context)
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
                                    hint: "Country",
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
                                    hint: "City",
                                    list: _cities,
                                    defaultIndex: _selectedCityIndex,
                                    modifyListOutput: (text) => text,
                                    modifySelectedOutput: (text) => text,
                                  )),
                            ),
                          ],
                        ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: _pickImage,
                                      child: Center(
                                        child: Container(
                                          width: _imageItemList.isEmpty
                                              ? (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40)
                                              : 100,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isDark(context)
                                                  ? GlobalTheme.kPrimaryLightColor
                                                  : GlobalTheme.kAccentDarkColor),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload_rounded,
                                                  size: 50,
                                                  color: GlobalTheme.kOrangeColor,
                                                ),
                                                if (_imageItemList.isEmpty)
                                                  "Select one or more images"
                                                      .text
                                                      .sm
                                                      .make()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ..._imageItemList.reversed.map((item) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: InkWell(
                                          child: SizedBox(
                                            height: 150,
                                            child: Stack(
                                              children: [
                                                AspectRatioImageWidget(
                                                    item: item),
                                                Positioned(
                                                  top: 10,
                                                  right: 10,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _imageItemList
                                                            .remove(item);
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          color: GlobalTheme
                                                              .kAccentDarkColor,
                                                          shape: BoxShape.circle),
                                                      child: Center(
                                                        child: Icon(Icons.close,
                                                            color: GlobalTheme
                                                                .kRedColor,
                                                            size: 25),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                            ButtonWidget(
                              onTap: _onTapTableMap,
                              background: isDark(context)
                                  ? GlobalTheme.kPrimaryLightColor
                                  : GlobalTheme.kAccentDarkColor,
                              children: [
                                "Tables Map"
                                    .text
                                    .xl
                                    .color((isDark(context))
                                        ? GlobalTheme.kAccentColor
                                        : GlobalTheme.kPrimaryColor)
                                    .make(),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.grid_3x3_rounded,
                                  color: GlobalTheme.kOrangeColor,
                                  size: 30,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ButtonWidget(
                              onTap: _onComplete,
                              children: [
                                "Add"
                                    .text
                                    .xl
                                    .color((isDark(context))
                                        ? GlobalTheme.kPrimaryColor
                                        : GlobalTheme.kAccentColor)
                                    .make(),
                              ],
                            ),
                          ]))
                ],
              );
            },
          ),
      ),
    );
  }
}
