import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final Data? data;

  AuthResponseModel({
    this.message,
    this.data,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final User? user;
  final String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
      };
}

class User {
  final int? id;
  final String? name;
  final String? role;
  final String? username;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLoginAt;

  User({
    this.id,
    this.name,
    this.role,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        username: json["username"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lastLoginAt: json["last_login_at"] == null
            ? null
            : DateTime.parse(json["last_login_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "role": role,
        "username": username,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "last_login_at": lastLoginAt?.toIso8601String(),
      };
}
