import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/image_item_model.dart';

class AspectRatioImageWidget extends StatefulWidget {
  final ImageItemModel item;

  const AspectRatioImageWidget({Key? key, required this.item})
      : super(key: key);

  @override
  _AspectRatioImageWidgetState createState() => _AspectRatioImageWidgetState();
}

class _AspectRatioImageWidgetState extends State<AspectRatioImageWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.item.aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: FileImage(widget.item.file), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
