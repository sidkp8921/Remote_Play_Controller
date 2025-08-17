import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/slide1.png',
    'assets/images/slide2.png',
    'assets/images/slide3.png',
  ];

  final List<String> captions = [
    "Play Seamlessly",
    "Control with Ease",
    "Experience Freedom",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 80),
          SizedBox(height: 20),
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
                  SizedBox(height: 10),
                  Text(
                    captions[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
