import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theme/global_theme.dart';

class BottomSheetWidget {

  static void showBottomSheetWidget(BuildContext context, Widget child){
    double size = (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top) / MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            maxChildSize: size,
            expand: false,
            builder: (context, scrollController) {
          
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        constraints: BoxConstraints(maxHeight: 10, maxWidth: 50),
                        decoration: BoxDecoration(
                          color: GlobalTheme.kAccentDarkColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      )
                    ],
                  ),
                  child
                ],
              ),
            ),
          );
            },
          );
        });
  }

}
