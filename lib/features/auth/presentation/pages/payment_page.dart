import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/data/models/coupon_model.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/services/edge_insets_service.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../widgets/coupon_text_form_widget.dart';
import '../widgets/resend_email_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'choose_payment_page.dart';

class PaymentPage extends StatefulWidget {
  static const kRouteName = "/payment";

  final PlanModel plan;

  const PaymentPage({Key? key, required this.plan}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  int selectedIndex = 0;
  CouponModel? _coupon;
  double _monthPrice = 0;
  double _yearPrice = 0;
  int _reductionPrice = 0;
  double _savePrice = 0;
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _monthPrice = double.parse(CurrencyUtils(widget.plan).getMonthPrice());
    _yearPrice = double.parse(CurrencyUtils(widget.plan).getYearPrice());
    _savePrice = 0;
    _getTotal();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _modalReset() {
    setState(() {
      _showModal = false;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onCompletePayment() {
    Routes.seafarer.navigate(ChoosePaymentPage.kRouteName, params: {
      "plan": widget.plan,
      "coupon": _coupon,
    });
  }

  void _onCouponSet(CouponModel? coupon){
    setState(() {
      _coupon = coupon;
      if (_coupon != null)
        _reductionPrice = _coupon!.reduction!;
      else
        _reductionPrice = 0;
    });
    _getTotal();
  }

  void _getTotal(){
    setState(() {
      _totalPrice = (selectedIndex == 0) ? _monthPrice : _yearPrice;
      _savePrice = (selectedIndex == 0) ? 0 : (_monthPrice * 12 - _yearPrice);
      if (_reductionPrice > 0 && _totalPrice > 0) {
        _savePrice += ((_totalPrice * _reductionPrice) / 100);
        _totalPrice -= ((_totalPrice * _reductionPrice) / 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _authBloc,
        child: Scaffold(
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
                SliverAppBarWidget(logout: true),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(
                        child: Column(
                          children: [
                            ResendEmailWidget(),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 15),
                                  child:
                                      "Complete your payment".text.xl2.make(),
                                ),
                              ],
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                      onTap: () {
                                          setState(() {
                                            selectedIndex = 0;
                                          });
                                          _getTotal();
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: (isDark(context))
                                                  ? GlobalTheme.kPrimaryLightColor
                                                  : GlobalTheme.kAccentDarkColor,
                                              border: Border.all(
                                                  color: (selectedIndex != 0)
                                                      ? ((isDark(context))
                                                          ? GlobalTheme
                                                              .kPrimaryLightColor
                                                          : GlobalTheme
                                                              .kAccentDarkColor)
                                                      : GlobalTheme.kOrangeColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 65,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsetsService.only(
                                                        left: 20),
                                                    child:
                                                        "Monthly".text.xl.make()),
                                                Spacer(),
                                                if (selectedIndex == 0)
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20, right: 20),
                                                      child: Icon(
                                                        Icons.check,
                                                        size: Vx.dp32,
                                                        color: GlobalTheme
                                                            .kOrangeColor,
                                                      )),
                                              ],
                                            ),
                                          ),
                                      ),
                                    ),
                                        ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = 1;
                                          });
                                          _getTotal();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: (isDark(context))
                                                  ? GlobalTheme.kPrimaryLightColor
                                                  : GlobalTheme.kAccentDarkColor,
                                              border: Border.all(
                                                  color: (selectedIndex != 1)
                                                      ? ((isDark(context))
                                                          ? GlobalTheme
                                                              .kPrimaryLightColor
                                                          : GlobalTheme
                                                              .kAccentDarkColor)
                                                      : GlobalTheme.kOrangeColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 65,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsService.only(
                                                        left: 20),
                                                  child: "Yearly".text.xl.make()
                                                ),
                                                Spacer(),
                                                if (selectedIndex == 1)
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20, right: 20),
                                                      child: Icon(
                                                        Icons.check,
                                                        size: Vx.dp32,
                                                        color: GlobalTheme
                                                            .kOrangeColor,
                                                      )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                          padding: EdgeInsets.only(bottom: 40),
                                          child: CouponTextFormWidget(onCouponSet: _onCouponSet,)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          "Plan:".text.xl.bold.make(),
                                          Spacer(),
                                          StringUtils.getTranslatedString(_authBloc.state.locale!, widget.plan.title!).text.xl.make(),
                                        ],
                                      ),
                                      if (_coupon != null)
                                      Row(
                                        children: [
                                          "Coupon:".text.xl.bold.make(),
                                          Spacer(),
                                          (_reductionPrice.toString() + "%").text.bold.xl.make(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          "Save:".text.xl.bold.make(),
                                          Spacer(),
                                          _savePrice.toStringAsFixed(2)
                                          .text.bold.xl.make(),
                                          SizedBox(width: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 0),
                                            child: CurrencyUtils.toStringCurrency().text.xl.make(),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          "Total:".text.xl.bold.make(),
                                          Spacer(),
                                          _totalPrice.toStringAsFixed(2)
                                          .text.bold.xl.make(),
                                          SizedBox(width: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 0),
                                            child: CurrencyUtils.toStringCurrency().text.xl.make(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40,),
                                  InkWell(
                                    onTap: _onCompletePayment,
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
                                                    ? GlobalTheme.kPrimaryColor
                                                    : GlobalTheme.kAccentColor)
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
        )));
  }
}
