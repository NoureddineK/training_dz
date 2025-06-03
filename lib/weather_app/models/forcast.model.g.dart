// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForcastModel _$ForcastModelFromJson(Map<String, dynamic> json) => ForcastModel(
  iconId: json['iconId'] as String,
  description: json['description'] as String,
  datetime: DateTime.parse(json['datetime'] as String),
  temp: (json['temp'] as num).toDouble(),
);

Map<String, dynamic> _$ForcastModelToJson(ForcastModel instance) =>
    <String, dynamic>{
      'iconId': instance.iconId,
      'temp': instance.temp,
      'description': instance.description,
      'datetime': instance.datetime.toIso8601String(),
    };
