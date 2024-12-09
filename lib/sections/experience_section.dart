import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_animate/flutter_animate.dart';
/*class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center ensures the content is in the middle of the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Experience',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
               //MediaQuery.of(context).size.height * 0.25, // 25% of the screen height

             // Set the height for cards if required
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20,),
                  Expanded(
                    child: ExperienceCard(
                      year: 'July 2022 - Present',
                      companyName: 'iConcept Software Service Pvt Ltd ',
                      role: 'Software Engineer',
                      description: '- Contributed to the development of modular, scalable Flutter applications by organizing code into layers, following the clean architecture approach (presentation, domain, and data layers).\n- Implemented state management using GetX for task for more complex business logic.\n- Used const constructors and minimized rebuilds to improve performance, achieving smoother UI interactions.',//\n- Integrated third-party APIs, ensuring secure data transmission using HTTPS for all network requests.
                    ),
                  ),

                  SizedBox(width: 20,),
                  Expanded(
                    child: ExperienceCard(

                      year: 'April 2022 - June 2022',
                      companyName: 'Cloud Tailor (TAILORTECH PRIVATE LIMITED)',
                      role: 'Senior Flutter Developer',
                      description: '- Developed modular, scalable Flutter apps using Clean Architecture principles.\n- Managed state efficiently with Mobx and GraphQL for varying complexities.\n- Enhanced UI performance with constructors and optimized rebuilds.\n- Integrated Firebase and secure third-party APIs with HTTPS.\n- Ensured quality through unit and widget testing.',//\n- Centralized theming for a consistent, maintainable design system.
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ExperienceCard(
                      year: 'March 2020 - March 2022',
                      companyName: 'Pygmies Tech Pvt. Ltd',
                      role: 'Flutter Developer',
                      description: '- Contributed to the development of cross-platform mobile applications using Flutter and Dart, organizing code using modular architecture for better maintainability.\n- Followed the Single Responsibility Principle by breaking down complex widgets into smaller, reusable components.\n- Adopted provider for state management and separation of business logic, ensuring a clean UI.',//\n- Integrated Firebase backend services, providing real-time data updates and syncing across devices.
                    ),
                  ),
                  SizedBox(width: 20,),
                ],
              ) *//*ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 3, // Number of experience cards
                separatorBuilder: (context, index) => const SizedBox(width: 30),
                itemBuilder: (context, index) {
                  return ExperienceCard(
                    year: '2018 - Present',
                    role: 'Senior Flutter Developer',
                    description: 'Developed and maintained multiple production apps',
                  );
                },
              )*//*,
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final String year;
  final String companyName;
  final String role;
  final String description;

  const ExperienceCard({
    super.key,
    required this.year,
    required this.companyName,
    required this.role,
    required this.description,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.1 : 1.0, // Zoom in/out on hover
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.year,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue, fontWeight: FontWeight.bold,)
               *//* style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )*//*,
              ),
              const SizedBox(height: 8),
              Text(
                widget.companyName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.indigo, fontWeight: FontWeight.bold,),
               *//* style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),*//*
              ),
              const SizedBox(height: 8),
              Text(
                widget.role,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blueAccent, fontWeight: FontWeight.bold,),
               *//* style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),*//*
              ),
              const SizedBox(height: 8),
             !kIsWeb?SizedBox(): Text(
                widget.description,
                style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color:Colors.black87,fontSize: 14 ),*//*const TextStyle(color: Colors.black54)*//*
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/



class MySingleVisibleContainerApp extends StatefulWidget {
  @override
  _MySingleVisibleContainerAppState createState() =>
      _MySingleVisibleContainerAppState();
}

class _MySingleVisibleContainerAppState
    extends State<MySingleVisibleContainerApp> {
  int _visibleIndex = 1; // Initial visible container index
  List<Color> buttonColors = [Colors.black, Colors.transparent]; // Set button color to black with transparency
  List<Color> containerColors = []; // List to store container colors
  List<Map<String, dynamic>> experience = [
    {
      "year": 'July 2022 - Present',
      "companyName": 'iConcept Software Service Pvt Ltd',
      "role": 'Software Engineer',
      "description": '- Contributed to the development of modular, scalable Flutter applications by organizing code into layers, following the clean architecture approach (presentation, domain, and data layers).\n- Implemented state management using GetX for task for more complex business logic.\n- Used const constructors and minimized rebuilds to improve performance, achieving smoother UI interactions.',
    },
    {
      "year": 'April 2022 - June 2022',
      "companyName": 'Cloud Tailor (TAILORTECH PRIVATE LIMITED)',
      "role": 'Senior Flutter Developer',
      "description": '- Developed modular, scalable Flutter apps using Clean Architecture principles.\n- Managed state efficiently with Mobx and GraphQL for varying complexities.\n- Enhanced UI performance with constructors and optimized rebuilds.\n- Integrated Firebase and secure third-party APIs with HTTPS.',
    },
    {
      "year": 'March 2020 - March 2022',
      "companyName": 'Pygmies Tech Pvt. Ltd',
      "role": 'Flutter Developer',
      "description": '- Contributed to the development of cross-platform mobile applications using Flutter and Dart, organizing code using modular architecture for better maintainability.\n- Followed the Single Responsibility Principle by breaking down complex widgets into smaller, reusable components.\n- Adopted provider for state management and separation of business logic, ensuring a clean UI.',
    }
  ];

  void _toggleVisibility(int index) {
    setState(() {
      _visibleIndex = index; // Update the currently visible container
      // Assign a new black color for the container
      containerColors[_visibleIndex - 1] = Colors.black.withOpacity(0.5);
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize container colors with a default transparent color
    containerColors = List.generate(experience.length, (_) => Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(),
          const SizedBox(height: 30),
          SizedBox(height: 40.0),
          // Animated Containers
          for (int i = 1; i <= experience.length; i++)
            AnimatedAlign(
              alignment: _visibleIndex == i
                  ? Alignment.center
                  : Alignment.bottomLeft,
              duration: Duration(seconds: 1), // Animation duration
              child: Visibility(
                visible: _visibleIndex == i,
                child: Container(
                  width: 350.0,
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: containerColors[i - 1], // Set the transparent color
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: _visibleIndex == i
                        ? [BoxShadow(color: Colors.black87, blurRadius: 6.0, offset: Offset(0, 2))]
                        : [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience[i - 1]["year"],
                        style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        experience[i - 1]["companyName"],
                        style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        experience[i - 1]["role"],
                        style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        experience[i - 1]["description"],
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ],
                  ),
                ),
              ),
            ),
          kIsWeb?SizedBox(height: 40.0):SizedBox(height: 10.0),
          kIsWeb?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  onPressed: () => _toggleVisibility(index + 1),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(experience[index]["year"]),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColors[0], // Button color is set to black
                    onPrimary: Colors.white, // Text color is white
                    elevation: _visibleIndex == index + 1 ? 4 : 0, // Apply elevation only when visible
                  ),
                ),
              );
            }),
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  onPressed: () => _toggleVisibility(index + 1),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(experience[index]["year"]),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColors[0], // Button color is set to black
                    onPrimary: Colors.white, // Text color is white
                    elevation: _visibleIndex == index + 1 ? 4 : 0, // Apply elevation only when visible
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}