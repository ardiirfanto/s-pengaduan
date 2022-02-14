import 'dart:convert';

List<Pengaduan> listPengaduanFromJson(String str) =>
    List<Pengaduan>.from(json.decode(str).map((x) => Pengaduan.fromJson(x)));

String pengaduanToJson(List<Pengaduan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pengaduan {
  Pengaduan({
    this.pengaduanId,
    this.categoryPengaduanId,
    this.wargaId,
    this.pengaduanTitle,
    this.pengaduanDesc,
    this.pengaduanDate,
    this.pengaduanStatus,
    this.pengaduanImg,
    this.lat,
    this.lng,
    this.categoryPengaduan,
    this.tindakLanjut,
  });

  String pengaduanId;
  String categoryPengaduanId;
  String wargaId;
  String pengaduanTitle;
  String pengaduanDesc;
  DateTime pengaduanDate;
  String pengaduanStatus;
  String pengaduanImg;
  String lat;
  String lng;
  String categoryPengaduan;
  List<TindakLanjut> tindakLanjut;

  factory Pengaduan.fromJson(Map<String, dynamic> json) => Pengaduan(
        pengaduanId: json["pengaduan_id"],
        categoryPengaduanId: json["category_pengaduan_id"],
        wargaId: json["warga_id"],
        pengaduanTitle: json["pengaduan_title"],
        pengaduanDesc: json["pengaduan_desc"],
        pengaduanDate: DateTime.parse(json["pengaduan_date"]),
        pengaduanStatus: json["pengaduan_status"],
        pengaduanImg: json["pengaduan_img"],
        lat: json["lat"],
        lng: json["lng"],
        categoryPengaduan: json["category_pengaduan"],
        tindakLanjut: List<TindakLanjut>.from(
            json["tindak_lanjut"].map((x) => TindakLanjut.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pengaduan_id": pengaduanId,
        "category_pengaduan_id": categoryPengaduanId,
        "warga_id": wargaId,
        "pengaduan_title": pengaduanTitle,
        "pengaduan_desc": pengaduanDesc,
        "pengaduan_date": pengaduanDate.toIso8601String(),
        "pengaduan_status": pengaduanStatus,
        "pengaduan_img": pengaduanImg,
        "lat": lat,
        "lng": lng,
        "category_pengaduan": categoryPengaduan,
        "tindak_lanjut":
            List<dynamic>.from(tindakLanjut.map((x) => x.toJson())),
      };
}

class TindakLanjut {
  TindakLanjut({
    this.tindakLanjutId,
    this.pengaduanId,
    this.status,
    this.ket,
    this.tgl,
  });

  String tindakLanjutId;
  String pengaduanId;
  String status;
  String ket;
  DateTime tgl;

  factory TindakLanjut.fromJson(Map<String, dynamic> json) => TindakLanjut(
        tindakLanjutId: json["tindak_lanjut_id"],
        pengaduanId: json["pengaduan_id"],
        status: json["status"],
        ket: json["ket"],
        tgl: DateTime.parse(json["tgl"]),
      );

  Map<String, dynamic> toJson() => {
        "tindak_lanjut_id": tindakLanjutId,
        "pengaduan_id": pengaduanId,
        "status": status,
        "ket": ket,
        "tgl": tgl.toIso8601String(),
      };
}
