// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

import 'package:frame/app/data/models/category.dart';
import 'package:frame/app/data/models/comment.dart';
import 'package:frame/app/data/models/followings.dart';

List<Books> booksFromJson(String str) =>
    List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

String booksToJson(List<Books> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Books {
  late dynamic id;
  late dynamic title;
  late dynamic description;
  late dynamic content;
  late dynamic imagePath;
  late dynamic image;
  late dynamic status;
  late List<BookFollow> bookFollows;
  late List<CategoriesBook> categoriesBook;
  late List<Comment> comments;

  Books({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imagePath,
    required this.image,
    required this.status,
    required this.bookFollows,
    required this.categoriesBook,
    required this.comments,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        content: json["content"],
        imagePath: json["imagePath"],
        image: json["image"],
        status: json["status"],
        bookFollows: List<BookFollow>.from(
            json["bookFollows"].map((x) => BookFollow.fromJson(x))),
        categoriesBook: List<CategoriesBook>.from(
            json["categoriesBook"].map((x) => CategoriesBook.fromJson(x))),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "content": content,
        "imagePath": imagePath,
        "image": image,
        "status": status,
        "bookFollows": List<dynamic>.from(bookFollows.map((x) => x.toJson())),
        "categoriesBook":
            List<dynamic>.from(categoriesBook.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}




