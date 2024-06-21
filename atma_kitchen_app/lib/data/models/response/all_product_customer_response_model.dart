import 'dart:convert';

class AllProductCustomerResponseModel {
  final String? message;
  final Data? data;

  AllProductCustomerResponseModel({
    this.message,
    this.data,
  });

  factory AllProductCustomerResponseModel.fromJson(String str) =>
      AllProductCustomerResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllProductCustomerResponseModel.fromMap(Map<String, dynamic> json) =>
      AllProductCustomerResponseModel(
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
  final List<Datum>? data;
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
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
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

class Datum {
  final Produk? produk;
  final int? stok;
  final double? kuota;

  Datum({
    this.produk,
    this.stok,
    this.kuota,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        produk: json["produk"] == null ? null : Produk.fromMap(json["produk"]),
        stok: json["stok"],
        kuota: json["kuota"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "produk": produk?.toMap(),
        "stok": stok,
        "kuota": kuota,
      };
}

class Produk {
  final int? id;
  final int? idKategori;
  final int? idPenitip;
  final String? nama;
  final String? deskripsi;
  final String? foto;
  final int? harga;
  final int? hargaSetengahLoyang;
  final int? stokReady;
  final int? kuotaHarian;
  final KategoriProduk? kategoriProduk;

  Produk({
    this.id,
    this.idKategori,
    this.idPenitip,
    this.nama,
    this.deskripsi,
    this.foto,
    this.harga,
    this.hargaSetengahLoyang,
    this.stokReady,
    this.kuotaHarian,
    this.kategoriProduk,
  });

  factory Produk.fromJson(String str) => Produk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produk.fromMap(Map<String, dynamic> json) => Produk(
        id: json["id"],
        idKategori: json["id_kategori"],
        idPenitip: json["id_penitip"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        foto: json["foto"],
        harga: json["harga"],
        hargaSetengahLoyang: json["harga_setengah_loyang"],
        stokReady: json["stok_ready"],
        kuotaHarian: json["kuota_harian"],
        kategoriProduk: json["kategori_produk"] == null
            ? null
            : KategoriProduk.fromMap(json["kategori_produk"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_kategori": idKategori,
        "id_penitip": idPenitip,
        "nama": nama,
        "deskripsi": deskripsi,
        "foto": foto,
        "harga": harga,
        "harga_setengah_loyang": hargaSetengahLoyang,
        "stok_ready": stokReady,
        "kuota_harian": kuotaHarian,
        "kategori_produk": kategoriProduk?.toMap(),
      };
}

class KategoriProduk {
  final int? id;
  final String? nama;
  final String? satuan;

  KategoriProduk({
    this.id,
    this.nama,
    this.satuan,
  });

  factory KategoriProduk.fromJson(String str) =>
      KategoriProduk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KategoriProduk.fromMap(Map<String, dynamic> json) => KategoriProduk(
        id: json["id"],
        nama: json["nama"],
        satuan: json["satuan"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "satuan": satuan,
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
