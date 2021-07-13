import 'package:flutter/material.dart';

class RestaurantView extends StatefulWidget {
  const RestaurantView({Key? key}) : super(key: key);

  @override
  _RestaurantViewState createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Restaurant"),
      )
    );
  }
}
