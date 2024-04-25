// import 'register_screens/forget_password.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';
import 'register_screens/login.dart';
import 'register_screens/signup_screen.dart';

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
      },
    ),

  );
}
