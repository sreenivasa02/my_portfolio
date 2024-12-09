/*import 'dart:html';
import 'dart:typed_data';*/

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final List<String> _roles = [
    'Flutter Developer',
    'Mobile App Developer',
    'Web Developer',
    '5 Years Experience'
  ];
  final String resumeAssetPath = 'srinivas/resume.pdf'; // Path to the PDF asset
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 800;

    return Container(
      //color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: isSmallScreen ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }
  void downloadFile(String fileName) {
    final url = '$fileName';

   /* final anchor = AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();*/
  }
 /* Future<void> downloadFile(String assetName, String fileName) async {
    try {
      // Get the directory path
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;

      // Copy the file from assets to local storage
      final file = File('$path/$fileName');
      final byteData = await rootBundle.load('assets/$assetName');
      final buffer = byteData.buffer.asUint8List();
      await file.writeAsBytes(buffer);

      print("File downloaded to: $path/$fileName");
    } catch (e) {
      print("Error downloading file: $e");
    }
  }*/
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          child: _buildLeftSection(),
        ),
        Expanded(
          child: _buildRightSection(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLeftSection(),
        const SizedBox(height: 40),
        _buildRightSection(),
      ],
    );
  }

  Widget _buildLeftSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Hi, I\'m Srinivasa Rao',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          child: AnimatedTextKit(
            animatedTexts: _roles
                .map(
                  (role) => TypewriterAnimatedText(
                role,
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blue.shade700,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            )
                .toList(),
            repeatForever: true,
            pause: const Duration(milliseconds: 1000),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () async{
            // Add resume download logic here
             downloadFile(resumeAssetPath);
          },
          icon: const Icon(Icons.download),
          label: const Text('Download Resume'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            backgroundColor: Colors.blue.shade700,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildRightSection() {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/my_image.jpg',
          height: 300,
          width: 300, // Ensure the width matches the height for a perfect circle
          fit: BoxFit.cover, // Fills the circular area
        ),
      ),
    );
  }
}
