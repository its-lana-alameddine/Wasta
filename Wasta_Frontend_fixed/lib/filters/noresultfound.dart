// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';


class NoResult extends StatefulWidget {
  const NoResult({super.key});

  @override
  _NoResultScreenState createState() => _NoResultScreenState();
}

class _NoResultScreenState extends State<NoResult> {


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
                        hintText: 'Design',
                        hintStyle: const TextStyle(color: Colors.white), // This styles the hint text
                        prefixIcon: const Icon(Icons.search, color: Colors.white), // This styles the icon
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.white), // This styles the normal border
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.white), // This styles the border when TextField is enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.white), // This styles the border when TextField is focused
                        ),
                      ),
                      style: const TextStyle(color: Colors.white), // This styles the text the user enters
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
                    crossAxisAlignment: CrossAxisAlignment.center, // Centers the Column contents horizontally
                    mainAxisAlignment: MainAxisAlignment.center, // Optionally center the content vertically within the Column
                    children: <Widget>[

                      Center(
                        child: Image.asset(
                          'assets/images/img.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const Text(
                        'No results found',
                        textAlign: TextAlign.center, // Centers the text content
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 10), // Adds space between the two texts
                      const Text(
                        'The search could not be found, please check spelling or write another word.',
                        textAlign: TextAlign.center, // Centers the text content
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'DM Sans',
                          fontSize: 14.0,
                        ),
                      ),


////////////////////////////////////////////////////////////////////////////////
                      const Text(
                        ''





























                            '',
                        textAlign: TextAlign.center, // Centers the text content
                      ),

                      const Text(
                        ''





























                            '',
                        textAlign: TextAlign.center, // Centers the text content
                      ),
                      const Text(
                        ''









































                            '',
                        textAlign: TextAlign.center, // Centers the text content

                      ),



                      const Text(
                        ''





















                            '',
                        textAlign: TextAlign.center, // Centers the text content

                      ),




                      const Text(
                        ''





















                            '',
                        textAlign: TextAlign.center, // Centers the text content

                      ),
////////////////////////////////////////////////////////////////////////////////



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
        type: BottomNavigationBarType.fixed, // Use fixed when having more than three items
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic.png', width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 1.png', width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 2.png', width: 22.83, height: 24.5),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Pasted Graphic 3.png', width: 22.83, height: 24.5),
            label: ' ',
          ),
          // Add your settings icon as necessary
        ],
      ),

    );
  }
}
