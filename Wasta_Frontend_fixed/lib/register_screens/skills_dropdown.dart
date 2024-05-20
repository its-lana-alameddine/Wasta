// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SkillsDropdown extends StatefulWidget {
  final Function(List<String>) onSkillsSelected;

  const SkillsDropdown({super.key, required this.onSkillsSelected});

  @override
  _SkillsDropdownState createState() => _SkillsDropdownState();
}

class _SkillsDropdownState extends State<SkillsDropdown> {
  final List<String> _skills = ['Flutter', 'Dart', 'Firebase', 'Figma', 'Git'];
  final List<String> _selectedSkills = [];

  void _toggleSkill(String skill) {
    setState(() {
      if (_selectedSkills.contains(skill)) {
        _selectedSkills.remove(skill);
      } else {
        _selectedSkills.add(skill);
      }
      widget.onSkillsSelected(_selectedSkills);
    });
  }

  List<String> getSelectedSkills() {
    return _selectedSkills;
  }

  List<Widget> _buildSkillsTags() {
    return _selectedSkills
        .map((skill) => Chip(
              label: Text(skill),
              onDeleted: () {
                _toggleSkill(skill);
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills',
          style: TextStyle(
              fontSize: 18.0, color: Colors.black, fontFamily: 'DM Sans'),
        ),
        Wrap(
          spacing: 8.0,
          children: _buildSkillsTags(),
        ),
        Container(
          height: 58.55,
          width: 317,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Your Skills',
              filled: true,
              fillColor: Colors.white,
            ),
            items: _skills.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                _toggleSkill(newValue);
              }
            },
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}
