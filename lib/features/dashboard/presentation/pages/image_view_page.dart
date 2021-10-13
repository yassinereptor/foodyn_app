import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_rest/core/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_rest/core/data/models/image_model.dart';
import 'package:foodyn_rest/core/widgets/modal_container_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class ImageViewPage extends StatefulWidget {
  static const kRouteName = "/image-view";
  final ImageModel imageModel;

  const ImageViewPage({Key? key, required this.imageModel}) : super(key: key);

  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  late AuthBloc _authBloc;
  late String _token;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _token = _authBloc.state.token!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: NestedScrollView(
              headerSliverBuilder: (c, b) =>
                  [SliverAppBarWidget(logout: false, back: true)],
              body: Container(
                  child: PhotoView(
                imageProvider: CachedNetworkImageProvider(
                  dotenv.env["SERVER_LINK"]! +
                      widget.imageModel.filepath! +
                      widget.imageModel.filename!,
                  headers: {"Authorization": "Bearer $_token"},
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
