import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AppBarWidget extends StatefulWidget {
  final bool logout;
  final Color? color;

  const AppBarWidget({Key? key, this.logout = false, this.color}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
                      child: (widget.color == null) ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back_ios, color: widget.color,),
                    ),
                    (widget.color == null) ? "Back".text.xl.make() : "Back".text.xl.color(widget.color!).make(),
                  ],
                ),
              ),
              Spacer(),
              (widget.logout) ?
              GestureDetector(
                onTap: () => Routes.seafarer.pop(),
                child: "Log out"
                            .text
                            .xl
                            .color((widget.color == null) ? GlobalTheme.kOrangeColor : widget.color!)
                            .make(),
              ) : Container()
            ],
          )),
    );
  }
}
