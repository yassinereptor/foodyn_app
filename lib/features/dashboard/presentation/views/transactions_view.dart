import 'package:flutter/material.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  _TransactionsViewState createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Transactions"),
      )
    );
  }
}
