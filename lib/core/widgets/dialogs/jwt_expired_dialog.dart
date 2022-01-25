import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/utils/theme_brightness.dart';
import '../../config/router/router.dart';
import '../../config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class JwtExpiredDialog extends StatefulWidget {
  const JwtExpiredDialog({
    Key? key,
  }) : super(key: key);

  @override
  _JwtExpiredDialogState createState() => _JwtExpiredDialogState();
}

class _JwtExpiredDialogState extends State<JwtExpiredDialog> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width / 3;

    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        insetPadding: Vx.m0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: isDark(context) ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: _width,
                              height: _width,
                              child: Stack(
                                children: [
                                  FlareActor('assets/animations/loading_failure.flr',
                                      alignment: Alignment.center,
                                      fit: BoxFit.contain,
                                      animation: "start"),
                                  Center(
                                    child: Icon(
                                            Icons.close_rounded,
                                            color: GlobalTheme.kAccentColor,
                                          ),
                                  )
                                ],
                              )),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Session Expired",
                                    style: TextStyle(
                                        color: GlobalTheme.kAccentColor,
                                        fontSize: Vx.dp20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Spacer(),
                        Center(
                          child: InkWell(
                                    onTap: () => Routes.seafarer.pop(),
                                    child: "Cancel".text
                                        .xl2
                                        .color(GlobalTheme.kRedColor)
                                        .make(),
                                  ),
                        ),
                        SizedBox(height: 40,)
                      ],
                    )
                  ],
                ),
      )
    );
  }
}
