class Author {
  String? authorName;

  Author({this.authorName});

  Author.fromJson(Map<String, dynamic> json) {
    authorName = json['authorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorName'] = this.authorName;
    return data;
  }
}
