import 'package:flutter/material.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({Key? key}) : super(key: key);

  @override
  _LogoutViewState createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Logout"),
      )
    );
  }
}
