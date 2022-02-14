import 'package:get/get.dart';
import 'package:s_pengaduan/models/post.dart';
import 'package:s_pengaduan/services/post_services.dart';

class PostController extends GetxController {
  RxList<Post> listPost = RxList<Post>();

  PostServices api = new PostServices();

  fetchPost() =>
      api.fetchPosts().then((value) => this.listPost.assignAll(value));
}
