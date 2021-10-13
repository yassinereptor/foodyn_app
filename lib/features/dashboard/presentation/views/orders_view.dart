import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: "Orders".text.xl2.make(),
            ),
          ],
        ),
          Center(
            child: Text("Orders"),
          ),
        ],
      )
    );
  }
}
