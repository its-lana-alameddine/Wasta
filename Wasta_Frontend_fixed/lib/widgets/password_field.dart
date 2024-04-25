// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.55,
      width: 317,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              controller: widget.controller,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'DM Sans',
              ),
              decoration: const InputDecoration(
                labelText: 'Enter your password',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
