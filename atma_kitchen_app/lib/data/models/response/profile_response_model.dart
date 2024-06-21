import 'dart:convert';

class ProfileResponseModel {
  final String? message;
  final Data? data;

  ProfileResponseModel({
    this.message,
    this.data,
  });

  factory ProfileResponseModel.fromJson(String str) =>
      ProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileResponseModel.fromMap(Map<String, dynamic> json) =>
      ProfileResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final int? id;
  final String? name;
  final String? role;
  final String? username;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLoginAt;
  final Customer? customer;

  Data({
    this.id,
    this.name,
    this.role,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
    this.customer,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        customer: json["customer"] == null
            ? null
            : Customer.fromMap(json["customer"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "role": role,
        "username": username,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "last_login_at": lastLoginAt?.toIso8601String(),
        "customer": customer?.toMap(),
      };
}

class Customer {
  final int? idUser;
  final int? poin;
  final int? saldo;
  final DateTime? tanggalLahir;
  final String? noTelp;
  final List<Alamat>? alamats;

  Customer({
    this.idUser,
    this.poin,
    this.saldo,
    this.tanggalLahir,
    this.noTelp,
    this.alamats,
  });

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        idUser: json["id_user"],
        poin: json["poin"],
        saldo: json["saldo"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        noTelp: json["no_telp"],
        alamats: json["alamats"] == null
            ? []
            : List<Alamat>.from(json["alamats"]!.map((x) => Alamat.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "poin": poin,
        "saldo": saldo,
        "tanggal_lahir": tanggalLahir?.toIso8601String(),
        "no_telp": noTelp,
        "alamats": alamats == null
            ? []
            : List<dynamic>.from(alamats!.map((x) => x.toMap())),
      };
}

class Alamat {
  final int? id;
  final int? idCustomer;
  final String? alamat;
  final double? jarak;

  Alamat({
    this.id,
    this.idCustomer,
    this.alamat,
    this.jarak,
  });

  factory Alamat.fromJson(String str) => Alamat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Alamat.fromMap(Map<String, dynamic> json) => Alamat(
        id: json["id"],
        idCustomer: json["id_customer"],
        alamat: json["alamat"],
        jarak: json["jarak"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_customer": idCustomer,
        "alamat": alamat,
        "jarak": jarak,
      };
}
