import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  int size;
  final String text;
  final Color color;

  AppLargeText(
      {Key? key, this.color = Colors.black, this.size = 30, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
