import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategory = 'Design';
  String selectedSubCategory = 'UI/UX Design';
  String selectedLocation = 'Tripoli';
  String internshipType = 'full-time';

  @override
  Widget build(BuildContext context) {
    Color greyhex =
        const Color(0xFFF8F1F1); // Define hex color inside the build method
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap your Column with SingleChildScrollView
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xFF130160),
                Color(0xFF246BFD),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter skills or preferences',
                        hintStyle: const TextStyle(
                            color: Colors.white), // This styles the hint text
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.white), // This styles the icon
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                              color: Colors
                                  .white), // This styles the normal border
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                              color: Colors
                                  .white), // This styles the border when TextField is enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                              color: Colors
                                  .white), // This styles the border when TextField is focused
                        ),
                      ),
                      style: const TextStyle(
                          color: Colors
                              .white), // This styles the text the user enters
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 0.5),
              Container(
                decoration: BoxDecoration(
                  color: greyhex,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(41),
                    topRight: Radius.circular(41),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Filter",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text('Category'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4), // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sets the box's background color to white
                          borderRadius: BorderRadius.circular(
                              5), // Optional: if you want rounded corners
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            }
                          },
                          items: <String>['Design', 'Development', 'Marketing']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          underline: Container(), // Removes the underline
                          // Optional: Adjust dropdown and text style
                          dropdownColor: Colors
                              .white, // Sets the dropdown background color to white
                          style: const TextStyle(
                              color: Colors
                                  .black), // Sets the text color inside the dropdown
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Sub Category'),
                      SizedBox(
                        width: 410, // Set the width to 351 pixels
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical:
                                  14), // Adjust padding to match your design
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Sets the container's background color to white
                            borderRadius: BorderRadius.circular(
                                5), // Adds rounded corners to the container
                            // Optional: Add a border to simulate an input field if desired
                          ),
                          child: const Text(
                            'UI/UX Design', // Directly display the text
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16, // Adjust font size as needed
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Location'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4), // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Sets the box's background color to white
                          borderRadius: BorderRadius.circular(
                              5), // Optional: if you want rounded corners
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedLocation,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedLocation = newValue;
                              });
                            }
                          },
                          items: <String>['Tripoli', 'Beirut', 'Akkar', 'Saida']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          underline: Container(), // Removes the underline
                          dropdownColor: Colors
                              .white, // Sets the dropdown background color to white
                          style: const TextStyle(
                              color: Colors
                                  .black), // Sets the text color inside the dropdown
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Internship Type'),
                      Wrap(
                        spacing: 10.0,
                        children: <String>[
                          'Full-time',
                          'Part-time',
                          'Remote',
                          'Project-based'
                        ].map((String type) {
                          return ChoiceChip(
                            label: Text(type),
                            selected: internshipType == type.toLowerCase(),
                            onSelected: (bool selected) {
                              setState(() {
                                internshipType = type.toLowerCase();
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150, // set width to 163
                            height: 50, // set height to 50
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .all<Color>(const Color(
                                        0xFF1F37AA)), // Changed to color #1F37AA
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Set border radius to 15
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // Reset filter logic
                              },
                              child: const Text('Reset'),
                            ),
                          ),
                          SizedBox(
                            width: 150, // set width to 163
                            height: 50, // set height to 50
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .all<Color>(const Color(
                                        0xFF1F37AA)), // Changed to color #1F37AA
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Set border radius to 15
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // Apply filter logic
                              },
                              child: const Text('Filter'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Your custom color
        type: BottomNavigationBarType
            .fixed, // Use fixed when having more than three items
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 1.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 2.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 3.png',
                width: 22.83, height: 24.5),
            label: ' ',
          ),
          // Add your settings icon as necessary
        ],
      ),
    );
  }
}
