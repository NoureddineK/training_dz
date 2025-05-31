import 'package:json_annotation/json_annotation.dart';

part 'country.model.g.dart'; // fichier généré

@JsonSerializable()
class CountryModel {
  String name;

  @JsonKey(name: 'url')
  String imageUrl;
  int population;
  List<String> languages;
  List<String> continents;

  CountryModel({
    required this.name,
    required this.imageUrl,
    required this.continents,
    required this.languages,
    required this.population,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

  factory CountryModel.fromMap(Map<String, dynamic> data) {
    final name = data['name']?['common'] ?? 'inconnu';
    final imageUrl = data['flags']?['png'] ?? '';
    final continents = (data['continents'] as List?) ?? [];
    final languages = (data['languages'] as Map<String, dynamic>?) ?? {};
    final population = data['population'] as int;
    return CountryModel(
      name: name,
      imageUrl: imageUrl,
      continents: continents.cast<String>(),
      languages: languages.values.cast<String>().toList(),
      population: population,
    );
  }

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
