import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/config.dart';
import '../models/response/auth/get_internship.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final TextEditingController _searchQueryController = TextEditingController();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          _searchQueryController.clear();
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context, query);
  }

  Widget _buildResults(BuildContext context, String query) {
    return FutureBuilder<List<Internship>>(
      future: _searchInternships(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          // Handle the case where snapshot.data is null
          // Return a placeholder widget immediately after navigation
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/img.png'),
              const Text("No result found"),
            ],
          );
          // Placeholder widget
        } else {
          // Now we're sure snapshot.data is not null
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var result = snapshot.data![index];
              return ListTile(
                title: Text(result.title),
                subtitle: Text("${result.company} , ${result.contract}"),
              );
            },
          );
        }
      },
    );
  }

  Future<List<Internship>> _searchInternships(String query) async {
    if (query.isEmpty) {
      // Return an empty list or handle the case as needed
      return [];
    }
    try {
      // Construct the URL with the search query
      final uri = Uri.parse('${Config.apiUrl}${Config.search}$query');

      // Make the GET request
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Assuming the backend returns a list of strings
        List<dynamic> responseBody = jsonDecode(response.body);
        List<Internship> internships =
            responseBody.map((data) => Internship.fromJson(data)).toList();
        return internships;
      } else {
        throw Exception(
            'Failed to load search results. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load search results');
    }
  }
}
