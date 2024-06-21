import 'dart:convert';

class HistoryPenjualanModel {
  final String? message;
  final Data? data;

  HistoryPenjualanModel({
    this.message,
    this.data,
  });

  factory HistoryPenjualanModel.fromJson(String str) =>
      HistoryPenjualanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryPenjualanModel.fromMap(Map<String, dynamic> json) =>
      HistoryPenjualanModel(
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
  final String? nextPageUrl;
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
  final int? id;
  final String? noNota;
  final int? idCustomer;
  final int? idAlamat;
  final DateTime? tanggalPesan;
  final DateTime? tanggalLunas;
  final DateTime? tanggalSiap;
  final dynamic tanggalAmbil;
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
  final List<DetailPenjualan>? detailPenjualans;
  final Alamat? alamat;

  Datum({
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
    this.detailPenjualans,
    this.alamat,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        noNota: json["no_nota"],
        idCustomer: json["id_customer"],
        idAlamat: json["id_alamat"],
        tanggalPesan: json["tanggal_pesan"] == null
            ? null
            : DateTime.parse(json["tanggal_pesan"]),
        tanggalLunas: json["tanggal_lunas"] == null
            ? null
            : DateTime.parse(json["tanggal_lunas"]),
        tanggalSiap: json["tanggal_siap"] == null
            ? null
            : DateTime.parse(json["tanggal_siap"]),
        tanggalAmbil: json["tanggal_ambil"],
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
        detailPenjualans: json["detail_penjualans"] == null
            ? []
            : List<DetailPenjualan>.from(json["detail_penjualans"]!
                .map((x) => DetailPenjualan.fromMap(x))),
        alamat: json["alamat"] == null ? null : Alamat.fromMap(json["alamat"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "no_nota": noNota,
        "id_customer": idCustomer,
        "id_alamat": idAlamat,
        "tanggal_pesan": tanggalPesan?.toIso8601String(),
        "tanggal_lunas": tanggalLunas?.toIso8601String(),
        "tanggal_siap": tanggalSiap?.toIso8601String(),
        "tanggal_ambil": tanggalAmbil,
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
        "detail_penjualans": detailPenjualans == null
            ? []
            : List<dynamic>.from(detailPenjualans!.map((x) => x.toMap())),
        "alamat": alamat?.toMap(),
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

class DetailPenjualan {
  final int? id;
  final int? idProduk;
  final int? idTrxPenjualan;
  final double? qty;
  final int? subtotal;
  final dynamic catatan;
  final Produk? produk;

  DetailPenjualan({
    this.id,
    this.idProduk,
    this.idTrxPenjualan,
    this.qty,
    this.subtotal,
    this.catatan,
    this.produk,
  });

  factory DetailPenjualan.fromJson(String str) =>
      DetailPenjualan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailPenjualan.fromMap(Map<String, dynamic> json) => DetailPenjualan(
        id: json["id"],
        idProduk: json["id_produk"],
        idTrxPenjualan: json["id_trx_penjualan"],
        qty: json["qty"]?.toDouble(),
        subtotal: json["subtotal"],
        catatan: json["catatan"],
        produk: json["produk"] == null ? null : Produk.fromMap(json["produk"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_produk": idProduk,
        "id_trx_penjualan": idTrxPenjualan,
        "qty": qty,
        "subtotal": subtotal,
        "catatan": catatan,
        "produk": produk?.toMap(),
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
