import 'dart:convert';

class UserModel {
  final id;
  final String name;
  final String firstName;
  final String? photoURL;
  final int imagesQtt;

  UserModel({this.id, required this.name, required this.firstName, this.photoURL, required this.imagesQtt});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], firstName: map['firstName'], photoURL: map['photoURL'], imagesQtt: map['imagesQtt']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "firstName": firstName,
        "photoURL": photoURL,
        "imagesQtt": imagesQtt, 
      };

  String toJson() => jsonEncode(toMap());
}

