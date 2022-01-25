import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/filter_text_form_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/qr_preset_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/qr_scanner_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class QrPage extends StatefulWidget {
  static const kRouteName = "/qr";

  const QrPage({Key? key}) : super(key: key);

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String? _filter;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> _qrAliasList = [
    "Hello1",
    "Hello1",
    "Hello1",
    "Hello2",
    "Hello1",
    "Hello1",
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async {}

  void requestRefresh() {
    _refreshController.requestRefresh();
  }

  void _onScannerTap() {
    Routes.seafarer.navigate(QrScannerPage.kRouteName);
  }

  void _onAddQrPresetTap() async {
    var result = await Routes.seafarer.navigate(QrPresetPage.kRouteName);
    if (result != null) requestRefresh();
  }

  void _onQrTap(int id) async {
    // var result = await Routes.seafarer.navigate(EateryPage.kRouteName, params: {
    //   "eateryModel": eateryModelList.singleWhere((element) => element.id == id)
    // });
    // if (result != null)
    // requestRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaffoldContainerWidget(
          refresher: true,
          logout: false,
          title: "Qr Manager",
          subtitle: "you can edit or delete a preset by clicking it",
          refreshController: _refreshController,
          onRefresherRefresh: _onRefresh,
          leading: InkWell(
              onTap: _onScannerTap,
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: 30,
                color: GlobalTheme.kOrangeColor,
              )),
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: FilterTextFormWidget(
                  onChange: (filter) {
                    if (filter != null) {
                      setState(() {
                        _filter = filter;
                      });
                    }
                  },
                )),
            ..._qrAliasList
                .filter((element) =>
                    (_filter == null) ? true : element.contains(_filter!))
                .mapIndexed((e, index) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: InkWell(
                        onTap: () => _onQrTap(index),
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: isDark(context)
                                  ? GlobalTheme.kPrimaryLightColor
                                  : GlobalTheme.kAccentDarkColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              children: [
                                e.text.make(),
                                Spacer(),
                                Icon(
                                  Icons.qr_code_2_rounded,
                                  size: 30,
                                  color: GlobalTheme.kOrangeColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                ))
                .toList(),
            SizedBox(
              height: 65,
            )
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
              onPressed: _onAddQrPresetTap),
        )
      ],
    );
  }
}
