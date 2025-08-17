import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = "English";

  final List<Map<String, String>> languages = [
    {"name": "English", "flag": "🇬🇧", "code": "en"},
    {"name": "Portuguese", "flag": "🇵🇹", "code": "pt"},
    {"name": "Indonesian", "flag": "🇮🇩", "code": "id"},
    {"name": "Hindi", "flag": "🇮🇳", "code": "hi"},
    {"name": "Russian", "flag": "🇷🇺", "code": "ru"},
    {"name": "Korean", "flag": "🇰🇷", "code": "ko"},
    {"name": "Japanese", "flag": "🇯🇵", "code": "ja"},
    {"name": "France", "flag": "🇫🇷", "code": "fr"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF031432),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "select_language".tr(),
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

                          /// Change the app language dynamically
                          context.setLocale(Locale(lang["code"]!));
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
