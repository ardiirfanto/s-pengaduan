import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/models/category_pengaduan.dart';
import 'package:s_pengaduan/models/pengaduan.dart';

class PengaduanServices {
  Dio dio = new Dio();

  Future fetchCategory() async {
    try {
      final res = await dio.get(apiUrl + 'category');

      if (res.statusCode == 200) {
        print(res.data);
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<CategoryPengaduan> data = listCategoryPengaduanFromJson(toJson);
        return data;
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future fetchPengaduan(String wargaId) async {
    try {
      FormData formData = new FormData.fromMap(
        {"warga_id": wargaId},
      );
      final res = await dio.post(apiUrl + 'pengaduan_get', data: formData);

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<Pengaduan> data = listPengaduanFromJson(toJson);
        return data;
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future delPengaduan(String pengId) async {
    try {
      FormData formData = new FormData.fromMap(
        {"id": pengId},
      );
      final res = await dio.post(apiUrl + 'pengaduan_del', data: formData);

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        return fromJson['res'];
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future addPengaduan(
      String wargaId, catId, title, desc, imgPath, lat, lng) async {
    try {
      String fileName = imgPath.split('/').last;

      FormData formData = new FormData.fromMap({
        "foto": await MultipartFile.fromFile(imgPath, filename: fileName),
        "cat_id": catId,
        "warga_id": wargaId,
        "title": title,
        "desc": desc,
        "lat": lat,
        "lng": lng,
      });

      final res = await dio.post(apiUrl + 'pengaduan_add', data: formData);

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        return fromJson['res'];
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }
}
