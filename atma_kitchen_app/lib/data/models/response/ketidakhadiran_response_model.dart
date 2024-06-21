import 'dart:convert';

class KetidakhadiranResponseModel {
  final String? message;
  final Data? data;

  KetidakhadiranResponseModel({
    this.message,
    this.data,
  });

  factory KetidakhadiranResponseModel.fromJson(String str) =>
      KetidakhadiranResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KetidakhadiranResponseModel.fromMap(Map<String, dynamic> json) =>
      KetidakhadiranResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final List<Datum>? data;

  Data({
    this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final int? id;
  final int? idPegawai;
  final DateTime? tanggal;
  final Pegawai? pegawai;

  Datum({
    this.id,
    this.idPegawai,
    this.tanggal,
    this.pegawai,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idPegawai: json["id_pegawai"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        pegawai:
            json["pegawai"] == null ? null : Pegawai.fromMap(json["pegawai"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_pegawai": idPegawai,
        "tanggal": tanggal?.toIso8601String(),
        "pegawai": pegawai?.toMap(),
      };
}

class Pegawai {
  final int? idUser;
  final String? alamat;
  final int? bonus;
  final String? noTelp;
  final User? user;

  Pegawai({
    this.idUser,
    this.alamat,
    this.bonus,
    this.noTelp,
    this.user,
  });

  factory Pegawai.fromJson(String str) => Pegawai.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pegawai.fromMap(Map<String, dynamic> json) => Pegawai(
        idUser: json["id_user"],
        alamat: json["alamat"],
        bonus: json["bonus"],
        noTelp: json["no_telp"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "alamat": alamat,
        "bonus": bonus,
        "no_telp": noTelp,
        "user": user?.toMap(),
      };
}

class User {
  final int? id;
  final String? name;
  final String role;
  final String? username;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLoginAt;

  User({
    this.id,
    this.name,
    required this.role,
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
