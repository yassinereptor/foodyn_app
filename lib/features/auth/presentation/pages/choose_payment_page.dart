import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../../core/bloc/config_bloc/config_bloc.dart';
import '../../../../core/data/models/coupon_model.dart';
import '../../../../core/data/models/payment_model.dart';
import '../../../../core/data/models/plan_model.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/enums/payment.type.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bank_card_page.dart';
import 'bank_transfer_page.dart';

class ChoosePaymentPage extends StatefulWidget {
  static const kRouteName = "/choose-payment";
  final PlanModel plan;
  final CouponModel? coupon;

  const ChoosePaymentPage({Key? key, required this.plan, required this.coupon})
      : super(key: key);

  @override
  _ChoosePaymentPageState createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  late ConfigBloc _configBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  List<PaymentModel>? _paymentsList = [];

  @override
  void initState() {
    super.initState();
    _configBloc = context.read<ConfigBloc>();
    _configBloc.add(ConfigEvent.getPayments());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onStateLoadingInProgress() {
    setState(() {
      _showModal = true;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onStateLoadingSuccess() {
    _onModalReset();
    setState(() {
      _paymentsList = _configBloc.state.payments;
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
    return BlocListener<ConfigBloc, ConfigState>(
        listener: (context, state) {
          state.type.maybeWhen(
              loadingInProgress: _onStateLoadingInProgress,
              loadingSuccess: _onStateLoadingSuccess,
              loadingFailed: _onStateLoadingFailure,
              orElse: () {});
        },
        child: ScaffoldContainerWidget(
          show: _showModal,
          type: _modalType,
          onReset: _onModalReset,
          logout: true,
          title: "Choose a method of payment",
          children: [
            ..._paymentsList!.mapIndexed(
              (payment, index) => Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ButtonWidget(
                    background: ColorUtils(payment.primaryColor!).toColor(),
                    onTap: (!payment.soon!)
                        ? () {
                            if (payment.type! == PaymentType.TRANSFER.index)
                              Routes.seafarer
                                  .navigate(BankTransferPage.kRouteName);
                            else if (payment.type! == PaymentType.CARD.index)
                              Routes.seafarer
                                  .navigate(BankCardPage.kRouteName);
                          }
                        : () {},
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: CachedNetworkImage(
                              imageUrl: dotenv.env["SERVER_LINK"]! + payment.asset!,
                              width: 40,
                              height: 40)),
                      (!payment.soon!)
                          ? (StringUtils.getTranslatedString(
                                  _configBloc.state.locale!, payment.title!))
                              .text
                              .xl
                              .color(ColorUtils(payment.textColor!).toColor())
                              .make()
                          : (StringUtils.getTranslatedString(
                                  _configBloc.state.locale!, payment.title!))
                              .text
                              .xl
                              .color(ColorUtils(payment.textColor!).toColor())
                              .lineThrough
                              .make(),
                      (!payment.soon!)
                          ? Container()
                          : " (Soon)"
                              .text
                              .xl
                              .color(ColorUtils(payment.textColor!).toColor())
                              .make(),
                      SizedBox(width: 20,),
                      Spacer(),
                    ],
                  )),
            )
          ],
        ));
  }
}
