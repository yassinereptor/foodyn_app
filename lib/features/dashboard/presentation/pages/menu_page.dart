import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class MenuPage extends StatefulWidget {
  static const kRouteName = "/menu";

  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      logout: false,
      title: "Menu",
      children: [
        
      ],
    );
  }
}
