// ignore_for_file: camel_case_types, library_private_types_in_public_api, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import '../company/addinternship.dart';

class companydescriptionscreen extends StatefulWidget {
  const companydescriptionscreen({super.key});

  @override
  _companydescriptionscreen createState() => _companydescriptionscreen();
}

class _companydescriptionscreen extends State<companydescriptionscreen> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    Color greyhex = const Color(0xFFF8F1F1);
    Color grey = const Color(0xfffebebeb);
    Color bluee = const Color(0xfff3e4f88);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 437.05,
                height: 324,
                child: Image.asset(
                  'assets/images/discriptionphoto.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: greyhex,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(41),
                    topRight: Radius.circular(41),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 50, right: 50, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 73,
                            height: 74,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4F9D4D).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/project.png',
                                width: 57,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Project Manager',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'CodeNdot - Mina, Tripoli, Lebanon',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    customChip(
                                        label: 'Full Time',
                                        color: const Color(0xFF3E4F88)),
                                    const SizedBox(width: 4),
                                    customChip(
                                        label: 'Remote',
                                        color: const Color(0xFF3E4F88)),
                                    const SizedBox(width: 4),
                                    customChip(
                                        label: 'Paid',
                                        color: const Color(0xFF3E4F88)),
                                  ],
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ToggleButtons(
                            borderColor: Colors.transparent,
                            fillColor: Colors.white,
                            borderWidth: 3,
                            selectedBorderColor: Colors.transparent,
                            selectedColor: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            constraints: const BoxConstraints(
                              minHeight: 30.0,
                              minWidth: 80,
                            ),
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < isSelected.length;
                                    buttonIndex++) {
                                  isSelected[buttonIndex] =
                                      buttonIndex == index;
                                }
                              });
                            },
                            isSelected: isSelected,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Description',
                                    style: TextStyle(
                                        color: bluee,
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w900)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Company',
                                    style: TextStyle(
                                        color: bluee,
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w900)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Internship Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'Project managers play the lead role in planning, executing, monitoring, controlling, and closing out projects. They are accountable for the entire project scope, the project team and resources, the project budget, and the success or failure of the project.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Requirements',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        "• Bachelor's degree in computer science, business, or a related field\n"
                        "• 1 year of project management and related experience\n"
                        "• Project Management Professional (PMP) certification preferred\n"
                        "• Proven ability to solve problems creatively\n"
                        "• Strong familiarity with project management software tools, methodologies, and best practices\n"
                        "• Experience seeing projects through the full life cycle\n"
                        "• Excellent analytical skills",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(180, 208, 245, 1)
                                  .withOpacity(0.56),
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Button action
                            },
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 16, 125)),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(255, 171, 171, 1)
                                  .withOpacity(0.56),
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddInternshipScreen(
                                          authToken: '',
                                          agentId: '',
                                        )),
                              );
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 68, 3, 3)),
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
        type: BottomNavigationBarType.fixed,
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
        ],
      ),
    );
  }
}

Widget customChip({required String label, required Color color}) {
  return Container(
    width: 66,
    height: 21,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.5),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        fontFamily: 'DMSans',
      ),
    ),
  );
}
