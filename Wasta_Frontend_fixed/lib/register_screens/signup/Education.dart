// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'Experiance.dart';

// Define global colors
const Color greyhex = Color(0xFFF8F1F1);
const Color darkbluehex = Color(0xFF130160);
const Color linkedinBlue = Color(0xFF0088CF);

class EducationDetailsScreen extends StatelessWidget {
  const EducationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyhex, // Use the global color
      appBar: AppBar(
        title: const Text("Education Details",
            style: TextStyle(color: Colors.white, fontFamily: 'DM Sans')),
        backgroundColor: darkbluehex,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'University or School',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Degree',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Specialization',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Start Year',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: darkbluehex,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExperienceScreen()),
                );
              },
              child: const Text("Next",
                  style: TextStyle(color: Colors.white, fontFamily: 'DM Sans')),
            ),
          ],
        ),
      ),
    );
  }
}
