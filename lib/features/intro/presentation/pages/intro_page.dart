import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:seafarer/seafarer.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/services/edge_insets_service.dart';
import '../../../../core/utils/lang.dart';

class IntroPage extends StatefulWidget {
  static String kRouteName = "/intro";
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  // List<String> titlesFr = ["Menu Principal", "Liste des séances"];
  // List<String> titlesAr = ["القائمة الرئيسية", "قائمة الحصص"];
  // List<String> descriptionFr = [
  //   "Vous pouvez choisir n'importe quelle section du menu principal pour accéder au détails",
  //   "Vous avez tous les quotas à la date que vous avez fixée, vous pouvez cliquer sur le quota pour obtenir plus d'informations"
  // ];
  // List<String> descriptionAr = [
  //   "يمكنك إختيار أي قسم من القائمة الرئيسية للوصول إلى التفاصيل",
  //   "لديك كل الحصص في التاريخ الذي حددته، يمكنك النقر في الحصة للحصول على مزيد من المعلومات"
  // ];

  // Animation<double> scaleAnimation;
  // AnimationController _scaleController;
  // List<Widget> widgets = [];

  // int index;

  setIntroAsSeen() {
    // Routes.seafarer.navigate(
    //   DashboardPage.kRouteName,
    //   navigationType: NavigationType.pushAndRemoveUntil,
    //   removeUntilPredicate: (route) => false,
    // );
  }

  @override
  void initState() {
    // setIntroAsSeen(); // To be removed

    // index = 0;
    // _scaleController = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // scaleAnimation = new CurvedAnimation(parent: _scaleController, curve: Curves.linear);

    // Future.delayed(Duration(milliseconds: 200)).then((value) => _scaleController.forward());
    super.initState();
  }

