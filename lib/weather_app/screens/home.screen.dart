import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rowbuilder/rowbuilder.dart';
import 'package:training_dz/weather_app/models/forcast.model.dart';
import 'package:training_dz/weather_app/models/weather.model.dart';
import 'package:training_dz/weather_app/providers/dateformatter.dart';
import 'package:training_dz/weather_app/widgets/forcastcard.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? cityWeather;
  List<dynamic> forcastData = [];

  @override
  void initState() {
    super.initState();
    fetchWeather();
    fetchForcast();
  }

  Future<void> fetchWeather() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=36.57&lon=2.9&units=metric&lang=ar&appid=3e91b23035bb7138a9b108ec503d928f',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        cityWeather = WeatherModel.fromMap(data);
      });
    } else {
      throw Exception('Loading weather data error!');
    }
  }

  Future<void> fetchForcast() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=36.57&lon=2.9&units=metric&lang=ar&appid=3e91b23035bb7138a9b108ec503d928f',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        List dataList = data['list'];
        for (int i = 0; i < dataList.length; i++) {
          forcastData.add(ForcastModel.fromMap(dataList[i]));
        }
      });
    } else {
      throw Exception('Loading forcast data error!');
    }
  }

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
          child: Container(
            height: double.infinity,
            color: const Color.fromARGB(221, 0, 18, 34),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://openweathermap.org/img/wn/${cityWeather!.iconId}@2x.png',
                    scale: 0.4,
                    colorBlendMode: BlendMode.clear,
                    fit: BoxFit.cover,
                  ),
                  // Icon(Icons.cloud, size: 200, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${cityWeather!.temp}', style: TextStyle(fontSize: 80, color: Colors.white)),
                        Text("°C", style: TextStyle(fontSize: 50, color: Colors.white70)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(cityWeather!.description, style: TextStyle(fontSize: 44, color: Colors.white70)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      // "Today  -  ${weekDay[cityWeather!.date.weekday - 1]}, ${months[cityWeather!.date.month - 1]} ${cityWeather!.date.day}",
                      "Today  -  ${dateFormatter(weekday: cityWeather!.date.weekday, month: cityWeather!.date.month, day: cityWeather!.date.day)}",
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 12,
                      // textBaseline: TextBaseline.ideographic,
                      children: [
                        Icon(Icons.location_on, size: 28, color: Colors.white70),
                        Text(cityWeather!.city, style: TextStyle(fontSize: 30, color: Colors.white70)),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Forcast',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 34, color: Colors.white),
                      ),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: RowBuilder(
                        itemBuilder: (context, index) {
                          final forcast = forcastData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ForcastCard(
                              temp: forcast.temp,
                              detail: forcast.description,
                              iconId: forcast.iconId,
                              date: forcast.datetime,
                            ),
                          );
                        },
                        itemCount: forcastData.length,
                        reversed: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
