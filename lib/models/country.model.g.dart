// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  continents:
      (json['continents'] as List<dynamic>).map((e) => e as String).toList(),
  languages:
      (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
  population: (json['population'] as num).toInt(),
);

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'population': instance.population,
      'languages': instance.languages,
      'continents': instance.continents,
    };
