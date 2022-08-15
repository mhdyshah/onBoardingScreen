// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:onboardingscreen/home_page.dart';
import 'package:onboardingscreen/into_screens/intro_page1.dart';
import 'package:onboardingscreen/into_screens/intro_page2.dart';
import 'package:onboardingscreen/into_screens/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  PageController _controller = PageController();

  // keep track of if we are on last page or not
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // page view
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              lastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text("skip"),
              ),
              // dot indicator
              SmoothPageIndicator(controller: _controller, count: 3),

              // next or done
              lastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      child: Text("done"),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text("next"),
                    ),
            ],
          ),
        ),
      ],
    ));
  }
}
