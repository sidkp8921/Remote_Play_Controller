import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTutorialDialog(context);
    });
  }

  //  Check internet before navigation
  Future<void> _checkConnectionAndNavigate(String route) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetDialog();
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  //  Show No Internet popup
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
                const Text(
                  "No internet, please check your\nnetwork connection!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                      Navigator.pop(context); // close dialog
                      _checkConnectionAndNavigate('/device_list'); // retry
                    },
                    child: const Text(
                      "RETRY",
                      style: TextStyle(
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

  // 🔹 Tutorial popup
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
              contentPadding: EdgeInsets.all(10),
              content: Container(
                width: double.maxFinite,
                height: 350,
                child: Column(
                  children: [
                    // --- Header with dots + close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            totalPages,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
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
                          child: Icon(Icons.close, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // --- PageView for steps
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
                            step: "Step 1",
                            image: "assets/images/step1.png",
                            title:
                                "Turn on your Play Station device and TV to start pairing",
                            subtitle:
                                "Please make sure your phone and PS are connected to the same Wi-Fi network.",
                          ),
                          _buildStep(
                            step: "Step 2",
                            image: "assets/images/step2.png",
                            title: "Open Settings on your PS",
                            subtitle:
                                "Go to Network Settings > Enable Remote Play.",
                          ),
                          _buildStep(
                            step: "Step 3",
                            image: "assets/images/step3.png",
                            title: "Connect and Start",
                            subtitle:
                                "Select your device from the list and start gaming!",
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
        Text(step, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        Image.asset(image, height: 150),
        SizedBox(height: 15),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(height: 8),
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
      backgroundColor: Color(0xFF031432),
      body: SafeArea(
        child: Stack(
          children: [
            // 🔹 Background image
            Positioned.fill(
              child: Image.asset("assets/images/bckgrd.jpg", fit: BoxFit.cover),
            ),

            // 🔹 Fade overlay
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

            // 🔹 Foreground UI
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
                        child: Icon(Icons.help_outline, color: Colors.white),
                      ),
                      Image.asset('assets/images/logo.png', height: 40),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/settings'),
                        child: Icon(Icons.settings, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Connect\nYour Device',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _modeButton(
                        context,
                        'Game Pad Mode',
                        'assets/images/gampad.jpg',
                        '/device_list',
                      ),
                      _modeButton(
                        context,
                        'Remote mode',
                        'assets/images/remote.jpg',
                        '/device_list',
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: 250,
                  height: 48,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
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
                      'Preview',
                      style: TextStyle(
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
          color: Color(0xFF06204D),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueAccent.shade100, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 50),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
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
