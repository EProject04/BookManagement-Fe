class User {
  String? email;
  String? password;
  String? username;
  String? roleName;
  String? createdDate;
  Null? lastModifiedDate;

  User(
      {this.email,
        this.password,
        this.username,
        this.roleName,
        this.createdDate,
        this.lastModifiedDate});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    roleName = json['roleName'];
    createdDate = json['createdDate'];
    lastModifiedDate = json['lastModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['roleName'] = this.roleName;
    data['createdDate'] = this.createdDate;
    data['lastModifiedDate'] = this.lastModifiedDate;
    return data;
  }
}