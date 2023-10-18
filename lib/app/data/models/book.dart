class Book
{
  late dynamic title;
  late dynamic description;
  late dynamic content;
  late dynamic imagePath;
  late bool? status;

  Book({
    required this.title,
    required this.description,
    required this.content,
    required this.imagePath,
    required this.status,
});
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] != null?json['title']:"",
      description: json['description'] != null?json['description']:"",
      imagePath: json['imagePath'] != null?json['imagePath']:"",
      content: json['content'] != null?json['content']:"",
      status: json['status'] != null?json['status']:"",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "imagePath": imagePath,
      "content": content,
      "status": status
    };
  }

}

