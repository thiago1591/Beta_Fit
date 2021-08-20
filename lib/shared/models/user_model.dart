import 'dart:convert';

class UserModel {
  final id;
  final String name;
  final String firstName;
  final String? profileImage;
  final int imagesQtt;

  UserModel({this.id, required this.name, required this.firstName, this.profileImage, required this.imagesQtt});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], firstName: map['firstName'], profileImage: map['profileImage'], imagesQtt: map['imagesQtt']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "firstName": firstName,
        "profileImage": profileImage,
        "imagesQtt": imagesQtt, 
      };

  String toJson() => jsonEncode(toMap());
}

