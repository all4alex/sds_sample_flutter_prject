class StudentData {
  String? firstName;
  String? lastName;
  String? middleName;
  String? gender;
  int? age;
  String? address;
  String? course;

  StudentData({
    this.firstName,
    this.lastName,
    this.middleName,
    this.gender,
    this.age,
    this.address,
    this.course,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        middleName: json['middle_name'] as String?,
        gender: json['gender'] as String?,
        age: json['age'] as int?,
        address: json['address'] as String?,
        course: json['course'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'middle_name': middleName,
        'gender': gender,
        'age': age,
        'address': address,
        'course': course,
      };
}
