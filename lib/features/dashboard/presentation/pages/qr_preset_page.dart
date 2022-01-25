import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:foodyn_eatery/core/l10n/l10n.dart';
import 'package:foodyn_eatery/core/widgets/dialogs/color_dialog.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class QrPresetPage extends StatefulWidget {
  static const kRouteName = "/qr-preset";

  const QrPresetPage({Key? key}) : super(key: key);

  @override
  _QrPresetPageState createState() => _QrPresetPageState();
}

class _QrPresetPageState extends State<QrPresetPage> {
  List<Widget> _qrBorderList = [];
  CarouselController _carouselController = CarouselController();
  bool _qrRound = false;
  bool _qrFrameRound = false;
  Color _qrColor = Colors.black;
  Color _qrBackgroundColor = Colors.white;
  Color _qrFrameColor = Colors.black;
  Color _qrTextColor = Colors.white;
  double _qrScale = 0.9;
  String _qrText = "Scan me";
  late TextEditingController _textTextEditingController;
  TextEditingController _aliasTextEditingController =
      new TextEditingController();
  File? _file;

  @override
  void initState() {
    _textTextEditingController = new TextEditingController(text: _qrText);
    super.initState();
  }

  Future<void> _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _qrBorderList = [
      Center(
        child: Container(
          height: 350,
          width: 240,
        ),
      ),
      Center(
        child: Container(
          height: 350,
          width: 240,
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: _qrFrameColor,
                      borderRadius:
                          BorderRadius.circular(_qrFrameRound ? 10 : 0)),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 65,
                        child: Center(
                          child: _qrText.text.capitalize
                              .color(_qrTextColor)
                              .xl
                              .make(),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Center(
        child: Container(
          height: 350,
          width: 240,
          color: _qrFrameColor,
        ),
      ),
      Center(
        child: Container(
          height: 350,
          width: 240,
          color: _qrFrameColor,
        ),
      )
    ];

    return ScaffoldContainerWidget(
      logout: false,
      title: "Qr Preset",
      subtitle: "you can set a frame by swiping",
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 400,
          decoration: BoxDecoration(
              color: isDark(context)
                  ? GlobalTheme.kPrimaryLightColor
                  : GlobalTheme.kAccentDarkColor,
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              CarouselSlider(
                  carouselController: _carouselController,
                  items: _qrBorderList,
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 1,
                    viewportFraction: 0.75,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 210,
                        width: 210,
                        decoration: BoxDecoration(
                            color: _qrBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(_qrFrameRound ? 10 : 0)),
                      ),
                    ),
                    Center(
                      child: Transform.scale(
                        scale: _qrScale,
                        child: PrettyQr(
                          image: (_file != null) ? MemoryImage(_file!.readAsBytesSync()) : null,
                          typeNumber: 3,
                          size: 210,
                          data: S.of(context).app_name,
                          errorCorrectLevel: QrErrorCorrectLevel.M,
                          roundEdges: _qrRound,
                          elementColor: _qrColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CarouselSlider(
                  items: _qrBorderList
                      .map((e) => Center(
                            child: Container(
                              height: 350,
                              width: 240,
                              color: Colors.transparent,
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (page, _) {
                      _carouselController.animateToPage(page,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    },
                    height: 400,
                    aspectRatio: 1,
                    viewportFraction: 0.75,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormWidget(
              onChanged: (_) {},
              hint: "Alias",
              keyboardType: TextInputType.text,
              validator: (value) {
                return null;
              },
              controller: _aliasTextEditingController,
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormWidget(
              onChanged: (value) {
                if (value != null && value.isNotEmpty) {
                  setState(() {
                    _qrText = value;
                  });
                }
              },
              hint: "Text",
              keyboardType: TextInputType.text,
              validator: (value) {
                return null;
              },
              controller: _textTextEditingController,
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: _pickImage,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 65,
                    decoration: BoxDecoration(
                      color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ((_file != null) ? _file!.path.split("/").last : "Set an image").text.overflow(TextOverflow.ellipsis).make(),
                        Spacer(),
                        Icon(Icons.image_rounded, size: 30, color: GlobalTheme.kOrangeColor)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Qr Scale".text.make(),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      inactiveColor: isDark(context)
                          ? GlobalTheme.kPrimaryLightColor
                          : GlobalTheme.kAccentDarkColor,
                      activeColor: GlobalTheme.kOrangeColor,
                      value: _qrScale * 100,
                      min: 10,
                      max: 100,
                      label: (_qrScale * 100).round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _qrScale = value / 100;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Qr Rounding".text.make(),
              FlutterSwitch(
                  toggleColor: isDark(context)
                      ? GlobalTheme.kAccentColor
                      : GlobalTheme.kPrimaryColor,
                  inactiveColor: isDark(context)
                      ? GlobalTheme.kPrimaryLightColor
                      : GlobalTheme.kAccentDarkColor,
                  activeColor: GlobalTheme.kOrangeColor,
                  value: _qrRound,
                  onToggle: (value) {
                    setState(() {
                      _qrRound = value;
                    });
                  })
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Qr Frame Rounding".text.make(),
              FlutterSwitch(
                  toggleColor: isDark(context)
                      ? GlobalTheme.kAccentColor
                      : GlobalTheme.kPrimaryColor,
                  inactiveColor: isDark(context)
                      ? GlobalTheme.kPrimaryLightColor
                      : GlobalTheme.kAccentDarkColor,
                  activeColor: GlobalTheme.kOrangeColor,
                  value: _qrFrameRound,
                  onToggle: (value) {
                    setState(() {
                      _qrFrameRound = value;
                    });
                  })
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Qr Color".text.make(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  showDialog(
                    barrierColor: Colors.transparent,
                    context: Routes.seafarer.navigatorKey!.currentContext!,
                    builder: (context) {
                      return ColorDialog(
                        pickerColor: _qrColor,
                      );
                    },
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _qrColor = value[0];
                      });
                    }
                  });
                },
                child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                "assets/images/transparent_texture.jpg",
                                repeat: ImageRepeat.repeat,
                                height: 35,
                                width: 70,
                                fit: BoxFit.contain)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: _qrColor,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Qr Background Color".text.make(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  showDialog(
                    barrierColor: Colors.transparent,
                    context: Routes.seafarer.navigatorKey!.currentContext!,
                    builder: (context) {
                      return ColorDialog(
                        pickerColor: _qrBackgroundColor,
                      );
                    },
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _qrBackgroundColor = value[0];
                      });
                    }
                  });
                },
                child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                "assets/images/transparent_texture.jpg",
                                repeat: ImageRepeat.repeat,
                                height: 35,
                                width: 70,
                                fit: BoxFit.contain)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: _qrBackgroundColor,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Qr Frame Color".text.make(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  showDialog(
                    barrierColor: Colors.transparent,
                    context: Routes.seafarer.navigatorKey!.currentContext!,
                    builder: (context) {
                      return ColorDialog(
                        pickerColor: _qrFrameColor,
                      );
                    },
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _qrFrameColor = value[0];
                      });
                    }
                  });
                },
                child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                "assets/images/transparent_texture.jpg",
                                repeat: ImageRepeat.repeat,
                                height: 35,
                                width: 70,
                                fit: BoxFit.contain)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: _qrFrameColor,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Text Color".text.make(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  showDialog(
                    barrierColor: Colors.transparent,
                    context: Routes.seafarer.navigatorKey!.currentContext!,
                    builder: (context) {
                      return ColorDialog(
                        pickerColor: _qrTextColor,
                      );
                    },
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _qrTextColor = value[0];
                      });
                    }
                  });
                },
                child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                "assets/images/transparent_texture.jpg",
                                repeat: ImageRepeat.repeat,
                                height: 35,
                                width: 70,
                                fit: BoxFit.contain)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: _qrTextColor,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
