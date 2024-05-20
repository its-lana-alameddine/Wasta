import 'package:flutter/material.dart';

import '../widgets/NavigationBar.dart';

class Pricing extends StatelessWidget {
  const Pricing({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Service Selection Screen',
      home: PricingScreen(),
    );
  }
}

class PricingScreen extends StatelessWidget {
  static const Color greyHex = Color(0xFFF8F1F1);
  static const Color darkBlueHex = Color(0xFF130160);
  static const Color buttonColor = Color(0xFFA62C55);

  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [darkBlueHex, Color(0xFF246BFD)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(context),
              _buildLowerSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Our Services",
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'DM Sans'),
          ),
          SizedBox(height: 15),
          Text(
            "Pick the service that is right for you!",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'DM Sans'),
          ),
        ],
      ),
    );
  }

  Widget _buildLowerSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: greyHex,
        borderRadius: BorderRadius.vertical(top: Radius.circular(41)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildServiceCard(
                "Full Package", "\$29", "ONE TIME PAYMENT", buttonColor, true),
            const SizedBox(height: 10),
            _buildRowCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String price, String subtitle,
      Color color, bool isPopular) {
    return ServiceCard(
      height: 170,
      title: title,
      subtitle: subtitle,
      price: price,
      color: color,
      isPopular: isPopular,
      isHorizontal: true,
    );
  }

  Widget _buildRowCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildServiceCard(
                  "CV Writing", "\$5", "", const Color(0xFF2993FF), false),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: _buildServiceCard("Cover Letter Writing", "\$7", "",
                  const Color(0xFF00AD90), false),
            ),
          ],
        ),
        const SizedBox(height: 10), // Spacing between the rows
        Row(
          children: [
            Expanded(
              child: _buildServiceCard("Interview Preparation", "\$10", "",
                  const Color(0xFF028871), false),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: _buildServiceCard("Internship Guiding", "\$12", "",
                  const Color(0xFF2070C1), false),
            ),
          ],
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final Color color;
  final bool isPopular;
  final bool isHorizontal;
  final double? height;

  const ServiceCard({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.price,
    required this.color,
    this.isPopular = false,
    this.isHorizontal = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Determine button text based on the color of the card
    final buttonText = color == const Color(0xFFA62C55)
        ? "Select this plan"
        : "Select the service";

    return SizedBox(
      width: isHorizontal ? double.infinity : null,
      height: height ?? (isHorizontal ? 130 : 150),
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isPopular)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('MOST POPULAR',
                        style: TextStyle(color: Color(0xFFFFCC00))),
                    Text('SAVE 35%',
                        style: TextStyle(color: Color(0xFFFFCC00))),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(price,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
              if (subtitle.isNotEmpty)
                Text(subtitle, style: const TextStyle(color: Colors.white70)),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: color,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
