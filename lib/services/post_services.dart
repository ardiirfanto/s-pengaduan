import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/models/post.dart';

class PostServices {
  Dio dio = new Dio();

  Future fetchPosts() async {
    try {
      final res = await dio.get(apiUrl + 'post');

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<Post> data = listPostFromJson(toJson);
        return data;
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }
}
