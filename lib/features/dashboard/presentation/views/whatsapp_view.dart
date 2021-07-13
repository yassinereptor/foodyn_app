import 'package:flutter/material.dart';

class WhatsappView extends StatefulWidget {
  const WhatsappView({Key? key}) : super(key: key);

  @override
  _WhatsappViewState createState() => _WhatsappViewState();
}

class _WhatsappViewState extends State<WhatsappView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Whatsapp"),
      )
    );
  }
}
