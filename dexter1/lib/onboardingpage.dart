import 'package:dexter1/main.dart';
import 'package:dexter1/size_config.dart';
import 'package:dexter1/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/onboard_data.dart';

List<OnBoardingObject> onBoardingObjectList = [
  OnBoardingObject(
    title: 'Welcome',
    body: 'Welcome to this awesome intro screen app',
    image: 'assets/onboarding_image_1.png',
    backgroundColor: Colors.green.shade200,
  ),
  OnBoardingObject(
    title: 'Awesome App',
    body: 'This an awesome app, of intro screen design',
    image: 'assets/onboarding_image_2.png',
    backgroundColor: Colors.lightBlue.shade200,
  ),
  OnBoardingObject(
    title: 'Flutter App',
    body: 'Flutter is awesome for app development',
    image: 'assets/onboarding_image_3.png',
    backgroundColor: Colors.purple.shade200,
  ),
];

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  Color currentColor = onBoardingObjectList[0].backgroundColor;

  AnimatedContainer dotIndicator(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 300),
      height: currentPage == index ? 20 : 10,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setDisplayOnboard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    displayOnboard = await preferences.setBool('displayOnboard', false);
  }

  @override
  void initState() {
    super.initState();
    setDisplayOnboard();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: currentColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                      currentColor =
                          onBoardingObjectList[currentPage].backgroundColor;
                    });
                  },
                  itemBuilder: (context, index) => Container(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        if (currentPage != onBoardingObjectList.length - 1) {
                          currentPage++;
                          _pageController.animateToPage(
                            currentPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }),
                      child: Column(
                        children: [
                          SizedBox(
                            height: sizeV * 7.5,
                          ),
                          Text(
                            onBoardingObjectList[index].title,
                            style: titleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: sizeV * 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: sizeH * 10, right: sizeH * 10),
                            child: Text(
                              onBoardingObjectList[index].body,
                              style: bodyStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: sizeV * 5,
                          ),
                          SizedBox(
                            height: sizeV * 50,
                            child: Image.asset(
                              onBoardingObjectList[index].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: onBoardingObjectList.length,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => setState(() {
                          currentPage = onBoardingObjectList.length - 1;
                          _pageController.animateToPage(
                            currentPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: sizeH * 4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: List.generate(
                          onBoardingObjectList.length,
                          (index) => dotIndicator(index),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: IconButton(
                          onPressed: () {
                            if (currentPage ==
                                onBoardingObjectList.length - 1) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/homepage', (route) => false);
                            } else {
                              setState(() {
                                currentPage++;
                                _pageController.animateToPage(
                                  currentPage,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              });
                            }
                          },
                          icon: Icon(
                              currentPage == onBoardingObjectList.length - 1
                                  ? Icons.check
                                  : Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
