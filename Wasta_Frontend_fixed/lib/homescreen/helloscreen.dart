// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:new_try/widgets/NavigationBar.dart';

import '../homescreen/homescreen.dart';
import '../profile/profile_run.dart';
import '../widgets/large_job_card.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 241, 241, 1),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 80),
            child: Text(
              "Hello,\nRiwa Hammoud.",
              style: TextStyle(
                color: Color.fromRGBO(13, 1, 64, 1),
                fontSize: 26,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 330,
                right: 20,
                top: 70,
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 195),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(19, 1, 96, 1),
              ),
              height: 150,
              child: Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          "30% off\nGet the Full Package!",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/pricing');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(255, 204, 0, 1),
                            ),
                            child: const Text(
                              "Activate Offer",
                              style: TextStyle(
                                color: Color.fromRGBO(19, 1, 96, 1),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 180,
              bottom: 330,
            ),
            child: Image.asset("assets/images/girl.png", height: 1000),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 25,
              top: 370,
            ),
            child: Text(
              "Find your Internship",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 165),
                child: Container(
                  height: 165,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(255, 204, 0, 0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/images/headhunting.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "44k",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Internship",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 15, top: 420),
                    child: Container(
                      height: 75,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(0, 173, 144, 0.6),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "66.8k",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Full time",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Blue container
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 15),
                    child: Container(
                      height: 75,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(41, 147, 255, 0.6),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the text vertically
                        children: [
                          Text(
                            "38.9k",
                            style: TextStyle(
                              color: Colors
                                  .black, // Adjust the text color as needed
                              fontSize: 20,
                              fontWeight: FontWeight
                                  .w700, // Adjust the font size as needed
                            ),
                          ),
                          Text(
                            "Part time",
                            style: TextStyle(
                              color: Colors
                                  .black, // Adjust the text color as needed
                              fontSize: 18, // Adjust the font size as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 25,
                  top: 620,
                ),
                child: Text(
                  "Recommended Internship",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 50, // Adjust the width as needed
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the home screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen()), // Ensure HomeScreen is a valid widget
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 620,
                  ),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Color.fromRGBO(22, 116, 187, 1),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 660, // Adjust this value based on your UI needs
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: LargeJobCard(
                companyName: "Apliman",
                jobTitle: "Graphic Designer",
                logoImagePath: "assets/images/apliman.png",
                address: "Beirut, Lebanon",
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
