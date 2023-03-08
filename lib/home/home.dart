import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageUI extends StatefulWidget {
  HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  final _controller = PageController();
  int selectedIndex = 1;
  List mycards = [
    " MyCard(),"
        " MyCasdasdadrd(),"
        " MasdasdasyCard(),"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Testing",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  Icon(Icons.add),
                ],
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Container(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return selectedIndex == index ? MyCard() : MyCard();
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
            ),

            // MyCard(),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  MyCard({
    super.key,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  var rating = 12.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 350,
        height: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              offset: Offset(-2, 25),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "widget.mytext,",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Text(
              "23423424",
              style: TextStyle(fontSize: 12),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Stack(
                      children: const [
                        Positioned(
                          child: CircleAvatar(
                            backgroundColor: Colors.orange,
                            // backgroundImage: AssetImage(/"image1.jpg"),
                            radius: 20,
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            // backgroundImage: AssetImage("image2.jpg"),
                            radius: 20,
                          ),
                        ),
                        Positioned(
                          left: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: rating,
                      label: rating.toString(),
                      onChanged: (newRating) {
                        setState(() {
                          rating = newRating;
                        });
                      },
                      min: 0,
                      max: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
