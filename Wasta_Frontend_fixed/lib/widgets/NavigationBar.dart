// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,
                  '/home'); // Replace '/home' with your actual route name for HomeScreen
            },
            child: const LogoWidget(
              imagePath: 'assets/icons/Pasted Graphic.png',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,
                  '/apps'); // Replace '/apps' with your actual route name for ApplicationsScreen
            },
            child: const LogoWidget(
                imagePath: 'assets/icons/Pasted Graphic 1.png'),
          ),
          const SizedBox(
            width: 5,
          ),
          const LogoWidget(imagePath: 'assets/icons/Pasted Graphic 2.png'),
          const SizedBox(
            width: 5,
          ), // No action for this one
          const LogoWidget(
              imagePath:
                  'assets/icons/Pasted Graphic 3.png'), // No action for this one
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final String imagePath;

  const LogoWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 25,
      height: 25,
    );
  }
}
