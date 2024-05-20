// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_try/register_screens/signup/Education.dart';
import '../../models/request/auth/signup_model.dart';
import '../../services/config.dart';
import '../../widgets/email_field.dart';
import '../../widgets/password_field.dart';
import '../../widgets/username_field.dart';
import '../login.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> registerUser(SignupModel user) async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    // Check if the email is in a valid format
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Please enter a valid email address.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    final response = await http.post(
      Uri.parse(Config.apiUrl + Config.signupUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    print('Sending JSON: ${jsonEncode(user.toJson())}');

    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      print('Response body: ${response.body}');
      // Assuming 400 for validation errors
      // Handle validation errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Registration failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    } else if (response.statusCode == 409) {
      // Assuming 409 for duplicate data
      // Handle duplicate data error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Error: Email already in use. Please use a different email.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    } else {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Error: An unexpected error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color greyhex = const Color(0xFFF8F1F1);
    Color darkbluehex = const Color(0xFF130160);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xFF130160),
                Color(0xFF246BFD),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 90),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Let’s get started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 0.5),
              Container(
                decoration: BoxDecoration(
                  color: greyhex,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(41),
                    topRight: Radius.circular(41),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('UserName',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'DM Sans')),
                      const SizedBox(height: 4.0),
                      UsernameField(controller: usernameController),
                      const SizedBox(height: 4.0),
                      const SizedBox(height: 10),
                      const Text('Email',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'DM Sans')),
                      const SizedBox(height: 4.0),
                      EmailField(controller: emailController),
                      const SizedBox(height: 10),
                      const Text('Password',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'DM Sans')),
                      const SizedBox(height: 5.0),
                      PasswordField(controller: passwordController),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: darkbluehex,
                            fixedSize: const Size(317, 49),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onPressed: () async {
                          String username = usernameController.text.trim();
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();

                          // Ensure all fields are filled
                          if (username.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Error. There is empty fields.')),
                            );
                            return;
                          }

                          SignupModel user = SignupModel(
                            username: username,
                            email: email,
                            password: password,
                          );

                          bool registered = await registerUser(user);

                          if (registered) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EducationDetailsScreen(),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registered Successefully.'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: const Text("SIGN UP",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey, fontFamily: 'DM Sans')),
                          const SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login())),
                            child: const Text('Login',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'DM Sans')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Pasted Graphic.png',
                  width: 22.83, height: 24.5),
              label: ' '),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Pasted Graphic 1.png',
                  width: 22.83, height: 24.5),
              label: ' '),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Pasted Graphic 2.png',
                  width: 22.83, height: 24.5),
              label: ' '),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Pasted Graphic 3.png',
                  width: 22.83, height: 24.5),
              label: ' '),
        ],
      ),
    );
  }
}
