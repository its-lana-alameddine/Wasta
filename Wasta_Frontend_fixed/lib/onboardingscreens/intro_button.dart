// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Intro_Button extends StatelessWidget {
  const Intro_Button({
    //putting attributes
    super.key,
    required this.onPressed,
    required this.text,
    required this.bottom,
    required this.top,
    required this.right,
    required this.left,
  });

  final void Function() onPressed;
  final String text;
  final double top;
  final double bottom;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromRGBO(9, 6, 55, 1),
            padding: EdgeInsets.only(
              left: left,
              right: right,
              top: top,
              bottom: bottom,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: Text(text),
        ));
  }
}
