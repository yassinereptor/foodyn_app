import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/register_page.dart';
import '../../../welcome/presentation/pages/login_page.dart';
import 'package:foodyn_rest/features/intro/presentation/pages/intro_page.dart';
import 'package:seafarer/seafarer.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/l10n/l10n.dart';
import 'package:foodyn_rest/core/utils/global_utils.dart';
import 'package:foodyn_rest/core/utils/lang.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class LanguagesPage extends StatefulWidget {
  static const kRouteName = "/languages";
  bool firstTime;

  LanguagesPage({Key? key, this.firstTime = true}) : super(key: key);

  @override
  _LanguagePageSstate createState() => _LanguagePageSstate();
}

class _LanguagePageSstate extends State<LanguagesPage> {
  final languages = GlobalUtils.kLanguages;

  int selectedIndex = 1;
  late SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = BlocProvider.of<SplashBloc>(context);
    if (widget.firstTime == false){
      if (isAr())
        selectedIndex = 0;
      else if (isEn())
        selectedIndex = 1;
      else if (isFr())
        selectedIndex = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.firstTime) ? 
            AppBar(
              title: Text("Languages", style: TextStyle(color: GlobalTheme.kAccentColor),),
              backgroundColor: GlobalTheme.kPrimaryColor,
            ) :
            AppBar(
              title: Text("Languages", style: TextStyle(color: GlobalTheme.kAccentColor),),
              backgroundColor: GlobalTheme.kPrimaryColor,
              leading: (widget.firstTime) ? Container() : IconButton(
                color: GlobalTheme.kAccentColor,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Routes.seafarer.pop(),
              ),
            ),
      body: SafeArea(
        child: Padding(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  S
                  .of(context)
                  .please_choose_language
                  .text
                  .center
                  .medium
                  .xl2
                  .textStyle(Theme.of(context).textTheme.headline1!)
                  .make(),
                  SizedBox().h2(context),
                  S.of(context).change_language_anytime.text.center.sm.make(),
                ],
              )),
              SizedBox().h4(context),
              Flexible(
                flex: 2,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          
                        });
                        S.load(Locale(languages[index].code));
                        _splashBloc.add(SplashEvent.setLanguage(
                            languages[selectedIndex].code,
                          ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (isDark(context)) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
                          border: Border.all(color: (selectedIndex != index) ? 
                          ((isDark(context)) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor)
                           : GlobalTheme.kOrangeColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: Vx.mH32,
                        height: 65,
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Image.asset(languages[index].asset, width: 40, height: 40,),
                              ),
                              languages[index]
                                  .label
                                  .text
                                  .bold
                                  .xl
                                  .textStyle(
                                      Theme.of(context).textTheme.headline1!)
                                  .make(),
                              Spacer(),
                              if (selectedIndex == index)
                                Icon(Icons.check, size: Vx.dp32, color: GlobalTheme.kOrangeColor,),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox().h2(context),
                  itemCount: languages.length,
                ),
              ),
              SizedBox().h8(context),
              InkWell(
                      onTap: selectedIndex >= 0
                      ? () {
                          if (widget.firstTime){
                            Routes.seafarer.navigate(
                            RegisterPage.kRouteName,
                            navigationType: NavigationType.pushAndRemoveUntil,
                            removeUntilPredicate: (route) => false,
                          );
                          }
                          else
                            Routes.seafarer.pop();
                        }
                      : () async {
                          Fluttertoast.showToast(
                              msg: S.of(context).please_choose_preferred_lang,
                              toastLength: Toast.LENGTH_LONG,
                          );
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          color: GlobalTheme.kOrangeColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: Vx.mH32,
                        height: 65,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              S
                            .of(context)
                            .languages_continue
                                  .text
                                  .bold
                                  .xl
                                  .color((isDark(context)) ? GlobalTheme.kPrimaryColor : GlobalTheme.kAccentColor)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}