import 'dart:convert';

final jsonStrings = '''{
  "nom": "Jean",
  "age": 30,
  "email": "jean@example.com"
}''';

class UserModel {
  final String nom;
  final int age;
  final String email;

  UserModel({required this.nom, required this.age, required this.email});

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(nom: json['nom'], age: json['age'], email: json['email']);
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {'nom': nom, 'age': age, 'email': email};
  }
}

void main() {
  String jsonString = '{"nom": "Jean", "age": 30, "email": "jean@example.com"}';

  // Decode JSON en objet Dart
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  UserModel user = UserModel.fromJson(userMap);

  print(user.nom); // Jean

  // Encode objet Dart en JSON
  String encoded = jsonEncode(user.toJson());
  print(encoded);
}
