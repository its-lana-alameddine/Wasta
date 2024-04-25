// ignore_for_file: unused_local_variable, unused_import, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import '../api/google_signin_api.dart';
import '../models/request/auth/login_model.dart';
import '../services/helpers/auth_helper.dart';
import 'signup_screen.dart';

import '../widgets/NavigationBar.dart';
import '../widgets/password_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Color greyhex =
        const Color(0xFFF8F1F1); // Define hex color inside the build method
    Color darkbluehex = const Color(0xFF130160);
    Color linkedinBlue = const Color(0xFF0088CF);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //login considering user type
    /* 
      Future<String> _login() async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email and password.'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
  }

  // Call the login function from AuthHelper
  // This should now return the user type along with the token
  final result = await AuthHelper.login(
      LoginModel(email: email, password: password),
  );

  if (result != null) {
      // Assuming result is a map with 'token' and 'userType' keys
      String userType = result['userType'];
      // Navigate to the appropriate screen based on user type
      if (userType == 'company') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CompanyHomePage()),
        );
      } else if (userType == 'normalUser') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegularHomePage()),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully, Welcome!'),
          backgroundColor: Colors.green,
        ),
      );
      return userType;
  } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please recheck your credentials'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
  }
  }
    */

    void _login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter your email and password.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Call the login function from AuthHelper
      bool loggedIn = await AuthHelper.login(
        LoginModel(email: email, password: password),
      );

      if (loggedIn) {
        // Navigate to the next screen on successful login
        // SignUp is the screen to navigate to
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Signup()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('loggedIn successfully, Welcome!'),
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
    }

    Future signIn() async {
      final user = await GoogleSignInApi.login();

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sign In With Google Failed'),
          backgroundColor: Colors.red,
        ));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Signup()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('loggedIn successfully, Welcome!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }

    return Scaffold(
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
        // Wrap your Column with SingleChildScrollView
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Email text
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
                      // Password text
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
                      // Forgot Password text
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
                        width: 317, // Set the desired width here
                        child: MaterialButton(
                          onPressed: _login,
                          height: 49,
                          color: darkbluehex,
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
                                        Image.asset('assets/images/google.png',
                                            width: 23, height: 23),
                                        const SizedBox(width: 8),
                                        const Text(
                                          "Google",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'DM Sans',
                                            color: Colors.grey,
                                            //  fontWeight: FontWeight.bold,
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
                              color: linkedinBlue,
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
                                            // fontWeight: FontWeight.bold,
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
      bottomNavigationBar: BottomNavigationBar(
        // Your custom color
        type: BottomNavigationBarType
            .fixed, // Use fixed when having more than three items
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 1.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 2.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 3.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          // Add your settings icon as necessary
        ],
      ),
    );
  }
}
