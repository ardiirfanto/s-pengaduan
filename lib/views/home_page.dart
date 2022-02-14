import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/functions.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/post_controller.dart';
import 'package:s_pengaduan/views/post_detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    postController.fetchPost();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              imgPath + "icon.png",
              width: 25,
              height: 25,
            ),
            // SizedBox(width: 5),
            Text(
              "SiPengadu",
              style: textStyle.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => postController.listPost.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: postController.listPost.length,
                itemBuilder: (ctx, i) {
                  var val = postController.listPost[i];
                  return InkWell(
                    onTap: () => Get.to(() => PostDetailPage(post: val)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: thumbUrl + val.postThumbnail,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  val.postTitle,
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Kategori : " + val.categoryPost,
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Di posting pada : " +
                                      dateformat(val.postDate),
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: SpinKitRipple(color: primaryColor),
              ),
      ),
    );
  }
}
