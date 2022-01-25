import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/image_item_model.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/category_icon_package_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class AddCategoryPage extends StatefulWidget {
  static const kRouteName = "/add-category";

  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  File? _file;
  TextEditingController _titleTextEditingController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  String _getFileSize(File file, int decimals) {
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  void _selectImage() {
    Routes.seafarer.navigate(CategoryIconPackagePage.kRouteName);
  }

  void _onComplete() {

  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      logout: false,
      title: "Add Category",
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDark(context)
                      ? GlobalTheme.kPrimaryLightColor
                      : GlobalTheme.kAccentDarkColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectImage,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 150,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_rounded,
                                  size: 50,
                                  color: GlobalTheme.kOrangeColor,
                                ),
                                "Select image".text.center.sm.make()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(indent: 20, endIndent: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 150,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_rounded,
                                  size: 50,
                                  color: GlobalTheme.kOrangeColor,
                                ),
                                "Customize image".text.center.sm.make()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: TextFormWidget(
            onChanged: (_) {},
            hint: "Title *",
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '● Please enter title';
              }
              return null;
            },
            controller: _titleTextEditingController,
          )),
        ButtonWidget(
          onTap: _onComplete,
          children: [
            "Add"
                .text
                .xl
                .color((isDark(context))
                    ? GlobalTheme.kPrimaryColor
                    : GlobalTheme.kAccentColor)
                .make(),
          ],
        ),
      ],
    );
  }
}
