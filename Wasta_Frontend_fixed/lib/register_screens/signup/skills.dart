import 'package:flutter/material.dart';

class SkillsSelectionScreen extends StatelessWidget {
  const SkillsSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Select Skill',
        ),
        items: <String>['Flutter', 'Dart', 'Firebase', 'Figma', 'Git']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
