import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scroll_provider.dart';
import '../sections/about_section.dart';
import '../sections/appLink_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/home_section.dart';
import '../sections/skills_section.dart';
import '../widgets/header.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final List<String> sections = ['Home', 'About', 'Experience', 'App Links', 'Skills', 'Contact'];

    // Pass the ScrollController to ScrollProvider
    Provider.of<ScrollProvider>(context, listen: false).setScrollController(_scrollController);

    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: sections.map((section) {
            return ListTile(
              title: Text(section),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
                scrollProvider.scrollTo(sections.indexOf(section)); // Scroll to section
              },
            );
          }).toList(),
        ),
      ),
      body: Column(
        children: [
          const Header(), // Header widget
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: List.generate(
                  sections.length,
                      (index) => Container(
                        color:index.isEven? Colors.blue.shade50:Colors.indigo[100],

                    height: MediaQuery.of(context).size.height / 1.1, // Each section fills most of the screen height
                    child: [
                      const HomeSection(),
                      const AboutSection(),
                      MySingleVisibleContainerApp(),
                      const AppLinksSection(),
                      const SkillsSection(),
                      const ContactSection(),
                    ][index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



