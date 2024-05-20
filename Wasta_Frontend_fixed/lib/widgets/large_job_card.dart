import 'package:flutter/material.dart';
import 'package:new_try/homescreen/homescreen.dart';

class LargeJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final String address;

  const LargeJobCard({
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
        left: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 350,
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    logoImagePath, // Path to your company logo image
                    height: 40,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    jobTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15, // Reduced font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 90),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Color.fromRGBO(203, 201, 212, 1),
                          size: 30,
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
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      companyName,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14, // Reduced font size
                      ),
                    ),
                    const Text(
                      " - ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        address,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
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
                        Tag('Full Time',
                            backgroundColor: Color.fromRGBO(
                                203, 201, 212, 1)), // Custom Tag widget
                        SizedBox(width: 10),
                        Tag('Remote',
                            backgroundColor: Color.fromRGBO(
                                203, 201, 212, 1)), // Custom Tag widget
                        SizedBox(width: 10),
                        Tag('Easy Apply',
                            backgroundColor: Color.fromRGBO(139, 206, 254, 1)),
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
  final VoidCallback? onTap; // Make onTap nullable
  final TextStyle? textStyle; // TextStyle parameter
  final Color? backgroundColor; // Solid background color parameter
  // Gradient parameter

  const Tag(
    this.text, {
    super.key,
    this.onTap,
    this.textStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // onTap can now be null
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor, // Use the solid color if provided
          // Use the gradient if provided
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
