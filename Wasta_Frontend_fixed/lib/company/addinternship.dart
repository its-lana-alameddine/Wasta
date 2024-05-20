// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'internship_service.dart';

class AddInternshipScreen extends StatefulWidget {
  final String authToken;
  final String agentId;

  const AddInternshipScreen({
    super.key,
    required this.authToken,
    required this.agentId,
  });

  @override
  _AddInternshipScreenState createState() => _AddInternshipScreenState();
}

class _AddInternshipScreenState extends State<AddInternshipScreen> {
  final Map<String, bool> _isExpanded = {
    'Internship position': false,
    'Internship type': false,
    'Internship location': false,
    'Type of workspace': false,
    'Requirements': false,
    'Description': false,
    'Facilities & Benefits': false,
    'Salary': false,
    'Period': false,
  };

  final List<String> labels = [
    'Internship position',
    'Internship type',
    'Internship location',
    'Type of workspace',
    'Requirements',
    'Description',
    'Facilities & Benefits',
    'Salary',
    'Period'
  ];

  final List<String> dropdownLabels = [
    'Internship type',
    'Type of workspace',
    'Internship location',
  ];

  final Map<String, String> selectedOptions = {
    'Internship position': '',
    'Internship type': 'Full Time',
    'Internship location': 'Beirut, Lebanon',
    'Type of workspace': 'Remote',
    'Requirements': '',
    'Description': '',
    'Facilities & Benefits': '',
    'Salary': '',
    'Period': '',
  };

  final Map<String, List<String>> dropdownOptions = {
    'Internship type': ['Full Time', 'Part Time', 'Contract'],
    'Type of workspace': ['Remote', 'Hybrid', 'On-site'],
    'Internship location': [
      // Lebanon locations
      'Beirut, Lebanon',
      'Sidon, Lebanon',
      'Tripoli, Lebanon',
      'Byblos, Lebanon',
      'Tyre, Lebanon',
      'Baalbek, Lebanon',
      'Jounieh, Lebanon',
      'Zahle, Lebanon',
      'Batroun, Lebanon',
      'Aley, Lebanon',
      'Nabatieh, Lebanon',
      'Zahlé, Lebanon',
      'Jbeil, Lebanon',
      'Baabda, Lebanon',
      'Bint Jbeil, Lebanon',
      'Rashaya, Lebanon',
      'Bekaa Valley, Lebanon'
    ],
  };

  late String companyName; // Variable to store company name
  late String imageUrl; // Variable to store image URL
  final InternshipService _internshipService = InternshipService();
  final Map<String, TextEditingController> textControllers = {};

  @override
  void initState() {
    super.initState();
    for (var label in labels) {
      textControllers[label] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedOptions.forEach((key, value) async {
      await prefs.setString(key, value);
    });
  }

  Widget widgetForLabel(String label) {
    if (dropdownLabels.contains(label)) {
      String selectedValue = selectedOptions[label]!;
      return DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedOptions[label] = newValue!;
          });
        },
        items: dropdownOptions[label]!
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    } else {
      return TextField(
        controller: textControllers[label]!,
        onChanged: (value) {
          setState(() {
            selectedOptions[label] = value;
          });
        },
        decoration: InputDecoration(
          labelText: label,
          border: const UnderlineInputBorder(),
          fillColor: const Color.fromRGBO(174, 199, 249, 0.82),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      );
    }
  }

  void _postInternship() async {
    if (widget.agentId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agent ID is missing')),
      );
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");
    String? profile = prefs.getString("profile");

    var internshipData = {
      'title': selectedOptions['Internship position'] ?? '',
      'location': selectedOptions['Internship location'] ?? '',
      'company': username,
      'salary': selectedOptions['Salary'] ?? '',
      'period': selectedOptions['Period'] ?? '',
      'contract': selectedOptions['Internship type'] ?? '',
      'requirements': selectedOptions['Requirements']?.split(',') ?? [],
      'imageUrl': profile,
      'agentId': widget.agentId,
      'description': selectedOptions['Description'] ?? '',
      'facilitiesAndBenefits': selectedOptions['Facilities & Benefits'] ?? '',
    };

    try {
      await _internshipService.addInternship(widget.authToken, internshipData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Internship added successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add internship: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 241, 241, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            'Add an Internship',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: ListView(
          children: _isExpanded.keys.map((String label) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ExpansionTile(
                title: Text(label),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(174, 199, 249, 0.82),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.expand_more),
                ),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: widgetForLabel(label),
                  ),
                ],
                onExpansionChanged: (bool isExpanded) {
                  setState(() {
                    _isExpanded[label] = isExpanded;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: SizedBox(
          width: 100,
          height: 80,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(31, 55, 170, 1)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: _postInternship,
              child: const Text('Post'),
            ),
          ),
        ),
      ),
    );
  }
}
