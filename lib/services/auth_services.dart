import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/models/user.dart';

class AuthServices {
  Dio dio = new Dio();

  Future login(String username, password) async {
    try {
      FormData formData = new FormData.fromMap(
        {
          "username": username,
          "password": password,
        },
      );

      final res = await dio.post(
        apiUrl + 'login',
        data: formData,
      );

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        if (fromJson['status']['code'] != 500) {
          User data = userFromJson(toJson);
          return data;
        } else {
          return 1;
        }
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future register(
      String username, password, name, gender, alamat, phone) async {
    try {
      FormData formData = new FormData.fromMap(
        {
          "username": username,
          "password": password,
          "name": name,
          "gender": gender,
          "alamat": alamat,
          "phone": phone,
        },
      );

      final res = await dio.post(
        apiUrl + 'register',
        data: formData,
      );

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        if (toJson.length != 0) {
          User data = userFromJson(toJson);
          return data;
        } else {
          return 1;
        }
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }
}
