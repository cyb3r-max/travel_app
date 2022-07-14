import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/app_cubit.dart';
import 'package:weather_app/cubit/app_cubit_state.dart';
import 'package:weather_app/widget/appLargeText.dart';
import 'package:weather_app/widget/appText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png': "balloning",
    'kayaking.png': "kayaking",
    'hiking.png': "hiking",
    'snorkling.png': "snorking",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubit, CubateState>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(
                text: 'Discover',
                size: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //tab_bar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabBar(color: Colors.black, radius: 4),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: 'Places',
                    ),
                    Tab(
                      text: 'Inpiration',
                    ),
                    Tab(
                      text: 'Natural',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    padding: EdgeInsets.only(left: 15),
                    itemCount: 3, //info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context)
                              .detaliState(info[index]);
                        },
                        child: Container(
                          width: 200,
                          height: 300,
                          margin: EdgeInsets.only(right: 15, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                  ),
                  Text("Mother"),
                  Text("Suurprise Mf"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(size: 22, text: 'Explore more'),
                  AppText(size: 15, text: 'See all')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      //margin: EdgeInsets.only(right: 15, top: 10),
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("images/" +
                                          images.keys.elementAt(index)),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}

class CircleTabBar extends Decoration {
  final Color color;
  double radius;

  CircleTabBar({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
