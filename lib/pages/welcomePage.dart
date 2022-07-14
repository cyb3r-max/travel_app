import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/app_cubit.dart';
import 'package:weather_app/widget/appLargeText.dart';
import 'package:weather_app/widget/appText.dart';
import 'package:weather_app/widget/reponse_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List image = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  List header_text = ["Trip", "Mount", "Mind"];
  List header2_text = ["Mountain", "Everest", "Blowing"];
  List description_text = [
    "“The mountains are the last place where man can feel truly wild.” – We Dream of Travel",
    "“The great thing about reaching the top of the mountain is realising that there’s space for more than one person. And you’re now in the prime position to help others up.” – We Dream of Travel",
    "“I see every person as a mountain of sorts; we can see how they look from afar, but will never know them until we explore.” – We Dream of Travel"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/" + image[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: header_text[index]),
                        SizedBox(
                          height: 5,
                        ),
                        AppLargeText(
                          text: header2_text[index],
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 340,
                            child: AppText(
                                size: 15, text: description_text[index])),
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context).getData();
                            },
                            child: ResponseButton())
                      ],
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => Container(
                                margin: EdgeInsets.only(bottom: 3),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? Colors.indigo
                                        : Colors.indigo.withOpacity(.8)),
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
