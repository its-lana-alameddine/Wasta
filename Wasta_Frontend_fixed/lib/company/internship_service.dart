// ignore_for_file: avoid_print

import 'dart:convert';

import '../services/config.dart';
import 'package:http/http.dart' as http;

class InternshipService {
  final String apiUrl = Config.apiUrl + Config.internships;

  Future<void> addInternship(
      String authToken, Map<String, dynamic> internshipDetails) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode(internshipDetails),
      );

      if (response.statusCode == 201) {
        print('Internship added successfully');
      } else {
        print('Failed to add internship: ${response.body}');
        throw Exception('Failed to add internship');
      }
    } catch (e) {
      print('Exception while adding internship: $e');
      rethrow; // Rethrow the exception to allow the caller to handle it
    }
  }
}
