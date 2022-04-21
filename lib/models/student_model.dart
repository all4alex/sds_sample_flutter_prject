class StudentResponse {
  int? id;
  String? firstname;
  String? lastname;
  String? middlename;
  String? gender;
  int? age;
  String? address;
  String? course;
  bool? isActive;
  String? createdDate;
  String? modifiedDate;

  StudentResponse(
      {this.id,
      this.firstname,
      this.lastname,
      this.middlename,
      this.gender,
      this.age,
      this.address,
      this.course,
      this.isActive,
      this.createdDate,
      this.modifiedDate});

  StudentResponse.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    middlename = json['Middlename'];
    gender = json['Gender'];
    age = json['Age'];
    address = json['Address'];
    course = json['Course'];
    isActive = json['IsActive'];
    createdDate = json['CreatedDate'];
    modifiedDate = json['ModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Firstname'] = this.firstname;
    data['Lastname'] = this.lastname;
    data['Middlename'] = this.middlename;
    data['Gender'] = this.gender;
    data['Age'] = this.age;
    data['Address'] = this.address;
    data['Course'] = this.course;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedDate'] = this.modifiedDate;
    return data;
  }
}
