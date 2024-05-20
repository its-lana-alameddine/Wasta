import 'package:flutter/material.dart';
import 'package:new_try/homescreen/homescreen.dart';

class JobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final String address;

  const JobCard({
    super.key,
    required this.address,
    required this.logoImagePath,
    required this.companyName,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(11),
          color: const Color.fromRGBO(19, 1, 96, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    logoImagePath, // Path to your company logo image
                    height: 40,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    jobTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15, // Reduced font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HomeScreen()), // Replace FilterPage() with your actual filter page widget
                          );
                        }, // Outlined icon
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10), // Reduced height

              // Reduced height
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      companyName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14, // Reduced font size
                      ),
                    ),
                    const Text(
                      " - ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        address,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Row(
                      children: [
                        Tag('Full Time'), // Custom Tag widget
                        SizedBox(width: 8),
                        Tag('Remote'), // Custom Tag widget
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;

  const Tag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white, // Dark background for tags
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, color: Colors.black),
      ),
    );
  }
}
