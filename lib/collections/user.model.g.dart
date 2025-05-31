// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  nom: json['nom'] as String,
  age: (json['age'] as num).toInt(),
  email: json['email'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'nom': instance.nom,
  'age': instance.age,
  'email': instance.email,
};
