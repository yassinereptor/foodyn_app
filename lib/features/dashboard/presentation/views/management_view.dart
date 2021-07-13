import 'package:flutter/material.dart';

class ManagementView extends StatefulWidget {
  const ManagementView({Key? key}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Management"),
      )
    );
  }
}
