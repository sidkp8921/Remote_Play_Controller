import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:remote_app/screens/AddDeviceScreen.dart';
import 'package:remote_app/screens/HowToUseScreen.dart';
import 'package:remote_app/screens/SplashScreen.dart';
import 'package:remote_app/screens/TutorialScreen.dart';
import 'screens/AboutScreen.dart';
import 'screens/CarouselScreen.dart'
    hide AboutScreen, TouchpadScreen, ControllerScreen;
import 'screens/DeviceListScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/ControllerScreen.dart';
import 'screens/LanguageSelectionScreen.dart';
import 'screens/TouchpadScreen.dart';
import 'screens/SettingsScreen.dart';
import 'screens/WelcomeScreen.dart';

void main() => runApp(RemotePSApp());

class RemotePSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PS Remote Controller',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF1F1F1F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/language': (context) => LanguageSelectionScreen(),
        '/carousel': (context) => CarouselScreen(),
        '/home': (context) => HomeScreen(),
        '/controller': (context) => ControllerScreen(),
        '/touchpad': (context) => TouchpadScreen(),
        '/settings': (context) => SettingsScreen(),
        '/about': (context) => AboutScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/howto': (context) => HowToUseScreen(),
        '/tutorial': (context) => TutorialScreen(),
        '/device_list': (context) => DeviceListScreen(),
        '/add_device': (context) => AddDeviceScreen(),
      },
    );
  }
}
