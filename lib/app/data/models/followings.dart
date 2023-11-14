// To parse this JSON data, do
//
//     final followings = followingsFromJson(jsonString);

import 'dart:convert';

import 'package:frame/app/data/models/book.dart';

List<Followings> followingsFromJson(String str) => List<Followings>.from(json.decode(str).map((x) => Followings.fromJson(x)));

String followingsToJson(List<Followings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Followings {
  late dynamic id;
  late List<Books> books;

  Followings({
    required this.id,
    required this.books,
  });

  factory Followings.fromJson(Map<String, dynamic> json) => Followings(
    id: json["id"],
    books: List<Books>.from(json["books"].map((x) => Books.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}
class BookFollow {
  late dynamic id;
  late dynamic authorId;
  late dynamic bookId;
  late dynamic authorName;

  BookFollow({
    required this.id,
    required this.authorId,
    required this.bookId,
    required this.authorName,
  });

  factory BookFollow.fromJson(Map<String, dynamic> json) => BookFollow(
    id: json["id"],
    authorId: json["authorId"],
    bookId: json["bookId"],
    authorName: json["authorName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "authorId": authorId,
    "bookId": bookId,
    "authorName": authorName,
  };
}

