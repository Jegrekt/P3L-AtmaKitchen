import 'dart:convert';

class KonfirmasiPesananResponseModel {
  final String? message;
  final Data? data;

  KonfirmasiPesananResponseModel({
    this.message,
    this.data,
  });

  factory KonfirmasiPesananResponseModel.fromJson(String str) =>
      KonfirmasiPesananResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KonfirmasiPesananResponseModel.fromMap(Map<String, dynamic> json) =>
      KonfirmasiPesananResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final int? currentPage;
  final List<KonfirmasiPesanan>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<KonfirmasiPesanan>.from(
                json["data"]!.map((x) => KonfirmasiPesanan.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class KonfirmasiPesanan {
  final int? id;
  final String? noNota;
  final int? idCustomer;
  final int? idAlamat;
  final DateTime? tanggalPesan;
  final dynamic tanggalLunas;
  final DateTime? tanggalSiap;
  final DateTime? tanggalAmbil;
  final int? hargaPesanan;
  final String? metodePembayaran;
  final String? buktiPembayaran;
  final int? poinDidapat;
  final int? poinDipakai;
  final int? tip;
  final int? ongkosKirim;
  final int? grandTotal;
  final String? jenisPengiriman;
  final String? statusPesanan;
  final Customer? customer;
  final Alamat? alamat;

  KonfirmasiPesanan({
    this.id,
    this.noNota,
    this.idCustomer,
    this.idAlamat,
    this.tanggalPesan,
    this.tanggalLunas,
    this.tanggalSiap,
    this.tanggalAmbil,
    this.hargaPesanan,
    this.metodePembayaran,
    this.buktiPembayaran,
    this.poinDidapat,
    this.poinDipakai,
    this.tip,
    this.ongkosKirim,
    this.grandTotal,
    this.jenisPengiriman,
    this.statusPesanan,
    this.customer,
    this.alamat,
  });

  factory KonfirmasiPesanan.fromJson(String str) =>
      KonfirmasiPesanan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KonfirmasiPesanan.fromMap(Map<String, dynamic> json) =>
      KonfirmasiPesanan(
        id: json["id"],
        noNota: json["no_nota"],
        idCustomer: json["id_customer"],
        idAlamat: json["id_alamat"],
        tanggalPesan: json["tanggal_pesan"] == null
            ? null
            : DateTime.parse(json["tanggal_pesan"]),
        tanggalLunas: json["tanggal_lunas"],
        tanggalSiap: json["tanggal_siap"] == null
            ? null
            : DateTime.parse(json["tanggal_siap"]),
        tanggalAmbil: json["tanggal_ambil"] == null
            ? null
            : DateTime.parse(json["tanggal_ambil"]),
        hargaPesanan: json["harga_pesanan"],
        metodePembayaran: json["metode_pembayaran"],
        buktiPembayaran: json["bukti_pembayaran"],
        poinDidapat: json["poin_didapat"],
        poinDipakai: json["poin_dipakai"],
        tip: json["tip"],
        ongkosKirim: json["ongkos_kirim"],
        grandTotal: json["grand_total"],
        jenisPengiriman: json["jenis_pengiriman"],
        statusPesanan: json["status_pesanan"],
        customer: json["customer"] == null
            ? null
            : Customer.fromMap(json["customer"]),
        alamat: json["alamat"] == null ? null : Alamat.fromMap(json["alamat"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "no_nota": noNota,
        "id_customer": idCustomer,
        "id_alamat": idAlamat,
        "tanggal_pesan": tanggalPesan?.toIso8601String(),
        "tanggal_lunas": tanggalLunas,
        "tanggal_siap": tanggalSiap?.toIso8601String(),
        "tanggal_ambil": tanggalAmbil?.toIso8601String(),
        "harga_pesanan": hargaPesanan,
        "metode_pembayaran": metodePembayaran,
        "bukti_pembayaran": buktiPembayaran,
        "poin_didapat": poinDidapat,
        "poin_dipakai": poinDipakai,
        "tip": tip,
        "ongkos_kirim": ongkosKirim,
        "grand_total": grandTotal,
        "jenis_pengiriman": jenisPengiriman,
        "status_pesanan": statusPesanan,
        "customer": customer?.toMap(),
        "alamat": alamat?.toMap(),
      };
}

class Alamat {
  final int? id;
  final int? idCustomer;
  final String? alamat;
  final int? jarak;

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
        jarak: json["jarak"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_customer": idCustomer,
        "alamat": alamat,
        "jarak": jarak,
      };
}

class Customer {
  final int? idUser;
  final int? poin;
  final int? saldo;
  final DateTime? tanggalLahir;
  final String? noTelp;
  final User? user;

  Customer({
    this.idUser,
    this.poin,
    this.saldo,
    this.tanggalLahir,
    this.noTelp,
    this.user,
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
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "poin": poin,
        "saldo": saldo,
        "tanggal_lahir": tanggalLahir?.toIso8601String(),
        "no_telp": noTelp,
        "user": user?.toMap(),
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

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
