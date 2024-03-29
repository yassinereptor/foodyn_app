import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/auth_bloc/auth_bloc.dart';
import '../../../../core/data/models/coupon_model.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/theme/input_decoration_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CouponTextFormWidget extends StatefulWidget {
  final void Function(CouponModel? coupon) onCouponSet;

  const CouponTextFormWidget({Key? key, required this.onCouponSet})
      : super(key: key);

  @override
  _CouponTextFormWidgetState createState() => _CouponTextFormWidgetState();
}

class _CouponTextFormWidgetState extends State<CouponTextFormWidget> {
  final TextEditingController? controller = TextEditingController();
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Vx.dp10),
        bottomLeft: Radius.circular(Vx.dp10)),
    borderSide: BorderSide(color: borderColor, width: 1),
  );
  final darkBorder = OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Vx.dp10),
        bottomLeft: Radius.circular(Vx.dp10)),
    borderSide: BorderSide(color: GlobalTheme.kPrimaryLightColor, width: 1),
  );
  final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Vx.dp10),
        bottomLeft: Radius.circular(Vx.dp10)),
    borderSide: BorderSide(color: GlobalTheme.kOrangeColor, width: 1),
  );
  late AuthBloc _authBloc;
  late Icon _defaultIcon;
  late Icon _icon;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _defaultIcon = Icon(
                    Icons.more_horiz_outlined,
                    color: GlobalTheme.kOrangeColor,
                  );
    _icon = _defaultIcon;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.type.maybeWhen(
          loadingCouponSuccess: (coupon) {
            widget.onCouponSet(coupon);
          },
          orElse: (){
            widget.onCouponSet(null);
          });
      },
      builder: (context, state) {
        state.type.maybeWhen(
          loadingInProgress: () {
            _icon = _defaultIcon;
          },
          loadingFailed: (faulure) {
            _icon = Icon(
                  Icons.close_rounded,
                  color: GlobalTheme.kRedColor,
                );
          },
          loadingCouponSuccess: (coupon) {
            _icon = Icon(
                  Icons.check,
                  color: GlobalTheme.kGreenColor,
                );
          },
          orElse: (){
            _icon = _defaultIcon;
          });

        return Row(
          children: [
            Expanded(
                child: TextFormField(
                  onChanged: (text){
                      if (text.isNotEmpty &&
                          text.length == 4) {
                        _authBloc
                            .add(AuthEvent.checkCouponStatus(text));
                      }
                      else
                        _authBloc
                            .add(AuthEvent.checkCouponStatus(""));
                  },
                    keyboardType: TextInputType.streetAddress,
                    cursorColor: GlobalTheme.kOrangeColor,
                    decoration: InputDecoration(
                      hintText: "Coupon",
                      border: isDark(context) ? darkBorder : border,
                      errorBorder: isDark(context) ? darkBorder : border,
                      disabledBorder: isDark(context) ? darkBorder : border,
                      enabledBorder: isDark(context) ? darkBorder : border,
                      focusedBorder: focusedBorder,
                      focusedErrorBorder: focusedBorder,
                    ),
                    controller: (controller == null)
                        ? TextEditingController()
                        : controller)),
            Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Vx.dp10),
                    bottomRight: Radius.circular(Vx.dp10)),
                color: isDark(context)
                    ? GlobalTheme.kAccentDarkColor
                    : GlobalTheme.kPrimaryLightColor,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: _icon),
            )
          ],
        );
      },
    );
  }
}
