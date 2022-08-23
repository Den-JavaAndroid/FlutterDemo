import 'package:demo/misc/colors.dart';
import 'package:demo/widgets/app_large_text.dart';
import 'package:demo/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "turist.jpg":"Turist",
    "turist2.jpg":"Turist2",
    "turist.jpg":"Turist",
    "turist2.jpg":"Turist2",
    "turist2.jpg":"Turist2"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          //discover text
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover")),
          SizedBox(height: 20),
          //tapbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                indicator:
                    CircleTabIncdicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Inspirations"),
                  Tab(text: "Emotions")
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15, top: 10),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("img/turist.jpg"),
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                ),
                Text("There"),
                Text("Bye"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22),
                AppText(
                  text: "See all",
                  color: AppColors.textColor1,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/${images.keys.elementAt(index)}"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(height:10 ),
                        Container(
                          child: AppText(
                              text: images.values.elementAt(index), color: AppColors.textColor2),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabIncdicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIncdicator({required this.color, required this.radius});

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
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
