// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

List<UserProfile> userProfileFromJson(String str) => List<UserProfile>.from(json.decode(str).map((x) => UserProfile.fromJson(x)));

String userProfileToJson(List<UserProfile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProfile {
  late dynamic id;
  late dynamic fistName;
  late dynamic lastName;
  late dynamic fullName;
  late dynamic address;
  late dynamic phoneNumber;
  late dynamic email;
  late dynamic gender;
  late dynamic imagePath;
  late dynamic image;
  late dynamic authorId;
  late dynamic roleName;
  late dynamic dateOfBirth;

  UserProfile({
    required this.id,
    required this.fistName,
    required this.lastName,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.gender,
    required this.imagePath,
    required this.image,
    required this.authorId,
    required this.roleName,
    required this.dateOfBirth,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    fistName: json["fistName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    gender: json["gender"],
    imagePath: json["imagePath"],
    image: json["image"],
    authorId: json["authorId"],
    roleName: json["roleName"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fistName": fistName,
    "lastName": lastName,
    "fullName": fullName,
    "address": address,
    "phoneNumber": phoneNumber,
    "email": email,
    "gender": gender,
    "imagePath": imagePath,
    "image": image,
    "authorId": authorId,
    "roleName": roleName,
    "dateOfBirth": dateOfBirth.toIso8601String(),
  };
}
