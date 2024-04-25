import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController? controller;

  const PhoneNumberField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 58.55,
      width: 317,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontFamily: 'DM Sans',
        ),
        decoration: const InputDecoration(
          labelText: 'Enter your phone number',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
