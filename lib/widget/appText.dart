import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppText({
    Key? key,
    required this.size,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
        // textDirection: TextDirection.rtl,
        //textAlign: TextAlign.justify
      ),
    );
  }
}
