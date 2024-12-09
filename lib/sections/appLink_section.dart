import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLinksSection extends StatefulWidget {
  const AppLinksSection({super.key});

  @override
  _AppLinksSectionState createState() => _AppLinksSectionState();
}

class _AppLinksSectionState extends State<AppLinksSection> {
  final List<Map<String, String>> imageUrls = [
    {
      'appName': 'PI Agri Portal for Planning',
      'appImage': 'assets/pi_agri.png',
      'appUrl': 'https://play.google.com/store/apps/details?id=com.conceptglobal.neoint.agri_portal&pcampaignid=web_share',
    },
    {
      'appName': 'JIVAGRO mPower',
      'appImage': 'assets/jivagro.png',
      'appUrl': 'https://play.google.com/store/apps/details?id=com.piind.JIVAgro',
    },
    {
      'appName': 'PI Mitra',
      'appImage': 'assets/pimitra.png',
      'appUrl': 'https://play.google.com/store/apps/details?id=com.piind.cicl&pcampaignid=web_share',
    },
    {
      'appName': 'Sumi Direct',
      'appImage': 'assets/sumidirect.png',
      'appUrl': 'https://play.google.com/store/apps/details?id=com.conceptglobal.sumidirect&pcampaignid=web_share',
    },
  ];

  final CarouselSliderController _controller = CarouselSliderController(); // Correctly instantiated CarouselController
  int _currentIndex = 0;

  void _moveToPreviousPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _moveToNextPage() {
    if (_currentIndex < imageUrls.length - 1) {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App Links',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(),
            const SizedBox(height: 30),
            CarouselSlider(
              items: imageUrls.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.8,
                      maxScale: 3.0,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: AssetImage(item['appImage'] ?? ''),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item['appName'] ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    final appUrl = item['appUrl'] ?? '';
                                    if (appUrl.isNotEmpty) {
                                      launchUrl(Uri.parse(appUrl));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade900,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Install',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              carouselController: _controller, // Correctly assigned CarouselController
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _moveToPreviousPage,
                  icon: const Icon(Icons.arrow_left, color: Colors.blue),
                ),
                IconButton(
                  onPressed: _moveToNextPage,
                  icon: const Icon(Icons.arrow_right, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
