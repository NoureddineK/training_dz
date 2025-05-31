import 'package:json_annotation/json_annotation.dart';

part 'weather.model.g.dart'; // fichier généré

@JsonSerializable()
class WeatherModel {
  String iconId;
  // @JsonKey(name: 'url')
  double temp;
  String description;
  // DateTime date;
  String city;

  WeatherModel({
    required this.iconId,
    required this.description,
    // required this.date,
    required this.city,
    required this.temp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  factory WeatherModel.fromMap(Map<String, dynamic> data) {
    final iconId = data['weather'][0]['icon'];
    final imageUrl = data['flags']?['png'] ?? '';
    final continents = (data['continents'] as List?) ?? [];
    final languages = (data['languages'] as Map<String, dynamic>?) ?? {};
    final population = data['population'] as int;
    return WeatherModel(
      iconId: iconId,
      imageUrl: imageUrl,
      continents: continents.cast<String>(),
      languages: languages.values.cast<String>().toList(),
      population: population,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
