import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/app_cubit.dart';
import 'package:weather_app/cubit/app_cubit_logics.dart';
import 'package:weather_app/pages/details_page.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/nav_pages/main_page.dart';
import 'package:weather_app/pages/welcomePage.dart';
import 'package:weather_app/services/data_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome mf",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AppCubit(data: DataServices()),
        child: AppCubitLogic(),
      ),
    );
  }
}
