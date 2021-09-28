import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/dashboard/data/models/menu_item_model.dart';
import 'package:velocity_x/velocity_x.dart';

class SideMenuWidget extends StatefulWidget {
  final double menuSize;
  final bool menuItemsFade;
  final bool menuTextItemsFade;
  final bool endItems;
  final bool endItemsText;
  final void Function() onMenuIconTap;
  final void Function() onEndItems;
  final void Function() onEndItemsText;
  final void Function(int index) onMenuItemTap;
  final List<MenuItemModel> menuItemModelList;

  const SideMenuWidget(
      {Key? key,
      required this.menuSize,
      required this.menuItemsFade,
      required this.menuTextItemsFade,
      required this.endItems,
      required this.endItemsText,
      required this.onMenuIconTap,
      required this.onEndItems,
      required this.onEndItemsText,
      required this.onMenuItemTap,
      required this.menuItemModelList})
      : super(key: key);

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
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
      ),
      width: widget.menuSize,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: widget.menuItemsFade ? 0 : 1,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        onEnd: widget.onEndItems,
                        duration: Duration(milliseconds: 200),
                        opacity: widget.menuItemsFade ? 0 : 1,
                        child: (widget.endItems)
                            ? InkWell(
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
                              )
                            : Container(),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        onEnd: widget.onEndItems,
                        duration: Duration(milliseconds: 200),
                        opacity: widget.menuItemsFade ? 0 : 1,
                        child: (widget.endItems)
                            ? InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: GlobalTheme.kAccentColor,
                                  ),
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            : Container(),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.menuItemModelList.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, left: 20, right: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                  onEnd: widget.onEndItems,
                                  duration: Duration(milliseconds: 200),
                                  opacity: widget.menuItemsFade ? 0 : 1,
                                  child: (widget.endItems)
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = index;
                                            });
                                            widget.onMenuItemTap(index);
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (_selectedIndex == index)
                                                    ? GlobalTheme.kAccentColor
                                                    : Colors.transparent),
                                            child: Center(
                                              child: Icon(
                                                widget.menuItemModelList[index]
                                                    .icon,
                                                color: (_selectedIndex == index)
                                                    ? GlobalTheme.kOrangeColor
                                                    : GlobalTheme.kAccentColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container()),
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
                                            color: (_selectedIndex == index)
                                                ? GlobalTheme.kAccentColor
                                                : Colors.transparent,
                                          ),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          height: 40,
                                          child: widget.menuItemModelList[index]
                                              .title.text.xl2
                                              .color((_selectedIndex == index)
                                                  ? GlobalTheme.kOrangeColor
                                                  : GlobalTheme.kAccentColor)
                                              .make(),
                                        ),
                                      )
                                    : Container(),
                              ),
                              Spacer()
                            ],
                          ),
                        )),
                Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 0, left: 20, right: 20),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        onEnd: widget.onEndItems,
                        duration: Duration(milliseconds: 200),
                        opacity: widget.menuItemsFade ? 0 : 1,
                        child: (widget.endItems)
                            ? InkWell(
                                onTap: () => widget.onMenuItemTap(
                                    widget.menuItemModelList.length),
                                child: Container(
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
                              )
                            : Container(),
                      ),
                      AnimatedOpacity(
                        onEnd: widget.onEndItemsText,
                        duration: Duration(milliseconds: 200),
                        opacity: widget.menuTextItemsFade ? 0 : 1,
                        child: (widget.endItemsText)
                            ? Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 20, right: 20),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
