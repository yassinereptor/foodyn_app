import 'package:flutter/material.dart';

class MembershipView extends StatefulWidget {
  const MembershipView({Key? key}) : super(key: key);

  @override
  _MembershipViewState createState() => _MembershipViewState();
}

class _MembershipViewState extends State<MembershipView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Membership"),
      )
    );
  }
}
