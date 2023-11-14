// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  late dynamic id;
  late dynamic categoryName;
  late dynamic description;
  late dynamic imagePath;
  late dynamic image;

  Categories({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.imagePath,
    required this.image,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"],
    categoryName: json["categoryName"],
    description: json["description"],
    imagePath: json["imagePath"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
    "description": description,
    "imagePath": imagePath,
    "image": image,
  };
}
class CategoriesBook {
  late dynamic categoryId;
  late dynamic bookId;
  late dynamic categoryName;

  CategoriesBook({
    required this.categoryId,
    required this.bookId,
    required this.categoryName,
  });

  factory CategoriesBook.fromJson(Map<String, dynamic> json) => CategoriesBook(
    categoryId: json["categoryId"],
    bookId: json["bookId"],
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "bookId": bookId,
    "categoryName": categoryName,
  };
}