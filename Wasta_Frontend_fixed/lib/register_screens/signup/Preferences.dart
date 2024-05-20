// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

import '../login.dart';

const Color greyhex = Color(0xFFF8F1F1); // Replace with your actual hex code
Color darkbluehex =
    const Color(0xFF130160); // Replace with your actual hex code

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  String? _selectedInternshipPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences',
            style: TextStyle(color: Colors.white, fontFamily: 'DM Sans')),
        backgroundColor: darkbluehex,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: greyhex,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Prefered Internship Location',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedInternshipPosition,
                decoration: const InputDecoration(
                  labelText: 'Desired Internship Position',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                items: <String>['Position 1', 'Position 2', 'Position 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedInternshipPosition = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select an internship position';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkbluehex,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }
                },
                child: const Text('Submit',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'DM Sans')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}
