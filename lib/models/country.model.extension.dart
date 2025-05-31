import 'package:training_dz/models/country.model.dart';

extension CountryModelExt on CountryModel {
  String get formattedLangs => languages.join(", ");
  String get formattedContin => continents.join(", ");
  Map<String, dynamic> toMap() => <String, dynamic>{
    'name': name,
    'imageUrl': imageUrl,
    'population': population,
    'languages': languages,
    'continents': continents,
  };
}
