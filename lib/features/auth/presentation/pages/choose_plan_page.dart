import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../../../../core/bloc/config_bloc/config_bloc.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/data/models/plan_model.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../widgets/plan_item_widget.dart';

class ChoosePlanPage extends StatefulWidget {
  static const kRouteName = "/choose-plan";

  const ChoosePlanPage({Key? key}) : super(key: key);

  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  int selected = 0;
  late ConfigBloc _configBloc;
  late AuthBloc _authBloc;
  List<PlanModel>? _plansList = [];
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _configBloc = getIt<ConfigBloc>();
  }

  @override
  void dispose() {
    _configBloc.close();
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

  void _onTypeloadingFailure(AppFailure failure) {
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => _configBloc..add(ConfigEvent.getPlans())),
        BlocProvider(create: (context) => _authBloc)
      ],
      child: BlocListener<ConfigBloc, ConfigState>(
          listener: (context, state) {
            state.maybeWhen(
                loadingInProgress: _onTypeloadingInProgress,
                loadingPlansSuccess: _onTypeloadingPlansSuccess,
                loadingFailed: _onTypeloadingFailure,
                orElse: () {});
          },
          child: ScaffoldContainerWidget(
            show: _showModal,
            type: _modalType,
            logout: true,
            back: _authBloc.state.user!.membership != null,
            title: "Choose a plan",
            children: [
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
              ..._plansList!.map((plan) => PlanItemWidget(plan: plan))
            ],
          )),
    );
  }
}
