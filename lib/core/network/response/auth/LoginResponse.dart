import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.meta,
    required this.data,
  });

  Meta? meta;
  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta == null ? null : meta?.toJson(),
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    required this.code,
    required this.user,
    required this.tokenType,
    required this.token,
  });

  int code;
  User? user;
  String tokenType;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"] == null ? null : json["code"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        tokenType: json["token-type"] == null ? null : json["token-type"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "user": user == null ? null : user?.toJson(),
        "token-type": tokenType == null ? null : tokenType,
        "token": token == null ? null : token,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.twoFactorConfirmedAt,
    required this.roleId,
    required this.cooperativeId,
    required this.creditCardNumber,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic twoFactorConfirmedAt;
  int roleId;
  dynamic cooperativeId;
  String creditCardNumber;
  String phoneNumber;
  String gender;
  String address;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime? createdAt;
  DateTime? updatedAt;
  String profilePhotoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        cooperativeId: json["cooperative_id"],
        creditCardNumber: json["credit_card_number"] == null
            ? null
            : json["credit_card_number"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        gender: json["gender"] == null ? null : json["gender"],
        address: json["address"] == null ? null : json["address"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"] == null
            ? null
            : json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "role_id": roleId == null ? null : roleId,
        "cooperative_id": cooperativeId,
        "credit_card_number":
            creditCardNumber == null ? null : creditCardNumber,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "gender": gender == null ? null : gender,
        "address": address == null ? null : address,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "profile_photo_url": profilePhotoUrl == null ? null : profilePhotoUrl,
      };
}

class Meta {
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  dynamic message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "message": message,
      };
}
