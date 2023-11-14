// To parse this JSON data, do
//
//     final role = roleFromJson(jsonString);

import 'dart:convert';

List<Role> roleFromJson(String str) => List<Role>.from(json.decode(str).map((x) => Role.fromJson(x)));

String roleToJson(List<Role> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Role {
  late dynamic id;
  late dynamic roleName;
  late dynamic description;

  Role({
    required this.id,
    required this.roleName,
    required this.description,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    roleName: json["roleName"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "roleName": roleName,
    "description": description,
  };
}
