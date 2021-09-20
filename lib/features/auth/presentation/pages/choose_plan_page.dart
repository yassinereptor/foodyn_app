import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/injectable/injection.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/models/plan_model.dart';
import 'package:foodyn_rest/core/utils/color_utils.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/widgets/modal_container_widget.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/plan_bloc/plan_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/plan_item_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'learnmore_page.dart';
import 'login_page.dart';

class ChoosePlanPage extends StatefulWidget {
  static const kRouteName = "/choose-plan";

  const ChoosePlanPage({Key? key}) : super(key: key);

  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  final _formKey = GlobalKey<FormState>();
  int selected = 0;
  late PlanBloc _planBloc;
  late AuthBloc _authBloc;
  List<PlanModel>? _plansList = [];
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _planBloc = getIt<PlanBloc>();
  }

  @override
  void dispose() {
    _planBloc.close();
    super.dispose();
  }

  void _onTypeloadingInProgress () {
    
  }

  void _onTypeloadingSuccess (List<PlanModel>? plans) {
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

  void _onTypeloadingFailure (AuthFailure failure) {
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
          create: (context) => _planBloc..add(PlanEvent.getPlans()),
          ),
          BlocProvider(
          create: (context) => _authBloc
          )
        ],
        child: BlocListener<PlanBloc, PlanState>(
          listener: (context, state) {
            state.maybeWhen(
              loadingInProgress: _onTypeloadingInProgress,
              loadingSuccess: _onTypeloadingSuccess,
              loadingFailed: _onTypeloadingFailure,
              orElse: (){});
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
                    SliverAppBarWidget(logout: true, back: _authBloc.state.user!.membership != null,),
                    SliverFillRemaining(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, bottom: 15),
                                      child: "Choose a plan".text.xl2.make(),
                                    ),
                                  ],
                                ),
                                if (_plansList!.isNotEmpty)
                                Expanded(
                                  child: Swiper(
                                    onIndexChanged: (index) {
                                      setState(() {
                                        selected = index;
                                      });
                                    },
                                    itemBuilder: (BuildContext context, int index) {
                                      return PlanItemWidget(
                                          list: _plansList!, selected: index);
                                    },
                                    itemCount: _plansList!.length,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                  ),
                                ),
                                if (_plansList!.isNotEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ..._plansList!.mapIndexed(
                                          (currentValue, index) => Container(
                                                margin: EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    bottom: 12.5),
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: (selected == index)
                                                      ? ColorUtils(_plansList![selected].accentColor!).toColor()
                                                      : GlobalTheme
                                                          .kPrimaryLightColor
                                                          .withOpacity(.3),
                                                ),
                                              ))
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
            ),
          ),
        ),
    );
  }
}
