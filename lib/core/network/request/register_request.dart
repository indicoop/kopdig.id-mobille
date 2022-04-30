import 'dart:convert';

RegisterRequest registerFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.roleId,
    required this.creditCardNumber,
    required this.phoneNumber,
    required this.gender,
    required this.address,
  });

  String name;
  String email;
  String password;
  String roleId;
  String creditCardNumber;
  String phoneNumber;
  String gender;
  String address;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    roleId: json["role_id"],
    creditCardNumber: json["credit_card_number"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "role_id": roleId,
    "credit_card_number": creditCardNumber,
    "phone_number": phoneNumber,
    "gender": gender,
    "address": address,
  };
}
