class UserModel {
  String firstName;
  String lastName;
  String age;
  String job;
  String gender;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.gender,
      required this.job});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      age: json["age"] ?? "",
      gender: json["gender"] ?? "",
      job: json["job"] ?? "",
    );
  }

  toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "age": age,
      "gender": gender,
      "job": job,
    };
  }
}
