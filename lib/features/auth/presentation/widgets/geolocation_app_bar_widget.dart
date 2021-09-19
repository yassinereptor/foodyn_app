import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

class GeolocationAppBarWidget extends StatefulWidget {
  final Widget myLocationWidget;
  const GeolocationAppBarWidget({Key? key, required this.myLocationWidget}) : super(key: key);

  @override
  _GeolocationAppBarWidgetState createState() => _GeolocationAppBarWidgetState();
}

class _GeolocationAppBarWidgetState extends State<GeolocationAppBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          height: 60,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Routes.seafarer.pop(),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    "Back".text.xl.make()
                  ],
                ),
              ),
              Spacer(),
              widget.myLocationWidget
            ],
          )),
    );
  }
}
