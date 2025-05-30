import 'package:flutter/material.dart';
import 'package:training_dz/screens/api_screen.dart';
// import 'package:training_dz/tayeb_work/screens/dashboard.screen.dart';
// import 'package:training_dz/tayeb_work/screens/login.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'street-football',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 13, 173, 160))),
      // home: const LogInPage(),
      // home: const DashboardPage(title: "dashboard", name: "tayeb"),
      home: ApiFetchScreen(),
    );
  }
}
