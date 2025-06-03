import 'package:flutter/material.dart';
import 'package:training_dz/weather_app/providers/dateformatter.dart';

class ForcastCard extends StatefulWidget {
  const ForcastCard({super.key, required this.temp, required this.detail, required this.iconId, required this.date});

  final double temp;
  final String detail;
  final String iconId;
  final DateTime date;

  @override
  State<StatefulWidget> createState() => _ForcastCard();
}

class _ForcastCard extends State<ForcastCard> {
  late double temp;
  late String detail;
  late String iconId;
  late DateTime date;

  @override
  void initState() {
    temp = widget.temp;
    detail = widget.detail;
    iconId = widget.iconId;
    date = widget.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 240,
        width: 140,
        color: const Color.fromARGB(221, 1, 46, 85),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Text(
                "${dateFormatter(weekday: date.weekday, month: date.month, day: date.day)}",
                style: TextStyle(fontSize: 18, color: const Color.fromARGB(232, 250, 253, 252)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Text(
                "${date.hour} ${(date.hour >= 12) ? 'PM' : 'AM'}",
                style: TextStyle(fontSize: 14, color: const Color.fromARGB(232, 250, 253, 252)),
              ),
            ),
            Image.network(
              'https://openweathermap.org/img/wn/$iconId@2x.png',
              scale: 1,
              colorBlendMode: BlendMode.clear,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              child: Text(detail, style: TextStyle(fontSize: 18, color: const Color.fromARGB(221, 255, 255, 255))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 4, 18, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('$temp', style: TextStyle(fontSize: 22, color: Colors.white)),
                  Text("°C", style: TextStyle(fontSize: 16, color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
