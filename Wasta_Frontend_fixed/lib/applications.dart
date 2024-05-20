import 'package:flutter/material.dart';
import 'package:new_try/widgets/NavigationBar.dart';

import 'widgets/application_status_tags.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Ensure widgets are bound to the system so that we can set the preferred orientations.
//     WidgetsFlutterBinding.ensureInitialized();
//     // Set preferred orientations to portrait only.
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//     return MaterialApp(
//       title: 'Wasta',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const ApplicationsScreen(),
//     );
//   }
// }

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color greyhex =
        const Color(0xFFF8F1F1); // Define hex color inside the build metho
    return Scaffold(
      body: SingleChildScrollView(
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
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter skills or preferences',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
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
                      ListTile(
                        leading: Image.asset('assets/icons/img.png',
                            width: 30, height: 30),
                        title: const Text(
                          'Product Manager',
                          style: TextStyle(
                            fontSize:
                                20, // Set the font size to 18 for the title
                          ),
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Behance'),
                            SizedBox(
                                height:
                                    4), // Provide some spacing between the text and the tag
                            ApplicationSentTag(), // Custom widget for the application status tag
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Handle the tap event.
                        },
                      ),
                      const Divider(
                          color: Colors.grey), // Add a grey divider here
                      ListTile(
                        leading: Image.asset('assets/icons/img_1.png',
                            width: 30, height: 30),
                        title: const Text(
                          'UX Designer',
                          style: TextStyle(
                            fontSize:
                                20, // Set the font size to 18 for the title
                          ),
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Sketch'),
                            SizedBox(
                                height:
                                    4), // Spacing between the text and the tag
                            ApplicationAcceptedTag(), // Custom widget for the application accepted status
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const Divider(
                          color: Colors.grey), // Add a grey divider here
                      ListTile(
                        leading: Image.asset('assets/icons/img_2.png',
                            width: 32, height: 30),
                        title: const Text(
                          'Front-End Developer',
                          style: TextStyle(
                            fontSize:
                                20, // Set the font size to 18 for the title
                          ),
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Sketch'),
                            SizedBox(
                                height:
                                    4), // Spacing between the text and the tag
                            ApplicationRejectedTag(), // Custom widget for the application accepted status
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const Divider(
                          color: Colors.grey), // Add a grey divider here
                      ListTile(
                        leading: Image.asset('assets/icons/img_3.png',
                            width: 30, height: 30),
                        title: const Text(
                          'Software Engineer',
                          style: TextStyle(
                            fontSize:
                                20, // Set the font size to 18 for the title
                          ),
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Sketch'),
                            SizedBox(
                                height:
                                    4), // Spacing between the text and the tag
                            ApplicationSentAltTag(), // Custom widget for the application accepted status
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const Divider(
                          color: Colors.grey), // Add a grey divider here
                      ListTile(
                        leading: Image.asset('assets/icons/img_4.png',
                            width: 30, height: 30),
                        title: const Text(
                          'DevOps Engineer',
                          style: TextStyle(
                            fontSize:
                                20, // Set the font size to 18 for the title
                          ),
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Snapchat'),
                            SizedBox(
                                height:
                                    4), // Spacing between the text and the tag
                            ApplicationSentTag(), // Custom widget for the application accepted status
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
