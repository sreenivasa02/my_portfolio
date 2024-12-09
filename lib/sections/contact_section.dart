import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     /* color: Colors.blue.shade50,*/
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact Me',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  'GitHub',
                  FontAwesomeIcons.github,
                  'https://github.com/sreenivasa02?tab=repositories',
                ).animate().scale(delay: const Duration(milliseconds: 200)),
                const SizedBox(width: 20),
                _buildSocialButton(
                  'LinkedIn',
                  FontAwesomeIcons.linkedin,
                  'https://www.linkedin.com/feed/?trk=guest_homepage-basic_google-one-tap-submit',
                ).animate().scale(delay: const Duration(milliseconds: 400)),
              ],
            ),
            const SizedBox(height: 30),
            _buildContactInfoText(
              'Email: sreenivasa02@gmail.com',
              FontAwesomeIcons.envelope,
            ),
            const SizedBox(height: 10),
            _buildContactInfoText(
              'Phone Number: 9676363798',
              FontAwesomeIcons.phone,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label, IconData icon, String url) {
    return ElevatedButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: FaIcon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }

  Widget _buildContactInfoText(String info, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, size: 20, color: Colors.blue.shade900),
        const SizedBox(width: 10),
        Text(info, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
