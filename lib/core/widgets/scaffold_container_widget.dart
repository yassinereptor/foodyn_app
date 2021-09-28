import 'package:flutter/material.dart';
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
  final String? title;
  final String? subtitle;
  final ModalContainerType type;
  final void Function()? onLoading;
  final void Function()? onSucceed;
  final void Function()? onFailed;

  const ScaffoldContainerWidget(
      {Key? key,
      required this.children,
      this.show = false,
      this.logout = false,
      this.back = true,
      this.emailResend = true,
      this.title,
      this.subtitle,
      this.type = ModalContainerType.LOADING,
      this.onLoading,
      this.onSucceed,
      this.onFailed})
      : super(key: key);

  @override
  _ScaffoldContainerWidgetState createState() => _ScaffoldContainerWidgetState();
}

class _ScaffoldContainerWidgetState extends State<ScaffoldContainerWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalContainerWidget(
        show: widget.show,
        type: widget.type,
        onSucceed: widget.onSucceed,
        onFailed: widget.onFailed,
        onLoading: widget.onLoading,
        child: SafeArea(
          child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverAppBarWidget(logout: widget.logout, back: widget.back),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Container(
                            child: Column(
                              children: [
                                if (widget.emailResend)
                                ResendEmailWidget(),
                                if (widget.title != null)
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 15),
                                      child: widget.title!
                                          .text
                                          .xl2
                                          .make(),
                                    ),
                                  ],
                                ),
                                if (widget.subtitle != null)
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, bottom: 15),
                                      child: widget.subtitle!.text.sm.make(),
                                    ),
                                  ],
                                ),
                                ...widget.children,
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
        ),
      ),
    );
  }
}
