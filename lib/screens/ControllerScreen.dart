import 'package:flutter/material.dart';

class ControllerScreen extends StatelessWidget {
  Widget buildButton(
    String text, {
    double size = 50,
    Color color = Colors.white,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white54, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: size * 0.28, // font scales with button
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 🔹 Button size depends on screen width
            double buttonSize = constraints.maxWidth * 0.15;
            if (buttonSize > 70) buttonSize = 70; // cap for big screens

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 🔹 Top L and R buttons
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          buildButton("L1", size: buttonSize),
                          SizedBox(height: 8),
                          buildButton("L2", size: buttonSize),
                          SizedBox(height: 8),
                          buildButton("L3", size: buttonSize),
                        ],
                      ),
                      Column(
                        children: [
                          buildButton("R1", size: buttonSize),
                          SizedBox(height: 8),
                          buildButton("R2", size: buttonSize),
                          SizedBox(height: 8),
                          buildButton("R3", size: buttonSize),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🔹 Middle area (D-Pad & Action buttons)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // D-pad
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton("▲", size: buttonSize),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton("◀", size: buttonSize),
                              SizedBox(width: 8),
                              buildButton("▶", size: buttonSize),
                            ],
                          ),
                          buildButton("▼", size: buttonSize),
                        ],
                      ),

                      // Action buttons
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton(
                            "△",
                            color: Colors.green,
                            size: buttonSize,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton(
                                "◻",
                                color: Colors.pink,
                                size: buttonSize,
                              ),
                              SizedBox(width: 8),
                              buildButton(
                                "○",
                                color: Colors.red,
                                size: buttonSize,
                              ),
                            ],
                          ),
                          buildButton(
                            "✕",
                            color: Colors.blue,
                            size: buttonSize,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🔹 Bottom controls
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Share",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Option",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
