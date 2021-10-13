import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../../core/bloc/config_bloc/config_bloc.dart';
import '../../../auth/presentation/pages/register_page.dart';
import 'package:seafarer/seafarer.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/utils/global_utils.dart';
import '../../../../core/utils/lang.dart';
import '../../../../core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

class LanguagesPage extends StatefulWidget {
  static const kRouteName = "/languages";
  final bool firstTime;

  LanguagesPage({Key? key, this.firstTime = true}) : super(key: key);

  @override
  _LanguagePageSstate createState() => _LanguagePageSstate();
}

class _LanguagePageSstate extends State<LanguagesPage> {
  final languages = GlobalUtils.kLanguages;

  int selectedIndex = 1;
  late ConfigBloc _configBloc;

  @override
  void initState() {
    _configBloc = context.read<ConfigBloc>();
    if (widget.firstTime == false) {
      if (isAr())
        selectedIndex = 0;
      else if (isEn())
        selectedIndex = 1;
      else if (isFr()) selectedIndex = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      emailResend: false,
      logout: false,
      back: !widget.firstTime,
      title: S.of(context).please_choose_language,
      subtitle: S.of(context).change_language_anytime,
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                S.load(Locale(languages[index].code));
                _configBloc.add(ConfigEvent.setLanguage(
                  languages[selectedIndex].code,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: (isDark(context))
                        ? GlobalTheme.kPrimaryLightColor
                        : GlobalTheme.kAccentDarkColor,
                    border: Border.all(
                        color: (selectedIndex != index)
                            ? ((isDark(context))
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor)
                            : GlobalTheme.kOrangeColor),
                    borderRadius: BorderRadius.circular(10)),
                height: 65,
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Image.asset(
                          languages[index].asset,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      languages[index].label.text.xl.make(),
                      Spacer(),
                      if (selectedIndex == index)
                        Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Icon(
                              Icons.check,
                              size: Vx.dp32,
                              color: GlobalTheme.kOrangeColor,
                            )),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox().h2(context),
          itemCount: languages.length,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: selectedIndex >= 0
              ? () {
                  S.load(Locale(languages[selectedIndex].code));
                  _configBloc.add(ConfigEvent.setLanguage(
                    languages[selectedIndex].code,
                  ));
                  if (widget.firstTime) {
                    Routes.seafarer.navigate(
                      RegisterPage.kRouteName,
                      navigationType: NavigationType.pushAndRemoveUntil,
                      removeUntilPredicate: (route) => false,
                    );
                  } else
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
                borderRadius: BorderRadius.circular(10)),
            padding: Vx.mH32,
            height: 65.0,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  S
                      .of(context)
                      .languages_continue
                      .text
                      .xl
                      .color((isDark(context))
                          ? GlobalTheme.kPrimaryColor
                          : GlobalTheme.kAccentColor)
                      .make(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
