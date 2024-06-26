// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:new_try/widgets/NavigationBar.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../company/companyscreen.dart';
import '../homescreen/helloscreen.dart';
import '../services/helpers/auth_helper.dart';
import '../models/request/auth/login_model.dart';
import '../models/response/auth/login_res_model.dart';
import '../widgets/password_field.dart';
import '../api/google_signin_api.dart';
import 'signup/signup_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email and password.'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    LoginResponseModel? response = await AuthHelper.login(
      LoginModel(email: email, password: password),
    );

    if (response != null && response.token.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.token);
      await prefs.setString('userId', response.id);
      await prefs.setString('username', response.username);
      await prefs.setString('profile', response.profile);

      bool isAgent = response.isAgent == true;

      if (isAgent) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CompanyScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelloScreen()),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully, Welcome'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please recheck your credentials'),
          backgroundColor: Colors.red,
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future signIn() async {
    setState(() {
      _isLoading = true;
    });

    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign In With Google Failed'),
        backgroundColor: Colors.red,
      ));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HelloScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('loggedIn successfully, Welcome!'),
          backgroundColor: Colors.green,
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayLoaderWithAppIcon(
      isLoading: _isLoading,
      appIcon:
          Image.asset('assets/images/wasta_icon.png', width: 23, height: 23),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Signup()),
              ),
              child: const Text(
                'Signup',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xFF130160), Color(0xFF246BFD)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome to Wasta!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Login to continue using the app",
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
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F1F1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(41),
                      topRight: Radius.circular(41),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 58.55,
                          width: 317,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: emailController,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontFamily: 'DM Sans',
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: 'Enter your email',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        PasswordField(controller: passwordController),
                        const SizedBox(height: 5.0),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 317,
                          child: MaterialButton(
                            onPressed: _login,
                            height: 49,
                            color: const Color(0xFF130160),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Or Login With",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              width: 317,
                              height: 49,
                              child: MaterialButton(
                                onPressed: signIn,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/google.png',
                                              width: 23,
                                              height: 23),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "Google",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'DM Sans',
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            SizedBox(
                              width: 317,
                              height: 49,
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                color: const Color(0xFF0088CF),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/linkedIn.png',
                                              width: 23,
                                              height: 23),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "LinkedIn",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'DM Sans',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account yet?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'DM Sans',
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Signup()),
                                    );
                                  },
                                  child: const Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                ),
                              ],
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
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
