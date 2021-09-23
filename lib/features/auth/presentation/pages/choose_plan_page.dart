import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/setting_bloc/setting_bloc.dart';
import '../widgets/sliver_app_bar_widget.dart';
import '../widgets/plan_item_widget.dart';
import '../widgets/resend_email_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class ChoosePlanPage extends StatefulWidget {
  static const kRouteName = "/choose-plan";

  const ChoosePlanPage({Key? key}) : super(key: key);

  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  int selected = 0;
  late SettingBloc _settingBloc;
  late AuthBloc _authBloc;
  List<PlanModel>? _plansList = [];
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _settingBloc = getIt<SettingBloc>();
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

  void _onTypeloadingPlansSuccess(List<PlanModel>? plans) {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _showModal = false;
        _modalType = ModalContainerType.LOADING;
        _plansList = plans;
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
        BlocProvider(create: (context) => _settingBloc..add(SettingEvent.getPlans())),
        BlocProvider(create: (context) => _authBloc)
      ],
      child: BlocListener<SettingBloc, SettingState>(
        listener: (context, state) {
          state.maybeWhen(
              loadingInProgress: _onTypeloadingInProgress,
              loadingPlansSuccess: _onTypeloadingPlansSuccess,
              loadingFailed: _onTypeloadingFailure,
              orElse: () {});
        },
        child: Scaffold(
          body: ModalContainerWidget(
            onLoading: _modalReset,
            onSucceed: _modalReset,
            onFailed: _modalReset,
            child: SafeArea(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverAppBarWidget(
                    logout: true,
                    back: _authBloc.state.user!.membership != null,
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            ResendEmailWidget(),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 15),
                                  child: "Choose a plan".text.xl2.make(),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                // Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: GlobalTheme.kOrangeColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: Vx.mH32,
                                height: 65.0,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      "For A Special Plan Contact Us"
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
                            SizedBox(
                              height: 10,
                            ),
                            ..._plansList!
                                .map((plan) => PlanItemWidget(plan: plan))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
