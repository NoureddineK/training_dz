import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/images/backcloud.jpg").image,
            fit: BoxFit.cover,
            opacity: 1,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud, size: 200, color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("33", style: TextStyle(fontSize: 80, color: Colors.white)),
                      Text("°C", style: TextStyle(fontSize: 50, color: Colors.white70)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("cloudy", style: TextStyle(fontSize: 50, color: Colors.white70)),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Today  ,  Wed, Feb 2", style: TextStyle(fontSize: 25, color: Colors.white70)),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // textBaseline: TextBaseline.ideographic,
                    children: [
                      Icon(Icons.location_on, size: 30, color: Colors.white70),
                      Text(" New York", style: TextStyle(fontSize: 30, color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
