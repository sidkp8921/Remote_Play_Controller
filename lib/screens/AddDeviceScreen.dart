import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AddDeviceScreen extends StatefulWidget {
  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  String? _selectedFirmware; // Track selected firmware

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
          tr('select_device_firmware'), // ✅ Localized
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Firmware buttons (localized)
          _firmwareButton(context, tr("ps3")),
          _firmwareButton(context, tr("ps4_8")),
          _firmwareButton(context, tr("ps4_7_8")),
          _firmwareButton(context, tr("ps4_below_7")),

          const Spacer(),

          // Stylish Bottom Button
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Opacity(
              opacity: _selectedFirmware == null ? 0.5 : 1.0, // Disabled look
              child: Container(
                width: 220,
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4BE1EC), Color(0xFF663DFF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: _selectedFirmware == null
                      ? null
                      : () {
                          // Navigate to controller screen
                          Navigator.pushNamed(context, "/controller");
                        },
                  child: Text(
                    tr("add_device"), // ✅ Localized
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _firmwareButton(BuildContext context, String text) {
    final bool isSelected = _selectedFirmware == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFirmware = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.lightBlueAccent : Colors.blueAccent,
            width: isSelected ? 2.5 : 1.5,
          ),
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
