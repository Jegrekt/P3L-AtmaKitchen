import 'dart:convert';

class LaporanPemasukanPengeluaranResponse {
  final String? message;
  final List<PemasukanPengeluaran>? data;

  LaporanPemasukanPengeluaranResponse({
    this.message,
    this.data,
  });

  factory LaporanPemasukanPengeluaranResponse.fromJson(String str) =>
      LaporanPemasukanPengeluaranResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LaporanPemasukanPengeluaranResponse.fromMap(
          Map<String, dynamic> json) =>
      LaporanPemasukanPengeluaranResponse(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PemasukanPengeluaran>.from(
                json["data"]!.map((x) => PemasukanPengeluaran.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class PemasukanPengeluaran {
  final String? nama;
  final int? pemasukan;
  final int? pengeluaran;

  PemasukanPengeluaran({
    this.nama,
    this.pemasukan,
    this.pengeluaran,
  });

  factory PemasukanPengeluaran.fromJson(String str) =>
      PemasukanPengeluaran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PemasukanPengeluaran.fromMap(Map<String, dynamic> json) =>
      PemasukanPengeluaran(
        nama: json["nama"],
        pemasukan: json["pemasukan"],
        pengeluaran: json["pengeluaran"],
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "pemasukan": pemasukan,
        "pengeluaran": pengeluaran,
      };
}
