class Role {
  String? roleName;
  String? description;

  Role({this.roleName, this.description});

  Role.fromJson(Map<String, dynamic> json) {
    roleName = json['roleName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleName'] = this.roleName;
    data['description'] = this.description;
    return data;
  }
}