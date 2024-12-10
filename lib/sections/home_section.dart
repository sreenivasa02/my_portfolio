import 'dart:html';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
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
  void downloadFile(String fileName) async {
    final byteData = await rootBundle.load('assets/resume.pdf');
    final List<int> bytes = byteData.buffer.asUint8List();


      // For mobile
      final result = await FileSaver.instance.saveFile(
        name: fileName,
        bytes: Uint8List.fromList(bytes),
        mimeType:MimeType.other ,
      );
      if (result != null) {
        print('File saved to: $result');
        _showSuccessDialog(context);
      }
    }
// Function to show the success dialog
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Smiley face with green tick
                Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
                const SizedBox(height: 10),
                // Success message
                const Text(
                  "Download Successful!",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your file has been saved successfully.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                const SizedBox(height: 10),
                // Close button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /*void downloadFile(String fileName) {
    final url = '$fileName';

    final anchor = AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
  }*/
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
          icon: const Icon(Icons.download,color: Colors.white,),
          label: const Text('Download Resume',style: TextStyle(fontWeight:FontWeight.w900),),
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
