import 'dart:convert';

class KaryawanResponseModel {
  final String? message;
  final Data? data;

  KaryawanResponseModel({
    this.message,
    this.data,
  });

  factory KaryawanResponseModel.fromJson(String str) =>
      KaryawanResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KaryawanResponseModel.fromMap(Map<String, dynamic> json) =>
      KaryawanResponseModel(
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
  final String? name;
  final String? role;
  final String? username;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic lastLoginAt;
  final Pegawai? pegawai;
  final RoleData? roleData;

  Datum({
    this.id,
    this.name,
    this.role,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
    this.pegawai,
    this.roleData,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
        lastLoginAt: json["last_login_at"],
        pegawai:
            json["pegawai"] == null ? null : Pegawai.fromMap(json["pegawai"]),
        roleData: json["role_data"] == null
            ? null
            : RoleData.fromMap(json["role_data"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "role": role,
        "username": username,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "last_login_at": lastLoginAt,
        "pegawai": pegawai?.toMap(),
        "role_data": roleData?.toMap(),
      };
}

class Pegawai {
  final int? idUser;
  final String? alamat;
  final String? noTelp;

  Pegawai({
    this.idUser,
    this.alamat,
    this.noTelp,
  });

  factory Pegawai.fromJson(String str) => Pegawai.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pegawai.fromMap(Map<String, dynamic> json) => Pegawai(
        idUser: json["id_user"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "alamat": alamat,
        "no_telp": noTelp,
      };
}

class RoleData {
  final String? id;
  final String? nama;

  RoleData({
    this.id,
    this.nama,
  });

  factory RoleData.fromJson(String str) => RoleData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoleData.fromMap(Map<String, dynamic> json) => RoleData(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
      };
}
