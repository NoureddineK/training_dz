// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  iconId: json['icon'] as String,
  description: json['description'] as String,
  city: json['city'] as String,
  temp: (json['temp'] as num).toDouble(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'icon': instance.iconId,
      'temp': instance.temp,
      'description': instance.description,
      'city': instance.city,
    };
