import 'dart:convert';

List<CategoryPengaduan> listCategoryPengaduanFromJson(String str) =>
    List<CategoryPengaduan>.from(
        json.decode(str).map((x) => CategoryPengaduan.fromJson(x)));

String categoryPengaduanToJson(List<CategoryPengaduan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryPengaduan {
  CategoryPengaduan({
    this.categoryPengaduanId,
    this.categoryPengaduan,
  });

  String categoryPengaduanId;
  String categoryPengaduan;

  factory CategoryPengaduan.fromJson(Map<String, dynamic> json) =>
      CategoryPengaduan(
        categoryPengaduanId: json["category_pengaduan_id"],
        categoryPengaduan: json["category_pengaduan"],
      );

  Map<String, dynamic> toJson() => {
        "category_pengaduan_id": categoryPengaduanId,
        "category_pengaduan": categoryPengaduan,
      };
}
