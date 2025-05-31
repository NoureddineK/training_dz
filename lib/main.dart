import 'package:flutter/material.dart';
import 'package:training_dz/tayeb_work/screens/api_screen.dart';

void main() {
  runApp(const CakeApp());
}

class CakeApp extends StatelessWidget {
  const CakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cake App',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const ApiFetchScreen(),
    );
  }
}
