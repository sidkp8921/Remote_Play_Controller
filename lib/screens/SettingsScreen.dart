import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> settingsOptions = [
    {
      "icon": Icons.language,
      "title": "settings_language",
      "route": "/language",
    },
    {"icon": Icons.star_rate, "title": "settings_rate", "route": "/rate"},
    {
      "icon": Icons.feedback,
      "title": "settings_feedback",
      "route": "/feedback",
    },
    {"icon": Icons.share, "title": "settings_share", "route": "/share"},
    {
      "icon": Icons.privacy_tip,
      "title": "settings_privacy",
      "route": "/privacy",
    },
    {"icon": Icons.info, "title": "settings_version", "route": null},
  ];

  /// ✅ FEEDBACK POPUP
  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        String selectedOption = "";

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF031432),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                "feedback_title".tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    activeColor: Colors.amber,
                    title: Text(
                      "feedback_no_ads".tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: "No Ads",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Colors.amber,
                    title: Text(
                      "feedback_dont_know".tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: "Don't Know How to Use",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Colors.amber,
                    title: Text(
                      "feedback_other".tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: "Other",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    onPressed: selectedOption.isNotEmpty
                        ? () async {
                            Navigator.pop(context);

                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'appukp555@gmail.com', // ✅ Your email
                              query: Uri.encodeFull(
                                'subject=App Feedback&body=Selected option: $selectedOption',
                              ),
                            );

                            if (await canLaunchUrl(emailLaunchUri)) {
                              await launchUrl(emailLaunchUri);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("ok".tr()),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// ✅ RATING POPUP
  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        int selectedStars = 0;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF031432),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Column(
                children: [
                  Text(
                    "settings_rate".tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Icon(
                    Icons.emoji_emotions,
                    color: Colors.amber,
                    size: 60,
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "rate_question".tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < selectedStars
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedStars = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "rate_best_star".tr(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    onPressed: selectedStars > 0
                        ? () {
                            Navigator.pop(context);
                            if (selectedStars >= 4) {
                              launchUrl(
                                Uri.parse(
                                  "https://play.google.com/store/apps/details?id=your.package.name",
                                ),
                              );
                            } else {
                              launchUrl(
                                Uri(
                                  scheme: 'mailto',
                                  path: 'appukp555@gmail.com',
                                  query: Uri.encodeFull(
                                    'subject=App Rating&body=I rated $selectedStars stars',
                                  ),
                                ),
                              );
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("ok".tr()),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// ✅ Privacy Policy
  Future<void> _openPrivacyPolicy() async {
    final Uri url = Uri.parse("https://remote_app.html");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// ✅ Share App
  void _shareApp() {
    Share.share(
      "Check out this awesome app: https://play.google.com/store/apps/details?id=your.package.name",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF031432),
      appBar: AppBar(
        backgroundColor: const Color(0xFF031432),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          "settings_title".tr(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
              option["title"].toString().tr(),
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              if (option["title"] == "settings_feedback") {
                _showFeedbackDialog(context);
              } else if (option["title"] == "settings_rate") {
                _showRatingDialog(context);
              } else if (option["title"] == "settings_privacy") {
                _openPrivacyPolicy();
              } else if (option["title"] == "settings_share") {
                _shareApp();
              } else if (option["route"] != null) {
                Navigator.pushNamed(context, option["route"]);
              }
            },
          );
        },
      ),
    );
  }
}
