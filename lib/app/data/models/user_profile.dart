class UserProfile {
  String? fistName;
  String? lastName;
  Null? fullName;
  String? address;
  Null? phoneNumber;
  Null? gender;
  Null? imagePath;
  Null? authorId;
  Null? dateOfBirth;

  UserProfile(
      {this.fistName,
        this.lastName,
        this.fullName,
        this.address,
        this.phoneNumber,
        this.gender,
        this.imagePath,
        this.authorId,
        this.dateOfBirth});

  UserProfile.fromJson(Map<String, dynamic> json) {
    fistName = json['fistName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    imagePath = json['imagePath'];
    authorId = json['authorId'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fistName'] = this.fistName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['imagePath'] = this.imagePath;
    data['authorId'] = this.authorId;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}