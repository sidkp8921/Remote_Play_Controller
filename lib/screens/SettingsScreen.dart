import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> settingsOptions = [
    {"icon": Icons.language, "title": "Language", "route": "/language"},
    {"icon": Icons.star_rate, "title": "Rate us", "route": "/rate"},
    {"icon": Icons.feedback, "title": "Feedback", "route": "/feedback"},
    {"icon": Icons.share, "title": "Share app", "route": "/share"},
    {"icon": Icons.privacy_tip, "title": "Privacy policy", "route": "/privacy"},
    {"icon": Icons.info, "title": "Version 1.0.7", "route": null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF031432),
      appBar: AppBar(
        backgroundColor: const Color(0xFF031432),
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/howto');
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: settingsOptions.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          final option = settingsOptions[index];
          return ListTile(
            leading: Icon(option["icon"], color: Colors.white),
            title: Text(
              option["title"],
              style: const TextStyle(color: Colors.white),
            ),
            onTap: option["route"] != null
                ? () {
                    Navigator.pushNamed(context, option["route"]);
                  }
                : null,
          );
        },
      ),
    );
  }
}
