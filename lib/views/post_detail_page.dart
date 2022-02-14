import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/functions.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/models/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  PostDetailPage({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: thumbUrl + post.postThumbnail,
                    width: Get.width,
                    height: Get.height * 40 / 100,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.postTitle,
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Divider(),
                    Text(
                      "Kategori : " + post.categoryPost,
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                      ),
                    ),
                    Text(
                      "Di posting pada : " + dateformat(post.postDate),
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    Html(
                      data: post.postContent,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
