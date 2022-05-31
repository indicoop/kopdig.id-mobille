import 'dart:convert';

EditProfileRequest EditProfileFromJson(String str) => EditProfileRequest.fromJson(json.decode(str));

String EditProfileToJson(EditProfileRequest data) => json.encode(data.toJson());

class EditProfileRequest {
  EditProfileRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.gender,
  });

  String name;
  String email;
  String password;
  String phoneNumber;
  String gender;

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) => EditProfileRequest(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone_number": phoneNumber,
    "gender": gender,
  };
}
