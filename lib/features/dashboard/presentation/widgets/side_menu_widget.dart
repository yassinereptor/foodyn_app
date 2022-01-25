import 'dart:typed_data';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_eatery/core/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/menu_item_model.dart';
import 'package:image/image.dart' as image;
import 'package:velocity_x/velocity_x.dart';

class SideMenuWidget extends StatefulWidget {
  final double statusHeight;
  final double menuSize;
  final bool menuItemsFade;
  final bool menuTextItemsFade;
  final bool endItems;
  final bool endItemsText;
  final void Function() onMenuIconTap;
  final void Function() onEndItems;
  final void Function() onEndItemsText;
  final void Function(int index) onMenuItemTap;

  const SideMenuWidget(
      {Key? key,
      required this.statusHeight,
      required this.menuSize,
      required this.menuItemsFade,
      required this.menuTextItemsFade,
      required this.endItems,
      required this.endItemsText,
      required this.onMenuIconTap,
      required this.onEndItems,
      required this.onEndItemsText,
      required this.onMenuItemTap})
      : super(key: key);

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int _selectedIndex = 0;
  late AuthBloc _authBloc;
  late String _profileImagePath;
  late String _profileImageHash;
  late String _token;
  List<MenuItemModel> _menuItemModelList = [];

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    if (_authBloc.state.user!.image != null) {
      _profileImagePath = dotenv.env["SERVER_LINK"]!;
      _profileImagePath += _authBloc.state.user!.image!.filepath!;
      _profileImagePath += _authBloc.state.user!.image!.filename!;
      _profileImageHash = _authBloc.state.user!.image!.hash!;
      _token = _authBloc.state.token!;
    }
    _menuItemModelList = [
        new MenuItemModel(
        title: "Overview",
        icon: Icons.pie_chart,),
        new MenuItemModel(
        title: "Analysis", icon: Icons.bar_chart),
        new MenuItemModel(
        title: "Orders", icon: Icons.attach_money),
        new MenuItemModel(
        title: "Management", icon: Icons.apps)
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: new Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          borderRadius: (widget.menuSize == 80)
              ? BorderRadius.only(
                  topRight: Radius.circular(10), bottomRight: Radius.circular(10))
              : BorderRadius.zero,
          color: GlobalTheme.kOrangeColor,
          boxShadow: [
            if (widget.menuSize == 80)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
    
        ),
        width: widget.menuSize,
        child: AnimatedOpacity(
          onEnd: widget.onEndItems,
          duration: Duration(milliseconds: 100),
          opacity: widget.menuItemsFade ? 0 : 1,
          child: (widget.endItems)
              ? Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height - widget.statusHeight,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30, left: 20, right: 20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: widget.onMenuIconTap,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: GlobalTheme.kAccentColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30, left: 20, right: 20),
                            child: InkWell(
                              onTap: () => widget.onMenuItemTap(0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: GlobalTheme.kAccentColor,
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: (_authBloc.state.user!.image != null) ? ClipOval(
                                      child: 
                                      CachedNetworkImage(
                                        imageUrl: _profileImagePath,
                                        httpHeaders: {
                                          "Authorization": "Bearer $_token"
                                        },
                                        fit: BoxFit.cover,
                                        placeholder: (context, _) => 
                                        Image.memory(Uint8List.fromList(image.encodeJpg(BlurHash.decode(_profileImageHash).toImage(40, 40)))),
                                      ),
                                    ) : Center(child: Icon(Icons.person, color: GlobalTheme.kOrangeColor, size: 30)),
                                  ),
                                  AnimatedOpacity(
                                    onEnd: widget.onEndItemsText,
                                    duration: Duration(milliseconds: 200),
                                    opacity: widget.menuTextItemsFade ? 0 : 1,
                                    child: (widget.endItemsText)
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              height: 40,
                                              child: "Profile"
                                                  .text
                                                  .xl2
                                                  .color(GlobalTheme.kAccentColor)
                                                  .make(),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ),
                          ..._menuItemModelList.mapIndexed((currentValue, index) => Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 30, left: 20, right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                        widget.onMenuItemTap(index + 1);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (_selectedIndex == index)
                                                    ? GlobalTheme.kAccentColor
                                                    : Colors.transparent),
                                            child: Center(
                                              child: Icon(
                                                currentValue.icon,
                                                color: (_selectedIndex == index)
                                                    ? GlobalTheme.kOrangeColor
                                                    : GlobalTheme.kAccentColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          AnimatedOpacity(
                                            onEnd: widget.onEndItemsText,
                                            duration: Duration(milliseconds: 200),
                                            opacity:
                                                widget.menuTextItemsFade ? 0 : 1,
                                            child: (widget.endItemsText)
                                                ? Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        color: (_selectedIndex ==
                                                                index)
                                                            ? GlobalTheme
                                                                .kAccentColor
                                                            : Colors.transparent,
                                                      ),
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.only(
                                                          left: 20, right: 20),
                                                      height: 40,
                                                      child: currentValue
                                                          .title
                                                          .text
                                                          .xl2
                                                          .color((_selectedIndex ==
                                                                  index)
                                                              ? GlobalTheme
                                                                  .kOrangeColor
                                                              : GlobalTheme
                                                                  .kAccentColor)
                                                          .make(),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                    ),
                                  )),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: (widget.endItemsText) ? 20 : 60,
                                left: 20,
                                right: 20),
                            child: InkWell(
                              onTap: () => widget
                                  .onMenuItemTap(_menuItemModelList.length + 1),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.settings,
                                        color: GlobalTheme.kAccentColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    onEnd: widget.onEndItemsText,
                                    duration: Duration(milliseconds: 200),
                                    opacity: widget.menuTextItemsFade ? 0 : 1,
                                    child: (widget.endItemsText)
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              height: 40,
                                              child: "Settings"
                                                  .text
                                                  .xl2
                                                  .color(GlobalTheme.kAccentColor)
                                                  .make(),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 0, left: 20, right: 20),
                            child: InkWell(
                              onTap: () => widget
                                  .onMenuItemTap(_menuItemModelList.length + 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedOpacity(
                                    onEnd: widget.onEndItemsText,
                                    duration: Duration(milliseconds: 200),
                                    opacity: widget.menuTextItemsFade ? 0 : 1,
                                    child: (widget.endItemsText)
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            height: 40,
                                            child: "Foodyn.Rest.V0.0.1.Vanilla"
                                                .text
                                                .sm
                                                .color(GlobalTheme.kAccentColor)
                                                .make(),
                                          )
                                        : Container(),
                                  ),
                                  // Spacer()
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ),
      );
  }
}
