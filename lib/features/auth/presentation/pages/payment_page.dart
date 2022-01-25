import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/config_bloc/config_bloc.dart';
import 'package:foodyn_eatery/core/config/injectable/injection.dart';
import 'package:foodyn_eatery/core/data/models/membership_model.dart';
import 'package:foodyn_eatery/core/domain/entities/app_failure.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:seafarer/seafarer.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../../core/data/models/coupon_model.dart';
import '../../../../core/data/models/plan_model.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/services/edge_insets_service.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../widgets/coupon_text_form_widget.dart';
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
  late ConfigBloc _configBloc;
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
  int? _selectedCurrencyIndex;

  @override
  void initState() {
    super.initState();
    _configBloc = context.read<ConfigBloc>();
    _authBloc = context.read<AuthBloc>();
    _monthPrice = double.parse(CurrencyUtils(widget.plan).getMonthPrice());
    _yearPrice = double.parse(CurrencyUtils(widget.plan).getYearPrice());
    _savePrice = 0;
    _getTotal();
    CurrencyUtils.getCurrencyIndex()
        .then((value) => _selectedCurrencyIndex = value);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onCompletePayment() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_totalPrice == 0) {
      _authBloc.add(AuthEvent.saveMembership(widget.plan.id!,
          selectedIndex, _coupon != null ? _coupon?.id : null));
    } else {
      Routes.seafarer.navigate(ChoosePaymentPage.kRouteName, params: {
        "plan": widget.plan,
        "coupon": _coupon,
      });
    }
  }

  void _onCouponSet(CouponModel? coupon) {
    setState(() {
      _coupon = coupon;
      if (_coupon != null)
        _reductionPrice = _coupon!.reduction!;
      else
        _reductionPrice = 0;
    });
    _getTotal();
  }

  void _getTotal() {
    setState(() {
      _totalPrice = (selectedIndex == 0) ? _monthPrice : _yearPrice;
      _savePrice = (selectedIndex == 0) ? 0 : (_monthPrice * 12 - _yearPrice);
      if (_reductionPrice > 0 && _totalPrice > 0) {
        _savePrice += ((_totalPrice * _reductionPrice) / 100);
        _totalPrice -= ((_totalPrice * _reductionPrice) / 100);
      }
    });
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
      Routes.seafarer.navigate(
        DashboardPage.kRouteName,
        navigationType: NavigationType.pushAndRemoveUntil,
        removeUntilPredicate: (route) {
          return false;
        },
      );
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.type.maybeWhen(
        loadingInProgress: _onStateLoadingInProgress,
        loadingSuccess: _onStateLoadingSuccess,
        loadingFailed: _onStateLoadingFailure,
        orElse: () {});
      },
      child: ScaffoldContainerWidget(
        type: _modalType,
        show: _showModal,
        onReset: _onModalReset,
        logout: true,
        title: "Complete your payment",
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                if (double.parse(CurrencyUtils(widget.plan).getMonthPrice()) != 0)
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
                                            ? GlobalTheme.kPrimaryLightColor
                                            : GlobalTheme.kAccentDarkColor)
                                        : GlobalTheme.kOrangeColor),
                                borderRadius: BorderRadius.circular(10)),
                            height: 65,
                            child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsetsService.only(left: 20),
                                      child: "Monthly".text.xl.make()),
                                  Spacer(),
                                  if (selectedIndex == 0)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Icon(
                                          Icons.check,
                                          size: Vx.dp32,
                                          color: GlobalTheme.kOrangeColor,
                                        )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                                            ? GlobalTheme.kPrimaryLightColor
                                            : GlobalTheme.kAccentDarkColor)
                                        : GlobalTheme.kOrangeColor),
                                borderRadius: BorderRadius.circular(10)),
                            height: 65,
                            child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsetsService.only(left: 20),
                                      child: "Yearly".text.xl.make()),
                                  Spacer(),
                                  if (selectedIndex == 1)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Icon(
                                          Icons.check,
                                          size: Vx.dp32,
                                          color: GlobalTheme.kOrangeColor,
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
                if (double.parse(CurrencyUtils(widget.plan).getMonthPrice()) != 0)
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CouponTextFormWidget(
                      onCouponSet: _onCouponSet,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        "Plan:".text.xl.bold.make(),
                        Spacer(),
                        StringUtils.getTranslatedString(
                                _configBloc.state.locale!, widget.plan.title!)
                            .text
                            .xl
                            .make(),
                      ],
                    ),
                    if (_coupon != null)
                      Row(
                        children: [
                          "Coupon:".text.xl.bold.make(),
                          Spacer(),
                          (_reductionPrice.toString() + "%")
                              .text
                              .bold
                              .xl
                              .make(),
                        ],
                      ),
                    Row(
                      children: [
                        "Save:".text.xl.bold.make(),
                        Spacer(),
                        _savePrice.toStringAsFixed(2).text.bold.xl.make(),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: CurrencyUtils.toStringCurrency(
                                  _selectedCurrencyIndex)
                              .text
                              .xl
                              .make(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        "Total:".text.xl.bold.make(),
                        Spacer(),
                        _totalPrice.toStringAsFixed(2).text.bold.xl.make(),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: CurrencyUtils.toStringCurrency(
                                  _selectedCurrencyIndex)
                              .text
                              .xl
                              .make(),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  onTap: _onCompletePayment,
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
      ),
    );
  }
}
