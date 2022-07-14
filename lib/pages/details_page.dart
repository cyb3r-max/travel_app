

import 'package:flutter/material.dart';
import 'package:weather_app/widget/appLargeText.dart';
import 'package:weather_app/widget/appText.dart';
import 'package:weather_app/widget/app_button.dart';
import 'package:weather_app/widget/reponse_button.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex=-1;
  int rating=3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage("images/mountain.jpeg"),
                      fit:  BoxFit.cover
                    )
                  ),
                )
            ),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.menu),
                        color: Colors.white
                    ),
                  ],
                )
            ),
            Positioned(
                top: 320,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(size: 30, text: "YeahMF",color: Colors.black45.withOpacity(0.8),),
                          AppLargeText(size: 30, text: "\$240", color: Colors.indigo,)
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.indigo,),
                          AppText(text: "Dhaka, BD", size: 15)

                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: [
                              ...List.generate(5, (index)=>
                                Icon(Icons.star, color: rating>index?Colors.amber:Colors.grey,),
                              ),
                              SizedBox(width: 10,),
                              AppText(size: 20, text: '5.0', color: Colors.black45,)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        
                        children: [
                          AppLargeText(size: 25, text: 'People', color: Colors.black.withOpacity(0.8),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      AppText(text: 'Number of people in your group', size: 15, color: Colors.black26),
                      Wrap(
                        children: List.generate(5, (index) =>
                          InkWell(
                            onTap: (){
                              setState((){
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10, top: 5),
                              child: AppButtons(
                                color: selectedIndex==index?Colors.white:Colors.black,
                                size: 50,
                                backgroundColor: selectedIndex==index?Colors.black:Colors.blueGrey,
                                borderColor: selectedIndex==index?Colors.black:Colors.blueGrey,
                                text: (index+1).toString(),
                                //iconData: Icons.favorite,
                                isIcon: false,
                              ),
                            ),
                          )
                      ),

                      ),
                      SizedBox(height: 30),
                      AppLargeText(size: 30, text: 'Descripiton',color: Colors.black.withOpacity(0.8),),
                      AppText(
                        size: 10,
                        text: "Go to the mountains. Mountains are calling you babe. Go to the mountains "
                            " Mountains are calling you babe Go to the mountains. Mountains are calling /n"
                            "you babe Go to the mountains. Mountains are calling you babe Go to the mountains./n"
                            " Mountains are calling you babe",
                        color: Colors.black45,)
                    ],
                  ),
                ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                        color: Colors.grey,
                        size: 50,
                        backgroundColor: Colors.white,
                        borderColor: Colors.grey,
                        isIcon: true,
                      iconData: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    ResponseButton(
                      isResponsive: true,

                    )
                  ],
                ),
            )
          ],
        ),
      )
    );
  }
}
