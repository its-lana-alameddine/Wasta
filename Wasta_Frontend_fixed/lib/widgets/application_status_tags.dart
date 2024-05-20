import 'package:flutter/material.dart';

class ApplicationSentTag extends StatelessWidget {
  const ApplicationSentTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Application sent',
        style: TextStyle(
          color: Color(0xFF246BFD),
          fontSize: 10,
        ),
      ),
    );
  }
}

class ApplicationAcceptedTag extends StatelessWidget {
  const ApplicationAcceptedTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(
            0xFFE9FBEF), // Set to a green color as shown in your image
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: const Text(
        'Application Accepted',
        style: TextStyle(
          color: Color(0xFF05DC6D),
          fontSize: 10,
        ),
      ),
    );
  }
}

class ApplicationRejectedTag extends StatelessWidget {
  const ApplicationRejectedTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(
            0xFFFEEAEA), // Set to a green color as shown in your image
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: const Text(
        'Application Rejected',
        style: TextStyle(
          color: Color(0xFFFF4444),
          fontSize: 10,
        ),
      ),
    );
  }
}

class ApplicationSentAltTag extends StatelessWidget {
  const ApplicationSentAltTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E3), // Corrected color value
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Application sent',
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 10,
        ),
      ),
    );
  }
}
