import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AlgerieScreen()));
}

class AlgerieScreen extends StatelessWidget {
  const AlgerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Blanc - fond principal
      body: Column(
        children: [
          // Bande Verte 🇩🇿
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: const Color(0xFF007A3D),
            child: const Center(child: Icon(Icons.star, size: 80, color: Colors.white)),
          ),

          // Bande Blanche + Rouge (Drapeau stylisé)
          Expanded(
            child: Container(
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 🌙 Croissant rouge
                  Positioned(child: Icon(Icons.brightness_3, size: 120, color: Color(0xFFDC241F))),

                  // ⭐ Étoile rouge au centre
                  Positioned(right: 80, child: Icon(Icons.star, size: 50, color: Color(0xFFDC241F))),

                  // 🇩🇿 Texte / slogan
                  const Positioned(
                    bottom: 40,
                    child: Text(
                      "Dzair, mon amour ❤️",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
