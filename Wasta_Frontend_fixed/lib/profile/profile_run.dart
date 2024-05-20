// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register_screens/login.dart';
import 'about_section.dart';
import 'contact_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Tab> tabs = [
    const Tab(
      child: Row(
        children: [
          Icon(Icons.account_box, color: Colors.white), // Icon color
          SizedBox(width: 8), // Space between icon and text
          Expanded(
              child: Text("About",
                  style: TextStyle(color: Colors.white))), // Colored text
        ],
      ),
    ),
    const Tab(
      child: Row(
        children: [
          Icon(Icons.contact_page, color: Colors.white), // Icon color
          SizedBox(width: 8), // Space between icon and text
          Expanded(
              child: Text("Contact",
                  style: TextStyle(color: Colors.white))), // Colored text
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color greyhex = const Color(0xFFF8F1F1);
    Color darkbluehex = const Color(0xFF130160);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF130160),
                  Color(0xFF246BFD),
                ],
              ),
            ),
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          toolbarHeight: 275,
          title: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 35),
            child: Column(
              children: [
                profilePhotos(),
                profileName(),
                hobbies(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Handle logout
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear();
                      await prefs.remove('token');
                      // Navigate back to the login screen
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (route) => false);
                    },
                    child: const Text('Logout'),
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: const TabBarView(
          children: [
            SingleChildScrollView(
              child: AboutSection(
                university: 'Beirut Arab University',
                school: 'Nazareth Secondary School',
                skills: ['Java', 'Flutter', 'Node.js'],
                experience: '3 years of software development',
                location: 'Tripoli, Lebanon',
                degree: 'Bachelor of Computer Science',
                specialization: 'Software Engineering',
                startYear: '2020',
              ),
            ),
            SingleChildScrollView(
              child: ContactSection(),
            ),
          ],
        ),
      ),
    );
  }

  Padding hobbies() {
    return const Padding(
      padding: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      child: Text(
        "Traveller - Videographer - Designer",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  Padding profileName() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Riwa Hammoud",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container profilePhotos() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueGrey,
      ),
      width: 105,
      height: 105,
      alignment: Alignment.center,
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
          "https://picsum.photos/300/300",
        ),
      ),
    );
  }
}
