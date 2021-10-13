import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ManagementView extends StatefulWidget {
  const ManagementView({Key? key}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: "Management".text.xl2.make(),
            ),
          ],
        ),
          Center(
            child: Text("Management"),
          ),
        ],
      )
    );
  }
}
