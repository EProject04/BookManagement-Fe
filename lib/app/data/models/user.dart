// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  late dynamic id;
  late dynamic email;
  late dynamic password;
  late dynamic username;
  late dynamic roleName;
  late dynamic createdDate;
  late dynamic lastModifiedDate;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.roleName,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    username: json["username"],
    roleName: json["roleName"],
    createdDate: json["createdDate"],
    lastModifiedDate: json["lastModifiedDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "username": username,
    "roleName": roleName,
    "createdDate": createdDate,
    "lastModifiedDate": lastModifiedDate,
  };
}
