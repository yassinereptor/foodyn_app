import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';

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
    return ScaffoldContainerWidget(
      emailResend: false,
      children: [
      SizedBox(
        height: 10,
      ),
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
      SizedBox(
        height: 30,
      ),
      Text(
        """
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia magni rerum ipsa at quisquam, a consectetur cum labore quod laudantium quidem fuga pariatur sapiente. Laborum nobis repellat quis vitae a! 
              """,
        textAlign: TextAlign.justify,
      )
    ]);
  }
}
