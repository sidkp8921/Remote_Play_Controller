import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:remote_app/screens/AddDeviceScreen.dart';
import 'package:remote_app/screens/HelpScreen.dart';

class DeviceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF031432),
      appBar: AppBar(
        backgroundColor: const Color(0xFF031432),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          tr('device_list'), // ✅ Localized
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/search.png', height: 150),
            const SizedBox(height: 20),
            Text(
              tr('no_consoles_found'), // ✅ Localized
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                tr('same_wifi_message'), // ✅ Localized
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blueAccent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HelpScreen()),
                );
              },
              child: Text(
                tr("cant_find_device"), // ✅ Localized
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 250,
              height: 48,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddDeviceScreen()),
                  );
                },
                child: Text(
                  tr('add_device_manually'), // ✅ Localized
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
      ),
    );
  }
}
