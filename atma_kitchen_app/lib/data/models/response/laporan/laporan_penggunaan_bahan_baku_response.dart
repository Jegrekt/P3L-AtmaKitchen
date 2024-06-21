import 'dart:convert';

class LaporanPenggunaanBahanBakuResponse {
  final String? message;
  final List<PenggunaanBahanBaku>? data;

  LaporanPenggunaanBahanBakuResponse({
    this.message,
    this.data,
  });

  factory LaporanPenggunaanBahanBakuResponse.fromJson(String str) =>
      LaporanPenggunaanBahanBakuResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LaporanPenggunaanBahanBakuResponse.fromMap(
          Map<String, dynamic> json) =>
      LaporanPenggunaanBahanBakuResponse(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PenggunaanBahanBaku>.from(
                json["data"]!.map((x) => PenggunaanBahanBaku.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class PenggunaanBahanBaku {
  final String? namaBahan;
  final String? satuan;
  final String? digunakan;

  PenggunaanBahanBaku({
    this.namaBahan,
    this.satuan,
    this.digunakan,
  });

  factory PenggunaanBahanBaku.fromJson(String str) =>
      PenggunaanBahanBaku.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PenggunaanBahanBaku.fromMap(Map<String, dynamic> json) =>
      PenggunaanBahanBaku(
        namaBahan: json["nama_bahan"],
        satuan: json["satuan"],
        digunakan: json["digunakan"],
      );

  Map<String, dynamic> toMap() => {
        "nama_bahan": namaBahan,
        "satuan": satuan,
        "digunakan": digunakan,
      };
}
