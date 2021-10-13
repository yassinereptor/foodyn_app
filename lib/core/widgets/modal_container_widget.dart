import 'dart:ui';

import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import '../config/theme/global_theme.dart';
import '../utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

enum ModalContainerType { LOADING, SUCCESS, FAILURE }

class ModalContainerWidget extends StatefulWidget {
  final Widget child;
  final bool show;
  final ModalContainerType type;
  final void Function()? onReset;
  final void Function()? onLoading;
  final void Function()? onSucceed;
  final void Function()? onFailed;

  const ModalContainerWidget(
      {Key? key,
      required this.child,
      this.show = false,
      this.type = ModalContainerType.LOADING,
      this.onReset,
      this.onLoading,
      this.onSucceed,
      this.onFailed})
      : super(key: key);

  @override
  _ModalContainerWidgetState createState() => _ModalContainerWidgetState();
}

class _ModalContainerWidgetState extends State<ModalContainerWidget> {
  final _animations = [
    'assets/animations/loading_light.flr',
    'assets/animations/loading_dark.flr',
    'assets/animations/loading_success.flr',
    'assets/animations/loading_failure.flr'
  ];
  late int _animationIndex;
  late String _text;
  late String _btnText;
  late Color _btnColor;

  @override
  void initState() {
    _animationIndex = 0;
    _text = "Loading ...";
    _btnText = "Cancel";
    _btnColor = GlobalTheme.kOrangeColor;
    super.initState();
  }

  void _onTap() {
    switch (widget.type) {
      case ModalContainerType.LOADING:
        if (widget.onLoading != null)
          widget.onLoading!();
        if (widget.onReset != null)
          widget.onReset!();
        break;
      case ModalContainerType.SUCCESS:
        if (widget.onSucceed != null)
          widget.onSucceed!();
        if (widget.onReset != null)
          widget.onReset!();
        break;
      case ModalContainerType.FAILURE:
        if (widget.onFailed != null)
          widget.onFailed!();
        if (widget.onReset != null)
          widget.onReset!();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width / 3;
    switch (widget.type) {
      case ModalContainerType.LOADING:
        _animationIndex = !isDark(context) ? 0 : 1;
        _text = "Loading ...";
        _btnText = "Cancel";
        _btnColor = GlobalTheme.kOrangeColor;
        break;
      case ModalContainerType.SUCCESS:
        _animationIndex = 2;
        _text = "Operation Succeed";
        _btnText = "Continue";
        _btnColor = GlobalTheme.kGreenColor;
        break;
      case ModalContainerType.FAILURE:
        _animationIndex = 3;
        _text = "Operation Failed!";
        _btnText = "Cancel";
        _btnColor = GlobalTheme.kRedColor;
        break;
    }

    return Stack(
      children: [
        widget.child,
        widget.show
            ? Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: _width,
                          height: _width,
                          child: Stack(
                            children: [
                              FlareActor(_animations[_animationIndex],
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  animation: "start"),
                              Center(
                                child: (_animationIndex > 1)
                                    ? Icon(
                                        (_animationIndex == 2)
                                            ? Icons.check
                                            : Icons.close_rounded,
                                        color: GlobalTheme.kAccentColor,
                                      )
                                    : Container(),
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
                                _text,
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
                  Column(
                    children: [
                      Spacer(),
                      Center(
                        child: InkWell(
                                  onTap: _onTap,
                                  child: _btnText.text
                                      .xl2
                                      .color(_btnColor)
                                      .make(),
                                ),
                      ),
                      SizedBox(height: 40,)
                    ],
                  )
                ],
              )
            : Container()
      ],
    );
  }
}
