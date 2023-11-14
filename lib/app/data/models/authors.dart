// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

List<Author> authorFromJson(String str) => List<Author>.from(json.decode(str).map((x) => Author.fromJson(x)));

String authorToJson(List<Author> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Author {
  late dynamic id;
  late dynamic authorName;

  Author({
    required this.id,
    required this.authorName,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    authorName: json["authorName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "authorName": authorName,
  };
}
