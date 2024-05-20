// import 'register_screens/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:new_try/applications.dart';
import 'package:new_try/company/companyscreen.dart';
import 'package:new_try/description/description_screen1.dart';
import 'package:new_try/homescreen/helloscreen.dart';
import 'package:new_try/homescreen/homescreen.dart';
import 'package:new_try/payment/pricing_screen.dart';

import 'onboarding.dart';
import 'register_screens/login.dart';
import 'register_screens/signup/signup_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      title: 'Wasta',
      routes: {
        '/signup': (context) =>
            const Signup(), // Define route for the sign-up page
        '/login': (context) => const Login(),
        '/company': (context) => const CompanyScreen(),
        '/pricing': (context) => const PricingScreen(),
        '/helloscreen': (context) => const HelloScreen(),
        '/description': (context) => const descriptionscreen1(),
        '/home': (context) => const HomeScreen(),
        '/apps': (context) => const ApplicationsScreen(),
      },
    ),
  );
}
