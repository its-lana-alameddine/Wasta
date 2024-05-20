// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:new_try/description/company_description_screen.dart'; // Import this for parsing JSON responses

class CompanySmallerJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final String address;
  final String internshipId; // New parameter for the internship ID

  const CompanySmallerJobCard({
    super.key,
    required this.address,
    required this.logoImagePath,
    required this.companyName,
    required this.jobTitle,
    required this.internshipId, // Pass the internship ID when creating the widget
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const companydescriptionscreen()),
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
                    Image.asset(
                      logoImagePath,
                      height: 30,
                    ),
                    const SizedBox(width: 70),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: Color.fromARGB(255, 202, 88, 88),
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Company'),
                                  content: const Text(
                                      'Are you sure you want to delete this company?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Delete'),
                                      onPressed: () async {
                                        await deleteInternship(
                                            internshipId); // Call the deletion function
                                        Navigator.of(context)
                                            .pop(); // Close the dialog after deletion
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Text(
                  jobTitle,
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
                        companyName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 10,
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

  // Function to delete an internship
  static Future<void> deleteInternship(String internshipId) async {
    final String apiUrl =
        'https://wasta.onrender.com/api/internships/$internshipId';

    try {
      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        print('Internship deleted successfully.');
      } else {
        throw Exception('Failed to delete internship.');
      }
    } catch (error) {
      print('Error deleting internship: $error');
    }
  }
}
