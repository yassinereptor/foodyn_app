import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
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
  final bool back;

  const ChoosePlanPage({Key? key, this.back = true}) : super(key: key);

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
    _configBloc = context.read<ConfigBloc>();
    // if (_configBloc.state.plans == null)
      _configBloc.add(ConfigEvent.getPlans());
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
      _plansList = _configBloc.state.plans;
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
          back: widget.back,
          title: "Choose a plan",
          children: [
            ButtonWidget(
              onTap: () {
              },
              children: [
                    "For A Special Plan"
                    .text
                    .xl
                    .lineThrough
                    .color((isDark(context))
                        ? GlobalTheme.kPrimaryColor
                        : GlobalTheme.kAccentColor)
                    .make(),
                    " (Soon)"
                    .text
                    .xl
                    .color((isDark(context))
                        ? GlobalTheme.kPrimaryColor
                        : GlobalTheme.kAccentColor)
                    .make(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ..._plansList!.map((plan) => PlanItemWidget(plan: plan))
          ],
        ));
  }
}
