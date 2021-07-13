import 'package:flutter/material.dart';

class ParameterView extends StatefulWidget {
  const ParameterView({Key? key}) : super(key: key);

  @override
  _ParameterViewState createState() => _ParameterViewState();
}

class _ParameterViewState extends State<ParameterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Parameter"),
      )
    );
  }
}
