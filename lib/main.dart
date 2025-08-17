import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:remote_app/screens/AddDeviceScreen.dart';
import 'package:remote_app/screens/HelpScreen.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('hi')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const RemotePSApp(),
    ),
  );
}

class RemotePSApp extends StatelessWidget {
  const RemotePSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PS Remote Controller',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF1F1F1F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
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
        '/help': (context) => HelpScreen(),
      },
    );
  }
}
