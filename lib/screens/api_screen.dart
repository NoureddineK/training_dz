import 'package:flutter/material.dart';

class ApiFetchScreen extends StatefulWidget {
  const ApiFetchScreen({super.key});

  @override
  State<ApiFetchScreen> createState() => _ApiFetchScreen();
}

class _ApiFetchScreen extends State<ApiFetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ElevatedButton(onPressed: () {}, child: Text("Fetch Data"))));
  }
}
