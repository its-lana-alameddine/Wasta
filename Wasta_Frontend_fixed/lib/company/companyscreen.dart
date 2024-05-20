// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register_screens/login.dart';
import 'addinternship.dart';
import 'postedcompany.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyState();
}

class _CompanyState extends State<CompanyScreen> {
  int _selectedIndex = 0;

  ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    // Retrieve agentId from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String agentId = prefs.getString('userId') ?? '';
    String authToken = prefs.getString('token') ?? '';

    switch (index) {
      case 0: // Home icon tapped
        // Navigator.pushNamed(context, '/company');
        break;
      case 1: // Plus icon tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AddInternshipScreen(authToken: authToken, agentId: agentId),
          ),
        );
        break;
      // case 2: // Uncomment and adjust for other icons if needed
      //   Navigator.pushNamed(context, '/messaging'); // Example for messaging
      //   break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 241, 241, 1),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 60),
            child: Text(
              "Company \nSoftwave",
              style: TextStyle(
                color: Color.fromRGBO(13, 1, 64, 1),
                fontSize: 26,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 330,
              right: 20,
              top: 60,
            ),
            child: GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Login()), // Ensure Login is a valid widget
                    ),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/profile.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20, top: 160),
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(104, 104, 104, 1),
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder<DateTime?>(
                    valueListenable: selectedDate,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          value == null
                              ? "Jul 19 - Jul 25"
                              : "${DateFormat('MMM').format(value)} ${value.day}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );

                        if (picked != null && picked != DateTime.now()) {
                          selectedDate.value = picked;
                        }
                      },
                      child: const Icon(
                        Icons.calendar_month,
                        color: Color.fromRGBO(13, 1, 64, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 210,
                    bottom: 10,
                  ),
                  child: Text(
                    "Internship Statistic Report",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                StatisticCard(
                  title: 'New candidates to review',
                  value: 76,
                  color: Color.fromRGBO(255, 222, 92, 1),
                ),
                StatisticCard(
                  title: 'Schedule for today',
                  value: 3,
                  color: Color.fromRGBO(64, 200, 177, 1),
                ),
                StatisticCard(
                  title: 'Posted Internships',
                  value: 4,
                  color: Color.fromARGB(255, 96, 165, 235),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Pasted Graphic.png',
                  width: 22.83, height: 24.5),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(19, 1, 96, 1),
                ),
                child: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Pasted Graphic 2.png',
                  width: 22.83, height: 24.5),
              label: ''),
          // Add your settings icon as necessary
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final int value;
  final Color color;

  const StatisticCard(
      {super.key,
      required this.title,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space the elements apart
          children: [
            Expanded(
              // Use Expanded to ensure the text and icon take up the available space
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the text vertically
                children: [
                  Text(
                    '$value', // Display the number
                    style: const TextStyle(
                      fontSize: 28, // Make the number larger
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height:
                          8), // Add some space between the number and the title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16, // Make the title smaller
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20), // Add an arrow icon
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PostedCompanyScreen()),
          );
          // Handle card tap
        },
      ),
    );
  }
}
