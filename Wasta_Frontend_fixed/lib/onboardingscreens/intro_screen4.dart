// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:new_try/onboardingscreens/intro_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen4 extends StatelessWidget {
  const IntroScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Take up all available width
      height: double.infinity, // Take up all available height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 44,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 509,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboarding/page4.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: 44,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 901,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 450,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/onboarding/page4.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 400,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(19, 1, 96, 1),
                            Color.fromRGBO(36, 107, 253, 1),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(25, 50, 20, 0),
                            child: Text(
                              'WASTA',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Poppins',
                                fontSize: 32,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: Text(
                              'Experience a platform that goes beyond internships.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Intro_Button(
                                  onPressed: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool('entrypoint', true);
                                    Navigator.pushReplacementNamed(
                                        context, '/signup');
                                  },
                                  text: "Lets Get Started !",
                                  left: 20,
                                  right: 20,
                                  top: 0,
                                  bottom: 0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
