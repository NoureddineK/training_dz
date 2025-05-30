import 'package:flutter/material.dart';
import 'screens/login.screen.dart';

void main() {
  runApp(const InvestAI());
}

class InvestAI extends StatelessWidget {
  const InvestAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InvestAI',
      theme: ThemeData(fontFamily: 'montserrat', scaffoldBackgroundColor: Color(0xFF142433)),
      home: const LoginScreen(),
    );
  }
}
