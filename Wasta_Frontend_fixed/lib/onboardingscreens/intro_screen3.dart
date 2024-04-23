import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

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
                  image: AssetImage('assets/onboarding/page3.jpg'),
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
                          image: AssetImage('assets/onboarding/page3.jpg'),
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
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(36, 107, 253, 1),
                            Color.fromRGBO(19, 1, 96, 1)
                          ],
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 50, 20, 0),
                            child: Text(
                              'Build Connections',
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: Text(
                              'Effortlessly connecting students with perfect internship opportunities and companies with ideal interns.',
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
