import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/data/models/coupon_model.dart';
import 'package:foodyn_rest/core/data/models/payment_model.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/enums/payment.type.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/setting_bloc/setting_bloc.dart';
import '../widgets/sliver_app_bar_widget.dart';
import '../widgets/resend_email_widget.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bank_card_page.dart';
import 'bank_transfer_page.dart';

class ChoosePaymentPage extends StatefulWidget {
  static const kRouteName = "/choose-payment";
  final PlanModel plan;
  final CouponModel? coupon;

  const ChoosePaymentPage({Key? key, required this.plan, required this.coupon}) : super(key: key);

  @override
  _ChoosePaymentPageState createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  late SettingBloc _settingBloc;
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  List<PaymentModel>? _paymentsList = [];

  @override
  void initState() {
    super.initState();
    _settingBloc = getIt<SettingBloc>();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _settingBloc.close();
    super.dispose();
  }

  void _onTypeloadingInProgress() {
    setState(() {
      _showModal = true;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onTypeloadingPaymentsSuccess(List<PaymentModel>? payments) {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _showModal = false;
        _modalType = ModalContainerType.LOADING;
        _paymentsList = payments;
      });
    });
  }

  void _onTypeloadingFailure(AuthFailure failure) {
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
          create: (context) => _settingBloc..add(SettingEvent.getPayments()),
        ),
        BlocProvider(
          create: (context) => _authBloc,
        )
      ],
      child: BlocListener<SettingBloc, SettingState>(
        listener: (context, state) {
          state.maybeWhen(
            loadingInProgress: _onTypeloadingInProgress,
            loadingPaymentsSuccess: _onTypeloadingPaymentsSuccess,
            loadingFailed: _onTypeloadingFailure,
            orElse: () {});
        },
        child: Scaffold(
            body: ModalContainerWidget(
            onLoading: _modalReset,
            onSucceed: _modalReset,
            onFailed: _modalReset,
              child: SafeArea(
                  child: CustomScrollView(shrinkWrap: true, slivers: [
                      SliverAppBarWidget(logout: true),
                      SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: Column(
                      children: [
                        ResendEmailWidget(),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 15),
                              child: "Choose a method of payment".text.xl2.make(),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              ..._paymentsList!.mapIndexed(
                                (payment, index) => Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: InkWell(
                                    onTap: (!payment.soon!) ? () {
                                      if (payment.type! == PaymentType.TRANSFER.index)
                                        Routes.seafarer.navigate(BankTransferPage.kRouteName);
                                      else if (payment.type! == PaymentType.CARD.index)
                                        Routes.seafarer.navigate(BankCardPage.kRouteName);
                                    } : () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorUtils(payment.primaryColor!)
                                              .toColor(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: Vx.mH32,
                                      height: 65.0,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 20),
                                            child: CachedNetworkImage(imageUrl: payment.asset!, width: 40, height: 40)
                                          ),
                                          (!payment.soon!)
                                              ? (StringUtils.getTranslatedString(_authBloc.state.locale! ,payment.title!)).text.xl
                                                  .color(ColorUtils(
                                                          payment.textColor!)
                                                      .toColor())
                                                  .make()
                                              : (StringUtils.getTranslatedString(_authBloc.state.locale! ,payment.title!)).text.xl
                                                  .color(ColorUtils(
                                                          payment.textColor!)
                                                      .toColor())
                                                  .lineThrough
                                                  .make(),
                                          (!payment.soon!)
                                              ? Container()
                                              : " (Soon)"
                                                  .text
                                                  .xl
                                                  .color(ColorUtils(
                                                          payment.textColor!)
                                                      .toColor())
                                                  .make(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
                      ),
                    ])),
            )),
      ),
    );
  }
}
