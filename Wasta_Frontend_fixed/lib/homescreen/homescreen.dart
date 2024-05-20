// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_try/widgets/NavigationBar.dart';
import '../filters/filter.dart';
import 'package:new_try/widgets/search_bar.dart';

import '../models/response/get_all_internships.dart';
import '../profile/profile_run.dart';
import '../services/config.dart';
import 'package:http/http.dart' as http;

import '../widgets/job_card.dart';
import '../widgets/smaller_job_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> internships = [];

  @override
  void initState() {
    super.initState();
    fetchInternships();
  }

  Future<void> fetchInternships() async {
    try {
      final response =
          await http.get(Uri.parse(Config.apiUrl + Config.internship));
      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        setState(() {
          internships =
              responseBody.map((json) => Internships.fromJson(json)).toList();
        });
      } else {
        print('Failed to load internships: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load internships')),
        );
      }
    } catch (e) {
      print('Error fetching internships: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('An error occurred while loading internships')),
      );
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
              padding: EdgeInsets.only(left: 20, top: 70),
              child: Text(
                "Don't Waste-A Minute,\nSecure Your Internship Now!",
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
                  left: 340,
                  right: 20,
                  top: 45,
                ),
                child: GestureDetector(
                    onTap: () async {},
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
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 70, top: 150),
              child: Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(19, 1, 96, 0.1),
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: Colors.white, // Set border color to white
                    width: 2.0, // Set border width
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Enter skills or preferences....',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 340,
                right: 20,
                top: 45,
                child: GestureDetector(
                    onTap: () {
                      // Navigate to profile screen
                      // Replace `ProfileScreen()` with your actual profile screen widget
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
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
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 70, top: 150),
              child: Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(19, 1, 96, 0.1),
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: Colors.white, // Set border color to white
                    width: 2.0, // Set border width
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Enter skills or preferences....',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 150, // Adjust the position as needed
              right: 20, // Adjust the position as needed
              child: Container(
                alignment: Alignment.center,
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // Set border color to white
                    width: 2.0, // Set border width
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    // Navigate to the filter page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FilterScreen()), // Replace FilterPage() with your actual filter page widget
                    );
                  },
                  icon: const Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -190,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1500,
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
                left: 25,
                top: 230,
              ),
              child: Text(
                "Recommended for you",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 270, right: 15, left: 15),
                  child: SizedBox(
                    height:
                        150, // This SizedBox will give the ListView a bounded height
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const JobCard(
                          companyName: "Apliman",
                          jobTitle: "Graphic Designer",
                          logoImagePath: "assets/images/apliman.png",
                          address: "Beirut, Lebanon",
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height:
                        80, // Adjust the height as needed for the tags widget
                    child: CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Row(
                            children: <Widget>[
                              const Tag('All Intenships',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('UX/UI', backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('Frontend',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('Backend',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('Flutter',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('Data Science',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('Management',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              const Tag('Accounting',
                                  backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              Tag(
                                'Find More',
                                backgroundGradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromRGBO(36, 107, 253, 1),
                                    Color.fromRGBO(19, 1, 96, 1),
                                  ],
                                ),
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                onTap: () {
                                  // Navigate to the filter page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FilterScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add more widgets as needed
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 478, right: 15),
              child: SizedBox(
                height:
                    650, // Adjust the height as needed to accommodate more cards
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 0, // Vertical spacing between rows
                    crossAxisSpacing: 0, // Horizontal spacing between columns
                    childAspectRatio: 3 / 2, // Aspect ratio for the grid items
                  ), // Keep vertical scrolling
                  itemCount: internships
                      .length, // Increase this number to add more rows of cards
                  itemBuilder: (context, index) {
                    final internship = internships[index];
                    // Truncate the address to the first three words
                    final truncatedAddress =
                        internship.location.split(' ').take(3).join(' ') +
                            "...";

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Adjust spacing as needed
                          children: [
                            Expanded(
                              child: SmallerJobCard(
                                companyName: internship.company,
                                jobTitle: internship.title,
                                logoImagePath:
                                    internship.imageUrl.contains('http')
                                        ? internship.imageUrl
                                        : 'assets/images/profile.jpg',
                                address: truncatedAddress,
                              ),
                            ),
                            const SizedBox(
                              width:
                                  1, // Adjust the width of the SizedBox to add horizontal spacing
                            ),
                          ],
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
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

//        // Tag  //
class Tag extends StatelessWidget {
  final String text;
  final VoidCallback? onTap; // Make onTap nullable
  final TextStyle? textStyle; // TextStyle parameter
  final Color? backgroundColor; // Solid background color parameter
  final Gradient? backgroundGradient; // Gradient parameter

  const Tag(this.text,
      {super.key,
      this.onTap,
      this.textStyle,
      this.backgroundColor,
      this.backgroundGradient});

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
