import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_call_app/screen/dashboard.screen.dart';
import 'package:first_call_app/screen/onboard_model_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class OnBoardDopeScreen extends StatefulWidget {
  static const name = "/onBoardDope";
  const OnBoardDopeScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardDopeScreen> createState() => _OnBoardDopeScreenState();
}

class _OnBoardDopeScreenState extends State<OnBoardDopeScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                _storeOnBoardInfo();
                Get.offAll(() => ShowCaseWidget(
                        builder: Builder(
                      builder: (context) => const DashboardScreen(),
                    )));
              },
              child: const Text("SKIP"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: onBoardScreen.length,
          controller: _pageController,
          //    physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(onBoardScreen[index].image),
                Container(
                  height: 10.0,
                  child: ListView.builder(
                      itemCount: onBoardScreen.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              width: 8.0,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(10.0)),
                            )
                          ],
                        );
                      }),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      onBoardScreen[index].text,
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 40),
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    )
                  ],
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      onBoardScreen[index].desc,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                if (onBoardScreen[index].description1.isNotEmpty)
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        onBoardScreen[index].description1,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                if (onBoardScreen[index].description2.isNotEmpty)
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        onBoardScreen[index].description2,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                InkWell(
                  onTap: () {
                    if (index == onBoardScreen.length - 1) {
                      _storeOnBoardInfo();
                      Get.offAll(() => ShowCaseWidget(
                              builder: Builder(
                            builder: (context) => const DashboardScreen(),
                          )));
                    }
                    _pageController.nextPage(
                      duration: const Duration(microseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("NEXT",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white)),
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
