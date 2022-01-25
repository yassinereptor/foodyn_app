import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_eatery/core/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_eatery/core/config/router/router.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';
import 'package:foodyn_eatery/core/data/models/image_model.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_eatery_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image/image.dart' as image;

class TransitionImageWidget extends StatefulWidget {
  final List<ImageModel>? links;
  final String title;
  final Size size;
  final void Function(int)? onTap;
  final bool padding;
  final bool bigTitle;
  final int id;

  const TransitionImageWidget(
      {Key? key, required this.id, this.padding = true, this.bigTitle = false, required this.links, required this.title, required this.size, this.onTap})
      : super(key: key);

  @override
  _TransitionImageWidgetState createState() => _TransitionImageWidgetState();
}

class _TransitionImageWidgetState extends State<TransitionImageWidget> {
  late String _token;
  late AuthBloc _authBloc;
  int _currentIndex = 0;
  Timer? _timer;
  
  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _token = _authBloc.state.token!;
    _timer = Timer.periodic(Duration(seconds: 6), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == widget.links!.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: (widget.padding) ? 10 : 0),
        child: InkWell(
          onTap: () {
            if (widget.onTap != null)
              widget.onTap!(widget.id);
          } ,
          child: Container(
            height: widget.size.height,
            width: widget.size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: GlobalTheme.kOrangeColor,
            ),
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: [
                (widget.links != null && widget.links!.length > 0) ? 
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(child: child, opacity: animation);
                        },
                        child: 
                        Container(
                          height: widget.size.height,
                          width: widget.size.width,
                          key: ValueKey<int>(_currentIndex),
                          child: Container(
                            child: 
                            CachedNetworkImage(
                              imageUrl: dotenv.env["SERVER_LINK"]! +
                                        widget.links![_currentIndex].filepath! + 
                                        widget.links![_currentIndex].filename!,
                              httpHeaders: {
                                "Authorization": "Bearer $_token"
                              },
                              fit: BoxFit.cover,
                            ),
                          )
                        )
                      ),
                      Container(
                  height: widget.size.height,
                      width: widget.size.width,
                  color: Colors.black.withOpacity(.3),)
                    ],
                  ),
                ) : Container(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ((!widget.bigTitle) ? widget.title.text : widget.title.text.xl2).color(GlobalTheme.kAccentColor).make(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
