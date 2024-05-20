// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:new_try/widgets/company_smallerjobcard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../company/addinternship.dart';
import '../company/companyscreen.dart';

class PostedCompanyScreen extends StatefulWidget {
  const PostedCompanyScreen({super.key});

  @override
  State<PostedCompanyScreen> createState() => _PostedCompanyScreenState();
}

class _PostedCompanyScreenState extends State<PostedCompanyScreen> {
  int _selectedIndex = 0; // Default index for the home screen
  String? authToken;
  String? agentId;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    loadSharedPreferences();
  }

  Future<void> loadSharedPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        authToken = prefs.getString('authToken') ?? '';
        agentId = prefs.getString('agentId') ?? '';
      });
      _updateScreens();
    } catch (e) {
      // Handle errors appropriately
      print("Failed to load shared preferences: $e");
    }
  }

  void _updateScreens() {
    setState(() {
      _screens = [
        const CompanyScreen(),
        AddInternshipScreen(authToken: authToken!, agentId: agentId!),
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Home icon tapped
        Navigator.pushNamed(context, '/company');
        break;
      case 1: // Plus icon tapped
        Navigator.pushNamed(context, '/add-internship');
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(36, 107, 253, 1),
              Color.fromRGBO(19, 1, 96, 1),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 80),
              child: Text(
                "Discover Your \nNext Best Intern!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 310,
                  right: 20,
                  top: 50,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/images/profile.jpg"),
                )),
            Positioned(
              top: -220,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1700,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 400,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(38),
                          color: const Color.fromRGBO(245, 241, 241, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 220,
              ),
              child: Text(
                "Your Posted Internship Opportunities: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 290),
                  child: SizedBox(
                    height:
                        80, // Adjust the height as needed for the tags widget
                    // child: CustomScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   slivers: <Widget>[
                    //     SliverToBoxAdapter(
                    //       child: Row(
                    //         children: <Widget>[
                    //           const Tag('All Intenships',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('UX/UI', backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('Frontend',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('Backend',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('Flutter',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('Data Science',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('Management',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           const Tag('Accounting',
                    //               backgroundColor: Colors.white),
                    //           const SizedBox(width: 8),
                    //           Tag(
                    //             'Find More',
                    //             backgroundGradient: const LinearGradient(
                    //               begin: Alignment.centerLeft,
                    //               end: Alignment.topRight,
                    //               colors: [
                    //                 Color.fromRGBO(36, 107, 253, 1),
                    //                 Color.fromRGBO(19, 1, 96, 1),
                    //               ],
                    //             ),
                    //             textStyle: const TextStyle(
                    //                 fontSize: 14,
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold),
                    //             onTap: () {
                    //               // Navigate to the filter page
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         const FilterScreen()),
                    //               );
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
                // Add more widgets as needed
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270, right: 20),
              child: SizedBox(
                height:
                    650, // Adjust the height as needed to accommodate more cards
                child: ListView.builder(
                  scrollDirection: Axis.vertical, // Keep vertical scrolling
                  itemCount:
                      5, // Increase this number to add more rows of cards
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Adjust spacing as needed
                          children: [
                            Expanded(
                              child: CompanySmallerJobCard(
                                companyName: "Interphase",
                                jobTitle: "UI designer",
                                logoImagePath: "assets/images/Softwave.png",
                                address: "Sahat al nour...",
                                internshipId: '65d522f28ab5f03c8a974898',
                              ),
                            ),
                            SizedBox(
                              width:
                                  1, // Adjust the width of the SizedBox to add horizontal spacing
                            ),
                            Expanded(
                              child: CompanySmallerJobCard(
                                companyName: "Softwave",
                                jobTitle: "Software Engineer",
                                logoImagePath: "assets/images/Softwave.png",
                                address: "New York, USA",
                                internshipId: '',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              10, // Adjust the height of the SizedBox to add vertical spacing between rows
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
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

//        // Tag  //
class Tag extends StatelessWidget {
  final String text;
  final VoidCallback? onTap; // Make onTap nullable
  final VoidCallback onDelete;
  final TextStyle? textStyle; // TextStyle parameter
  final Color? backgroundColor; // Solid background color parameter
  final Gradient? backgroundGradient; // Gradient parameter

  const Tag(this.text,
      {super.key,
      this.onTap,
      this.textStyle,
      this.backgroundColor,
      this.backgroundGradient,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // onTap can now be null
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor, // Use the solid color if provided
          gradient: backgroundGradient, // Use the gradient if provided
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                  fontSize: 12,
                  color: Colors
                      .black), // Use the provided textStyle or default if not provided
        ),
      ),
    );
  }
}
