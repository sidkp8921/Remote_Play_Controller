import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _lastTriedRoute;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTutorialDialog(context);
    });
  }

  Future<void> _checkConnectionAndNavigate(String route) async {
    _lastTriedRoute = route;

    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetDialog();
      return;
    }

    bool hasInternet = await _hasInternetAccess();
    if (!hasInternet) {
      _showNoInternetDialog();
      return;
    }

    if (mounted) {
      Navigator.pushNamed(context, route);
    }
  }

  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup(
        'example.com',
      ).timeout(const Duration(seconds: 3));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFF0A1637),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/wifi.png", height: 80),
                const SizedBox(height: 20),
                Text(
                  tr("no_internet_message"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4BE1EC), Color(0xFF663DFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (_lastTriedRoute != null) {
                        _checkConnectionAndNavigate(_lastTriedRoute!);
                      }
                    },
                    child: Text(
                      tr("retry"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTutorialDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        PageController _controller = PageController();
        int totalPages = 3;
        int currentPage = 0;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.all(10),
              content: Container(
                width: double.maxFinite,
                height: 350,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            totalPages,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: index == currentPage
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        onPageChanged: (page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                        children: [
                          _buildStep(
                            step: tr("step1"),
                            image: "assets/images/step1.png",
                            title: tr("step1_title"),
                            subtitle: tr("step1_subtitle"),
                          ),
                          _buildStep(
                            step: tr("step2"),
                            image: "assets/images/step2.png",
                            title: tr("step2_title"),
                            subtitle: tr("step2_subtitle"),
                          ),
                          _buildStep(
                            step: tr("step3"),
                            image: "assets/images/step3.png",
                            title: tr("step3_title"),
                            subtitle: tr("step3_subtitle"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStep({
    required String step,
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Text(
          step,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Image.asset(image, height: 150),
        const SizedBox(height: 15),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF031432),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset("assets/images/bckgrd.jpg", fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                      Colors.black.withOpacity(0.85),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/howto'),
                        child: const Icon(
                          Icons.help_outline,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('assets/images/logo.png', height: 40),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/settings'),
                        child: const Icon(Icons.settings, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  tr("connect_your_device"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _modeButton(
                        context,
                        tr("game_pad_mode"),
                        'assets/images/gampad.jpg',
                        '/device_list',
                      ),
                      _modeButton(
                        context,
                        tr("remote_mode"),
                        'assets/images/remote.jpg',
                        '/device_list',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 250,
                  height: 48,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4BE1EC), Color(0xFF663DFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/controller'),
                    child: Text(
                      tr("preview"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _modeButton(
    BuildContext context,
    String label,
    String imagePath,
    String route,
  ) {
    return GestureDetector(
      onTap: () => _checkConnectionAndNavigate(route),
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFF06204D),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueAccent.shade100, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 50),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
