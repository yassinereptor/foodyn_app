import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../pages/login_page.dart';
import 'package:seafarer/seafarer.dart';
import 'package:velocity_x/velocity_x.dart';

class SliverAppBarWidget extends StatefulWidget {
  final bool logout;
  final bool back;
  final Color? color;
  final BoxDecoration? decoration;

  const SliverAppBarWidget({Key? key, this.logout = false, this.back = true, this.color, this.decoration})
      : super(key: key);

  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  void _onLogout() {
    _authBloc.add(AuthEvent.logout());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.type.maybeWhen(
              loadingFailed: (AppFailure message) {
                message.maybeWhen(
                    storage: () {
                      final snackBar =
                          SnackBar(content: Text("Can't loged out"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    orElse: () {});
              },
              logedOut: () {
                Routes.seafarer.navigate(
                  LoginPage.kRouteName,
                  navigationType: NavigationType.pushAndRemoveUntil,
                  removeUntilPredicate: (route) => false,
                );
              },
              orElse: () {});
        },
        builder: (context, state) {
          return SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: widget.decoration,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FocusTraversalGroup(
                policy: OrderedTraversalPolicy(),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (widget.back) ? GestureDetector(
                        onTap: () => Routes.seafarer.pop(),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: (widget.color == null)
                                  ? Icon(Icons.arrow_back_ios)
                                  : Icon(
                                      Icons.arrow_back_ios,
                                      color: widget.color,
                                    ),
                            ),
                            (widget.color == null)
                                ? "Back".text.xl.make()
                                : "Back".text.xl.color(widget.color!).make(),
                          ],
                        ),
                      ) : Container(),
                      (widget.logout)
                          ? GestureDetector(
                              onTap: _onLogout,
                              child: "Log out"
                                  .text
                                  .xl
                                  .color((widget.color == null)
                                      ? GlobalTheme.kOrangeColor
                                      : widget.color!)
                                  .make(),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
