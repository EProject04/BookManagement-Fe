import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  late dynamic id;
  late dynamic commentText;
  late dynamic rate;
  late dynamic fullName;

  Comment({
    required this.id,
    required this.commentText,
    required this.rate,
    required this.fullName,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    commentText: json["commentText"],
    rate: json["rate"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "commentText": commentText,
    "rate": rate,
    "fullName": fullName,
  };
}