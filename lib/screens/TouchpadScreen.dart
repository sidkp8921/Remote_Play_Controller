import 'package:flutter/material.dart';

class TouchpadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Touchpad')),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text('Touchpad Area', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
