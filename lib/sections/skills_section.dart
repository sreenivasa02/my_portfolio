import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'Flutter', 'icon': FontAwesomeIcons.mobile},
      {'name': 'Dart', 'icon': FontAwesomeIcons.code},
      {'name': 'Firebase', 'icon': FontAwesomeIcons.database},
      {'name': 'Git', 'icon': FontAwesomeIcons.github},
      {'name': 'SVN', 'icon': FontAwesomeIcons.unity},  // SVN icon
      {'name': 'Dio', 'icon': FontAwesomeIcons.server},
    ];

    return Container(
     // color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Skills',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(),
            const SizedBox(height: 50),
            Wrap(
              spacing: 40,
              runSpacing: 40,
              children: List.generate(
                skills.length,
                (index) => _buildSkillCard(
                  skills[index]['name'] as String,
                  skills[index]['icon'] as IconData,
                ).animate().scale(delay: Duration(milliseconds: index * 200)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(String skill, IconData icon) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 10),
          Text(skill, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}