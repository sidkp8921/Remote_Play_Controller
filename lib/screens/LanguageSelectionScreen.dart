import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = "English";

  final List<Map<String, String>> languages = [
    {"name": "English", "flag": "🇬🇧"},
    {"name": "Portuguese", "flag": "🇵🇹"},
    {"name": "Indonesian", "flag": "🇮🇩"},
    {"name": "Hindi", "flag": "🇮🇳"},
    {"name": "Russian", "flag": "🇷🇺"},
    {"name": "Korean", "flag": "🇰🇷"},
    {"name": "Japanese", "flag": "🇯🇵"},
    {"name": "France", "flag": "🇫🇷"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select your language",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.check_circle, color: Colors.white, size: 32),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/carousel');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: ListTile(
                      leading: Text(
                        lang["flag"]!,
                        style: TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        lang["name"]!,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      trailing: Radio<String>(
                        value: lang["name"]!,
                        groupValue: selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value!;
                          });
                        },
                        activeColor: Colors.blueAccent,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
