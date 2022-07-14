import 'package:flutter/material.dart';
import 'package:weather_app/widget/appText.dart';

class AppButtons extends StatelessWidget {
  Color color;
  Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? iconData;
  bool? isIcon;

  AppButtons({Key? key,
    required this.color,
    required this.size,
    required this.backgroundColor,
    required this.borderColor,
  this.text,
  this.iconData,
  this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1
        ),
      ),
      child: isIcon==false?Center(
        child: AppText(
          text: text!,
          size: 20,
          color: color,
        ),
      ):Center(
        child: Icon(iconData, color: color,)
      )
    );
  }
}
