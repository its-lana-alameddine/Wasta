// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'Preferences.dart';

const Color greyhex = Color(0xFFF8F1F1); // Replace with your actual hex code
Color darkbluehex =
    const Color(0xFF130160); // Replace with your actual hex code

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _experienceController = TextEditingController();
  final _positionController = TextEditingController(); // New field for Position
  final _periodController = TextEditingController(); // New field for Period
  String? _selectedSkill;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience and Skills',
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
                controller: _experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience (Last Project or Internship)',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your experience';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(
                  labelText: 'Details (Project topic or Internship location)',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your position';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _periodController,
                decoration: const InputDecoration(
                  labelText: 'Period',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the period';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedSkill,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Skills',
                  border: OutlineInputBorder(),
                ),
                items: <String>['Skill 1', 'Skill 2', 'Skill 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedSkill = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a skill';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkbluehex,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PreferencesScreen()),
                    );
                  }
                },
                child: const Text('Next',
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
    _experienceController.dispose();
    _positionController.dispose();
    _periodController.dispose();
    super.dispose();
  }
}