  @override
  void dispose() {
    // _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widgets = getWidgets(context);
    return Scaffold(
      body: SafeArea(
        child: Container(),
        // child: Stack(
        //   fit: StackFit.expand,
        //   children: [
        //     AnimatedCrossFade(
        //       duration: Duration(seconds: 2),
        //       crossFadeState: index == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        //       firstChild: Image.asset(
        //         "assets/images/group_2.png",
        //         fit: BoxFit.cover,
        //       ),
        //       secondChild: Image.asset(
        //         "assets/images/group_2_group_2_copy_rectangle_mask.png",
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Container(
        //         clipBehavior: Clip.hardEdge,
        //         height: MediaQuery.of(context).size.height * 0.35,
        //         decoration: BoxDecoration(
        //           color: isDark(context) ? GlobalTheme.kDarkModeBackground : Vx.gray200,
        //           borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        //         ),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
        //               child: Text(
        //                 isFr() ? titlesFr[index] : titlesAr[index],
        //                 style: TextStyle(
        //                   color: isDark(context) ? Vx.gray500 : Vx.gray800,
        //                   fontSize: 23.0,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
        //               child: Text(
        //                 isFr() ? descriptionFr[index] : descriptionAr[index],
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     fontSize: 15.0,
        //                     fontWeight: FontWeight.w400,
        //                     color: isDark(context) ? Colors.grey : Vx.gray600),
        //               ),
        //             ),
        //             Expanded(
        //                 child: Align(
        //               alignment: Alignment.bottomCenter,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     FlatButton(
        //                       onPressed: () {
        //                         setIntroAsSeen();
        //                       },
        //                       child: Text(
        //                         S.of(context).skip,
        //                         style: TextStyle(color: Vx.gray500),
        //                       ),
        //                     ),
        //                     DotsIndicator(
        //                       decorator: DotsDecorator(
        //                         activeColor: isDark(context) ? GlobalTheme.kDarkGreyBlue : Vx.gray800,
        //                         color: Vx.gray500,
        //                         size: Size(8, 8),
        //                         activeSize: Size(8, 8),
        //                         spacing: EdgeInsets.all(3),
        //                       ),
        //                       dotsCount: 2,
        //                       position: index.toDouble(),
        //                     ),
        //                     FlatButton(
        //                       onPressed: () {
        //                         if (index == 1)
        //                           setIntroAsSeen();
        //                         else {
        //                           if (index < 1) index++;
        //                           if (index == 1) {
        //                             _scaleController
        //                                 .reverse()
        //                                 .then((value) => setState(() {}))
        //                                 .then((value) => _scaleController.forward());
        //                           }
        //                         }
        //                       },
        //                       child: Row(
        //                         crossAxisAlignment: CrossAxisAlignment.center,
        //                         children: [
        //                           Text(
        //                             S.of(context).next,
        //                             style: TextStyle(color: isDark(context) ? Vx.gray500 : Vx.gray800),
        //                           ),
        //                           if (isFr())
        //                             Icon(
        //                               Icons.keyboard_arrow_right,
        //                               color: isDark(context) ? Vx.gray500 : Vx.gray800,
        //                             )
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ))
        //           ],
        //         ),
        //       ),
        //     ),
        //     widgets[index],
        //   ],
        // ),
      ),
    );
  }

  List<Widget> getWidgets(BuildContext context) {
    return [
      // Positioned(
      //   bottom: MediaQuery.of(context).size.height * 0.35 - 100 / 2,
      //   left: isFr() ? 30.0 : MediaQuery.of(context).size.width - 130,
      //   child: ScaleTransition(
      //     scale: scaleAnimation,
      //     alignment: Alignment.center,
      //     child: Stack(
      //       children: [
      //         Container(
      //           padding: EdgeInsets.all(20.0),
      //           height: 100.0,
      //           width: 100.0,
      //           decoration: BoxDecoration(
      //               color: isDark(context) ? Colors.black : Vx.gray100,
      //               borderRadius: BorderRadius.all(Radius.circular(30.0))),
      //           child: Image.asset("assets/images/ic_absence.png"),
      //         ),
      //         Container(
      //           alignment: Alignment.center,
      //           height: 20.0,
      //           width: 20.0,
      //           decoration: BoxDecoration(
      //             color: Vx.red600,
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           child: Text(
      //             "1",
      //             style: TextStyle(color: Vx.white, fontSize: 10, fontWeight: FontWeight.w500),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // Positioned(
      //   bottom: MediaQuery.of(context).size.height * 0.35 - 10,
      //   child: ScaleTransition(
      //     scale: scaleAnimation,
      //     child: Container(
      //       //color: Vx.red500,
      //       height: 100,
      //       width: MediaQuery.of(context).size.width,
      //       child: Container(
      //         decoration: BoxDecoration(
      //             color: isDark(context) ? Colors.black : Vx.gray100, borderRadius: BorderRadius.circular(10)),
      //         margin: EdgeInsets.symmetric(horizontal: 30.0),
      //         padding: EdgeInsetsService.only(left: 15.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(S.of(context).introSeance),
      //                 Container(
      //                   padding: EdgeInsets.all(5),
      //                   decoration: BoxDecoration(
      //                       borderRadius: isFr()
      //                           ? BorderRadius.horizontal(left: Radius.circular(20))
      //                           : BorderRadius.horizontal(right: Radius.circular(20)),
      //                       gradient: LinearGradient(
      //                           colors: isDark(context)
      //                               ? [Colors.teal.shade800, Colors.green.shade900]
      //                               : [Vx.green600, Vx.green500])),
      //                   child: Text(
      //                     S.of(context).introAbsence,
      //                     style: TextStyle(color: Vx.white, fontSize: 12),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   S.of(context).introMatiere,
      //                   style: TextStyle(fontWeight: FontWeight.w600),
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.all(5),
      //                   decoration: BoxDecoration(
      //                       borderRadius: isFr()
      //                           ? BorderRadius.horizontal(left: Radius.circular(20))
      //                           : BorderRadius.horizontal(right: Radius.circular(20)),
      //                       gradient: LinearGradient(
      //                           colors: isDark(context)
      //                               ? [GlobalTheme.kOrientaion2, GlobalTheme.darkOrange]
      //                               : [Vx.orange600, Vx.orange500])),
      //                   child: Text(
      //                     S.of(context).introExamen,
      //                     style: TextStyle(color: Vx.white, fontSize: 12),
      //                   ),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    ];
  }
}
