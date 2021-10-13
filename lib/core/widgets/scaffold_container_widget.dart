import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../features/auth/presentation/widgets/resend_email_widget.dart';
import '../../features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'modal_container_widget.dart';

class ScaffoldContainerWidget extends StatefulWidget {
  final List<Widget> children;
  final bool show;
  final bool logout;
  final bool back;
  final bool emailResend;
  final bool refresher;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final ModalContainerType type;
  final void Function()? onReset;
  final void Function()? onLoading;
  final void Function()? onSucceed;
  final void Function()? onFailed;
  final void Function()? onRefresherLoad;
  final void Function()? onRefresherRefresh;
  final RefreshController? refreshController;

  const ScaffoldContainerWidget(
      {Key? key,
      required this.children,
      this.show = false,
      this.logout = false,
      this.back = true,
      this.emailResend = true,
      this.refresher = false,
      this.title,
      this.subtitle,
      this.leading,
      this.type = ModalContainerType.LOADING,
      this.onReset,
      this.onLoading,
      this.onSucceed,
      this.onFailed,
      this.onRefresherLoad,
      this.onRefresherRefresh,
      this.refreshController})
      : super(key: key);

  @override
  _ScaffoldContainerWidgetState createState() =>
      _ScaffoldContainerWidgetState();
}

class _ScaffoldContainerWidgetState extends State<ScaffoldContainerWidget> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    if (widget.refreshController != null)
      _refreshController = widget.refreshController!;
    super.initState();
  }

  void _onRefresh() async {
    if (widget.onRefresherRefresh != null)
      widget.onRefresherRefresh!();
  }

  void _onLoading() async {
    if (widget.onRefresherLoad != null)
      widget.onRefresherLoad!();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Container(
                          child: Column(
                            children: [
                              if (widget.emailResend) ResendEmailWidget(),
                              if (widget.title != null)
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 15),
                                      child: widget.title!.text.xl2.make(),
                                    ),
                                    Spacer(),
                                    if (widget.leading != null)
                                    widget.leading!
                                  ],
                                ),
                              if (widget.subtitle != null)
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 15),
                                      child: widget.subtitle!.text.sm.make(),
                                    ),
                                  ],
                                ),
                              ...widget.children,
                            ],
                          ),
                        ),
                      ),
                    );
    return Scaffold(
      body: ModalContainerWidget(
        show: widget.show,
        type: widget.type,
        onReset: widget.onReset,
        onSucceed: widget.onSucceed,
        onFailed: widget.onFailed,
        onLoading: widget.onLoading,
        child: SafeArea(
            child: Container(
          child: NestedScrollView(
            headerSliverBuilder: (c, b) => [
              SliverAppBarWidget(logout: widget.logout, back: widget.back)
            ],
            body: Container(
              child: (widget.refresher) ? SmartRefresher(
                onLoading: _onLoading,
                onRefresh: _onRefresh,
                header: CustomHeader(
                  builder: (context, status) {
                    if (status == RefreshStatus.completed)
                      return SizedBox(
                        height: 60,
                        width: 60,
                        child: FlareActor(
                            'assets/animations/loading_success.flr',
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: "start"),
                      );
                    else if (status == RefreshStatus.failed)
                      return SizedBox(
                        height: 60,
                        width: 60,
                        child: FlareActor(
                            'assets/animations/loading_failure.flr',
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: "start"),
                      );
                    else if (isDark(context))
                      return SizedBox(
                        height: 60,
                        width: 60,
                        child: FlareActor(
                            'assets/animations/loading_dark.flr',
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: "start"),
                      );
                    else
                      return SizedBox(
                        height: 60,
                        width: 60,
                        child: FlareActor(
                            'assets/animations/loading_light.flr',
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: "start"),
                      );
                  },
                ),
                controller: _refreshController,
                child: body,
              ) : body,
            ),
          ),
        )),
      ),
    );
  }
}
