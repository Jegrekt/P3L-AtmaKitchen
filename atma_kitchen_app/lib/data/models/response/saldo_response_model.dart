import 'dart:convert';

class SaldoResponseModel {
  final String? message;
  final Data? data;

  SaldoResponseModel({
    this.message,
    this.data,
  });

  factory SaldoResponseModel.fromJson(String str) =>
      SaldoResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaldoResponseModel.fromMap(Map<String, dynamic> json) =>
      SaldoResponseModel(
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
  final List<SaldoModel>? data;
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
            : List<SaldoModel>.from(
                json["data"]!.map((x) => SaldoModel.fromMap(x))),
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

class SaldoModel {
  final int? id;
  final int? idCustomer;
  final DateTime? timestamp;
  final int? nominal;
  final int? saldoAkhir;
  final String? catatan;
  final int? diproses;

  SaldoModel({
    this.id,
    this.idCustomer,
    this.timestamp,
    this.nominal,
    this.saldoAkhir,
    this.catatan,
    this.diproses,
  });

  factory SaldoModel.fromJson(String str) =>
      SaldoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaldoModel.fromMap(Map<String, dynamic> json) => SaldoModel(
        id: json["id"],
        idCustomer: json["id_customer"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        nominal: json["nominal"],
        saldoAkhir: json["saldo_akhir"],
        catatan: json["catatan"],
        diproses: json["diproses"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_customer": idCustomer,
        "timestamp": timestamp?.toIso8601String(),
        "nominal": nominal,
        "saldo_akhir": saldoAkhir,
        "catatan": catatan,
        "diproses": diproses,
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
