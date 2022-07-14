import 'package:flutter/material.dart';
import 'package:weather_app/pages/nav_pages/bar_item.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/nav_pages/profile_page.dart';

import 'search_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    ProfilePage()
  ];
  int currentIndex=0;
  void onTap(int index){
      setState((){
        currentIndex=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps),),
          BottomNavigationBarItem(label:"Bar Item",icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search),),
          BottomNavigationBarItem(label:"Profile",icon: Icon(Icons.person),),
        ],
      ),
    );
  }
}
