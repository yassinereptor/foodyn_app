import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/managment_bloc/management_bloc.dart';
import 'package:foodyn_eatery/core/config/injectable/injection.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/domain/entities/app_failure.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/transition_image_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import 'add_eatery_page.dart';
import 'eatery_page.dart';

class ShowAllEateriesPage extends StatefulWidget {
  static const kRouteName = "/show-all-eateries";
  // final List<EateryModel> eateryModelList;

  const ShowAllEateriesPage({Key? key, 
  // required this.eateryModelList
  }) : super(key: key);

  @override
  _ShowAllEateriesPageState createState() => _ShowAllEateriesPageState();
}

class _ShowAllEateriesPageState extends State<ShowAllEateriesPage> {
  late ManagementBloc _managementBloc;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<EateryModel> _eateryModelList = [];
  bool _gridView = false;

  @override
  void initState() {
    _managementBloc = context.read<ManagementBloc>();
    if (_managementBloc.state.eateries != null)
      _eateryModelList = _managementBloc.state.eateries!;
    super.initState();
  }

  void _onRefresh() async {
    _managementBloc.add(ManagementEvent.getEateries());
  }

  void _onStateLoadingInProgress() {
  }

  void _onStateLoadingSuccess() {
    setState(() {
      if (_managementBloc.state.eateries != null)
        _eateryModelList = _managementBloc.state.eateries!;
    });
    if (_refreshController.isRefresh)
      _refreshController.refreshCompleted();
  }

  void _onStateLoadingFailure(AppFailure failure) {
   if (_refreshController.isRefresh)
      _refreshController.refreshFailed();
  }

  void requestRefresh() {
    _refreshController.requestRefresh();
  }

  void _onListingTap() {
    setState(() {
      _gridView = !_gridView;
    });
  }

  void _onAddEateryTap() async {
    var result = await Routes.seafarer.navigate(AddEateryPage.kRouteName);
    if (result != null)
      requestRefresh();
  }

  void _onEateryTap(int id) async {
    var result = await Routes.seafarer.navigate(EateryPage.kRouteName, params: {
      "eateryModel": _eateryModelList.singleWhere((element) => element.id == id)
    });
    if (result != null)
      requestRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ManagementBloc, ManagementState>(
      listener: (context, state) {
        state.type.maybeWhen(
            loadingInProgress: _onStateLoadingInProgress,
            loadingSuccess: _onStateLoadingSuccess,
            loadingFailed: _onStateLoadingFailure,
            orElse: () {});
      },
        )
      ],
      child: Stack(
        children: [
          ScaffoldContainerWidget(
            refresher: true,
            logout: false,
            title: "Eateries",
            refreshController: _refreshController,
            onRefresherRefresh: _onRefresh,
            leading: InkWell(
              onTap: _onListingTap,
              child: Icon(
                (_gridView) ? Icons.view_agenda : Icons.grid_view_rounded,
                size: 30,
                color: GlobalTheme.kOrangeColor,
              )
            ),
            children: [
              if (_eateryModelList.isNotEmpty)
              GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio: (_gridView) ? 1 : 2 / 1,
                crossAxisCount: (_gridView) ? 2 : 1,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ..._eateryModelList
                    .map(
                      (eatery) => TransitionImageWidget(
                        onTap: _onEateryTap,
                        id: eatery.id!,
                        padding: false,
                        bigTitle: !_gridView,
                        links: eatery.images,
                        title: eatery.title!,
                        size: Size(
                          MediaQuery.of(context).size.width - 40,
                          (MediaQuery.of(context).size.width - 40) / 2
                          ),
                      ),
                    )
                    .toList()
                ],
              ),
              SizedBox(height: 80,)
            ],
          ),
          Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  backgroundColor: GlobalTheme.kOrangeColor,
                  child: Icon(
                    Icons.add,
                    color: isDark(context)
                        ? GlobalTheme.kPrimaryColor
                        : GlobalTheme.kAccentColor,
                  ),
                  onPressed: _onAddEateryTap),
              )
        ],
      ),
    );
  }
}
