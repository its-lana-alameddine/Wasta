import 'package:flutter/material.dart';
//import 'package:new_try/onboardingscreens/intro_button.dart';
import 'package:new_try/onboardingscreens/intro_screen1.dart';
import 'package:new_try/onboardingscreens/intro_screen2.dart';
import 'package:new_try/onboardingscreens/intro_screen3.dart';
import 'package:new_try/onboardingscreens/intro_screen4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //controller to keep track of what page we are on
  final PageController _controller = PageController();

  //keep track if we are in the last page
  bool onLastPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: const [
            IntroScreen1(),
            IntroScreen2(),
            IntroScreen3(),
            IntroScreen4(),
          ],
        ),

        //If on the last page change to Intro  button
        if (onLastPage)
          const Text(" ")
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    _controller.animateToPage(3,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutCirc);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        right: 40, left: 40, top: 750, bottom: 20),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  )),

              // dot indicator

              Container(
                alignment: const Alignment(0, 0.9),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const ExpandingDotsEffect(
                      dotColor: Color.fromRGBO(201, 215, 229, 0.6),
                      activeDotColor: Color.fromRGBO(201, 215, 229, 1)),
                ),
              ),

              // next button

              GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOutCirc,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        right: 40, left: 40, top: 750, bottom: 20),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  )),
            ],
          ),
      ]),
    );
  }
}
