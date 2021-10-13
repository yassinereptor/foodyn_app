import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({Key? key}) : super(key: key);

  @override
  _AnalysisViewState createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: "Analysis".text.xl2.make(),
            ),
          ],
        ),
          Center(
            child: Text("Analysis"),
          ),
        ],
      )
    );
  }
}
