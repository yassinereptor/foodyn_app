import 'package:flutter/material.dart';

class ManagementView extends StatefulWidget {
  const ManagementView({Key? key}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> 
with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

        ],
      )
    );
  }

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  // TODO: implement key
  Key? get key => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }
}
