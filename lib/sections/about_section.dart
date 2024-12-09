import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About Me',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(),
            const SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adds padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 0)), // Add delay for first text
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AnimatedTextKit(
                            repeatForever: false, // Plays only once
                            animatedTexts: [
                              TyperAnimatedText(
                                '* Flutter developer with around 5 years of experience in building cross-platform mobile applications.',
                                textAlign: TextAlign.start,
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                            isRepeatingAnimation: false,
                          //  pause: const Duration(milliseconds: 1000),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 5)), // Add delay for second text
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AnimatedTextKit(
                            repeatForever: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                '* Skilled in using Flutter and Dart to develop efficient, user-friendly applications for Android and iOS',
                                textAlign: TextAlign.start,
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                            isRepeatingAnimation: false,
                           // pause: const Duration(milliseconds: 1000),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 8)), // Add delay for third text
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AnimatedTextKit(
                            repeatForever: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                '* Familiar with modular code organization, state management, and testing strategies.',
                                textAlign: TextAlign.start,
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                            isRepeatingAnimation: false,
                           // pause: const Duration(milliseconds: 1000),
                          );
                          //Focused on delivering high-quality software solutions and staying updated with new technologies
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 10)), // Add delay for third text
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AnimatedTextKit(
                            repeatForever: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                '* Focused on delivering high-quality software solutions and staying updated with new technologies',
                                textAlign: TextAlign.start,
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                            isRepeatingAnimation: false,
                            // pause: const Duration(milliseconds: 1000),
                          );
                          //
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}