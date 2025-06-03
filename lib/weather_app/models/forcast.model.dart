import 'package:json_annotation/json_annotation.dart';

part 'forcast.model.g.dart';

@JsonSerializable()
class ForcastModel {
  String iconId;
  // @JsonKey(name: 'url')
  double temp;
  String description;
  DateTime datetime;

  ForcastModel({required this.iconId, required this.description, required this.datetime, required this.temp});
  factory ForcastModel.fromJson(Map<String, dynamic> json) => _$ForcastModelFromJson(json);

  factory ForcastModel.fromMap(Map<String, dynamic> data) {
    final iconId = data['weather'][0]?['icon'] ?? 'N/A';
    // final imageUrl = data['flags']?['png'] ?? '';
    final temp = data['main']?['temp'] ?? 'N/A';
    final description = data['weather'][0]?['description'] ?? 'N/A';
    final datetime = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
    return ForcastModel(iconId: iconId, temp: temp, description: description, datetime: datetime);
  }

  Map<String, dynamic> toJson() => _$ForcastModelToJson(this);
}
