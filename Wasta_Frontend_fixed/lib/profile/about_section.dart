import 'package:flutter/material.dart';
import 'package:new_try/register_screens/signup/Education.dart';


class AboutSection extends StatelessWidget {
  final String university;
  final String school;
  final List<String> skills;
  final String experience;
  final String location;
  final String degree;
  final String specialization;
  final String startYear;

  const AboutSection({super.key, 
    required this.university,
    required this.school,
    required this.skills,
    required this.experience,
    required this.location,
    required this.degree,
    required this.specialization,
    required this.startYear,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSection(
            context,
            title: 'Education Details',
            icon: Icons.school,
            content: 'University: $university\nSchool: $school',
          ),
          _buildSection(
            context,
            title: 'Skills',
            icon: Icons.build,
            content: skills.join(', '),
          ),
          _buildSection(
            context,
            title: 'Experience',
            icon: Icons.work,
            content: experience,
          ),
          _buildSection(
            context,
            title: 'Location',
            icon: Icons.location_on,
            content: location,
          ),
          _buildSection(
            context,
            title: 'Degree and Specialization',
            icon: Icons.book,
            content: 'Degree: $degree\nSpecialization: $specialization',
          ),
          _buildSection(
            context,
            title: 'Start Year',
            icon: Icons.calendar_today,
            content: startYear,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required IconData icon, required String content}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        color: greyhex, // Set the background color to greyhex
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFF130160), // darkbluehex
              size: 30.0,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF130160), // darkbluehex
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    content,
                    style: const TextStyle(
                      color: Color(0xFF130160), // darkbluehex
                      fontFamily: 'DM Sans',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
