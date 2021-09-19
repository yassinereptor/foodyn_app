import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/register_page.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class LearnmorePage extends StatefulWidget {
  static const kRouteName = "/learnmore";

  const LearnmorePage({Key? key}) : super(key: key);

  @override
  _LearnmorePageState createState() => _LearnmorePageState();
}

class _LearnmorePageState extends State<LearnmorePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBarWidget(),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isDark(context)
                        ? "assets/logos/foodyn_horizental_light_logo.png"
                        : "assets/logos/foodyn_horizental_dark_logo.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    color: GlobalTheme.kOrangeColor,
                    width: 1,
                    height: 50,
                    margin: EdgeInsets.only(left: 20, right: 20),
                  ),
                  Image.asset(
                    "assets/logos/uniksol_logo.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text("""
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
              """, textAlign: TextAlign.justify,)
            ],
          )
              ),
            ),
          )
        ]
      )));

  }
}
