// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// import '../widgets/password_field.dart';
import 'login.dart';
// import '../widgets/phone_number_field.dart';
import '../widgets/username_field.dart';
import '../widgets/email_field.dart';

class SkillsDropdown extends StatefulWidget {
  const SkillsDropdown({super.key});

  @override
  _SkillsDropdownState createState() => _SkillsDropdownState();
}

class _SkillsDropdownState extends State<SkillsDropdown> {
  final List<String> _skills = ['Flutter', 'Dart', 'Firebase', 'Figma', 'Git'];
  final List<String> _selectedSkills = [];

  void _toggleSkill(String skill) {
    setState(() {
      if (_selectedSkills.contains(skill)) {
        _selectedSkills.remove(skill);
      } else {
        _selectedSkills.add(skill);
      }
    });
  }

  List<Widget> _buildSkillsTags() {
    return _selectedSkills
        .map((skill) => Chip(
              label: Text(skill),
              onDeleted: () {
                _toggleSkill(skill);
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills',
          style: TextStyle(
              fontSize: 18.0, color: Colors.black, fontFamily: 'DM Sans'),
        ),
        Wrap(
          spacing: 8.0,
          children: _buildSkillsTags(),
        ),
        Container(
          height: 58.55,
          width: 317,
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Adjust padding as necessary
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Your Skills',

              filled: true,
              fillColor:
                  Colors.white, // Ensures the dropdown's fillColor is white
            ),
            items: _skills.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                _toggleSkill(newValue);
              }
            },
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Color greyhex =
        const Color(0xFFF8F1F1); // Define hex color inside the build method
    Color darkbluehex = const Color(0xFF130160);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Email text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'UserName',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      const UsernameField(),
                      const SizedBox(height: 3.0),

                      const SizedBox(height: 3.0),
                      const SkillsDropdown(),
                      const SizedBox(height: 10),

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
                      const EmailField(),
                      const SizedBox(height: 10),

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
                      // const PasswordField(),
                      const SizedBox(height: 15.0),
                      // Forgot Password text

                      Container(
                        width: 317,
                        height: 49,
                        decoration: BoxDecoration(
                          color: darkbluehex,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
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
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Login',
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
