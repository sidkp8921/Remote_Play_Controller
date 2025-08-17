import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CarouselScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/slide1.png',
    'assets/images/slide2.png',
    'assets/images/slide3.png',
  ];

  // Captions will be localized
  final List<String> captions = [
    "play_seamlessly",
    "control_with_ease",
    "experience_freedom",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 80),
          const SizedBox(height: 20),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.85,
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.black,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 250,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    captions[index].tr(), // ✅ Localized
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            child: Text(
              tr("continue"), // ✅ Localized
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
