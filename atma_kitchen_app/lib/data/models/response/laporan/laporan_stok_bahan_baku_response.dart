import 'dart:convert';

class LaporanStokBahanBakuResponse {
  final String? message;
  final List<StokBahanBaku>? data;

  LaporanStokBahanBakuResponse({
    this.message,
    this.data,
  });

  factory LaporanStokBahanBakuResponse.fromJson(String str) =>
      LaporanStokBahanBakuResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LaporanStokBahanBakuResponse.fromMap(Map<String, dynamic> json) =>
      LaporanStokBahanBakuResponse(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StokBahanBaku>.from(
                json["data"]!.map((x) => StokBahanBaku.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class StokBahanBaku {
  final int? id;
  final String? nama;
  final String? satuan;
  final int? stok;

  StokBahanBaku({
    this.id,
    this.nama,
    this.satuan,
    this.stok,
  });

  factory StokBahanBaku.fromJson(String str) =>
      StokBahanBaku.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StokBahanBaku.fromMap(Map<String, dynamic> json) => StokBahanBaku(
        id: json["id"],
        nama: json["nama"],
        satuan: json["satuan"],
        stok: json["stok"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "satuan": satuan,
        "stok": stok,
      };
}
