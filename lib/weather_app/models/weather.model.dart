import 'package:json_annotation/json_annotation.dart';

part 'weather.model.g.dart'; // fichier généré

@JsonSerializable()
class WeatherModel {
  String iconId;
  // @JsonKey(name: 'url')
  double temp;
  String description;
  DateTime date;
  String city;

  WeatherModel({
    required this.iconId,
    required this.description,
    required this.date,
    required this.city,
    required this.temp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  factory WeatherModel.fromMap(Map<String, dynamic> data) {
    final iconId = data['weather'][0]['icon'];
    // final imageUrl = data['flags']?['png'] ?? '';
    final temp = data['main']['temp'];
    final description = data['weather'][0]['description'];
    final city = data['name'] + '  -  ${data['sys']['country']}';
    final date = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
    return WeatherModel(iconId: iconId, temp: temp, description: description, city: city, date: date);
  }

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
