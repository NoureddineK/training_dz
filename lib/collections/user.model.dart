import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart'; // fichier généré

@JsonSerializable()
class UserModel {
  final String nom;
  final int age;
  final String email;

  UserModel({required this.nom, required this.age, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
