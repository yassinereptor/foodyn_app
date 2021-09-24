import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theme/global_theme.dart';

class BottomSheetWidget {

  static void showBottomSheetWidget(BuildContext context, Widget child){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
          
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
