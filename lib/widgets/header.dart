import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/scroll_provider.dart';

/*class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sections = ['Home', 'About', 'Experience','App Links' 'Skills', 'Contact'];
    final isSmallScreen = MediaQuery.of(context).size.width< MediaQuery.of(context).size.width*0.08;

    return Container(
      color: Colors.white.withOpacity(0.9),
      child: isSmallScreen ? _buildMobileHeader(context, sections) : _buildDesktopHeader(context, sections),
    );
  }

  Widget _buildDesktopHeader(BuildContext context, List<String> sections) {
    return Consumer<ScrollProvider>(
      builder: (context, scrollProvider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Portfolio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Row(
                children: List.generate(
                  sections.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () => scrollProvider.scrollTo(index),
                      child: Text(
                        sections[index],
                        style: TextStyle(
                          color: scrollProvider.selectedIndex == index
                              ? Colors.blue
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileHeader(BuildContext context, List<String> sections) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Portfolio',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.blue),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}*/
class Header extends StatelessWidget {
  final List<String> sections;
  final ScrollController scrollController;

  const Header({
    super.key,
    required this.sections,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Portfolio title
          const Text(
            "PortFolio",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),

          // Responsive content: Drawer menu for small screens
          if (screenWidth < 600)
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            )
          else
          // Navigation buttons for larger screens
            Container(
              width: 800,
              child: Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: sections.map((section) {
                    return InkWell(
                      onTap: () {
                        final index = sections.indexOf(section);
                        final targetPosition = MediaQuery.of(context).size.height * index;

                        // Animate scroll to the selected section
                        scrollController.animateTo(
                          targetPosition,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2), // Background color with transparency
                          borderRadius: BorderRadius.circular(16.0), // Rounded corners
                          border: Border.all(color: Colors.white, width: 1.0), // Optional border
                        ),
                        child: Text(
                          section,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


/*class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sections = ['Home', 'About', 'Experience', 'App Links', 'Skills', 'Contact'];
    final isSmallScreen = MediaQuery.of(context).size.width <800  *//*MediaQuery.of(context).size.width*0.08*//*;//;

    return Container(
      color: Colors.white.withOpacity(0.9),
      child: isSmallScreen
          ? _buildMobileHeader(context, sections)
          : _buildDesktopHeader(context, sections),
    );
  }

  Widget _buildDesktopHeader(BuildContext context, List<String> sections) {
    return Consumer<ScrollProvider>(
      builder: (context, scrollProvider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Portfolio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Row(
                children: List.generate(
                  sections.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () => scrollProvider.scrollTo(index),
                      child: Text(
                        sections[index],
                        style: TextStyle(
                          color: scrollProvider.selectedIndex == index
                              ? Colors.blue
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileHeader(BuildContext context, List<String> sections) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Portfolio',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.blue),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}*/
