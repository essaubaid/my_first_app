import 'package:flutter/material.dart';
import 'package:my_first_app/pages/main_page/test_page.dart';
import 'package:my_first_app/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              const SizedBox(
                height: 40,
              ),
              const BuildAppLargeText(text: "Discover"),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  labelPadding: const EdgeInsets.only(
                    left: 0,
                    right: 40,
                  ),
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.only(
                    left: 0,
                    right: 40,
                  ),
                  indicator: const CircleTabIndicator(
                    color: Colors.black87,
                    radius: 3,
                  ),
                  tabs: const [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildPlacesPanel(),
                    Text("There"),
                    Text("Bye"),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestPage()),
                  );
                }),
                child: const Text("Hello"),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView buildPlacesPanel() {
    return ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(
              right: 15,
              top: 10,
            ),
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/img/mountain.jpeg",
                ),
              ),
            ),
          );
        });
  }

  Row appBar() {
    return Row(
      children: [
        const Icon(
          Icons.menu,
          size: 30,
          color: Colors.black54,
        ),
        Expanded(child: Container()),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  const _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
