import 'package:flutter/material.dart';
import 'package:new_try/description/description_screen.dart';
import 'package:new_try/homescreen/homescreen.dart';

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class SmallerJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final String address;

  const SmallerJobCard({
    super.key,
    required this.address,
    required this.logoImagePath,
    required this.companyName,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const descriptionscreen(), // Replace DescriptionScreen() with your actual description screen widget
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 150,
            padding: const EdgeInsets.only(left: 7),
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 2),
                      width: 35,
                      height: 35,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/profile.jpg',
                        image: logoImagePath.contains('http')
                            ? logoImagePath
                            : 'assets/images/profile.jpg',
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/profile.jpg',
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.bookmark_border,
                              color: Color.fromARGB(255, 0, 8, 118),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 5),
                Text(
                  jobTitle.capitalize(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Row(
                    children: [
                      Text(
                        companyName.capitalize(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        " - ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 10,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          address,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
