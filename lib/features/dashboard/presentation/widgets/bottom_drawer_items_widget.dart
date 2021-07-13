import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/dashboard/data/models/tabs_model.dart';

class BottomDrawerItemsWidget extends StatelessWidget {
  const BottomDrawerItemsWidget({
    required this.items,
    required this.drawerController,
    required this.dropArrowController,
    // required this.selectedMailbox,
    required this.onItemTapped,
  })  : assert(items != null),
        assert(drawerController != null),
        assert(dropArrowController != null),
        // assert(selectedMailbox != null),
        assert(onItemTapped != null);

  final List<TabsModel> items;
  final AnimationController drawerController;
  final AnimationController dropArrowController;
  // final MailboxPageType selectedMailbox;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final destinationButtons = <Widget>[];

    for (var index = 0; index < items.length; index += 1) {
      TabsModel item = items[index];
      destinationButtons.add(
        InkWell(
          onTap: () {
            drawerController.reverse();
            dropArrowController.forward();
            onItemTapped(index);
          },
          child: 
          ListTile(
            leading: Icon(item.icon, color: GlobalTheme.kPrimaryColor,),
            title: Text(item.title)
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
                constraints: BoxConstraints(
                  maxWidth: 50,
                  maxHeight: 10
                ),
                decoration: BoxDecoration(
                  color: GlobalTheme.kAccentDarkColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
          ],
        ),
        Column(
          children: destinationButtons,
        ),
      ],
    );
  }
}