import 'dart:convert';

List<Post> listPostFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.postId,
    this.categoryPostId,
    this.postTitle,
    this.postThumbnail,
    this.postContent,
    this.postDate,
    this.categoryPost,
  });

  String postId;
  String categoryPostId;
  String postTitle;
  String postThumbnail;
  String postContent;
  DateTime postDate;
  String categoryPost;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json["post_id"],
        categoryPostId: json["category_post_id"],
        postTitle: json["post_title"],
        postThumbnail: json["post_thumbnail"],
        postContent: json["post_content"],
        postDate: DateTime.parse(json["post_date"]),
        categoryPost: json["category_post"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "category_post_id": categoryPostId,
        "post_title": postTitle,
        "post_thumbnail": postThumbnail,
        "post_content": postContent,
        "post_date":
            "${postDate.year.toString().padLeft(4, '0')}-${postDate.month.toString().padLeft(2, '0')}-${postDate.day.toString().padLeft(2, '0')}",
        "category_post": categoryPost,
      };
}
