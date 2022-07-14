import 'package:flutter/material.dart';
import 'package:weather_app/widget/appText.dart';
class ResponseButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponseButton({Key? key,
  this.width=120,
  this.isResponsive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(

        width: isResponsive==true? double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurpleAccent,
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(
              margin: const EdgeInsets.only(left: 20),
                child: AppText(size: 20, text: "Book Trip",color: Colors.white,)): Container(),
            Image.asset("images/button-one.png"),
          ],
        ),
      ),
    );
  }
}
