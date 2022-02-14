import 'package:get/get.dart';
import 'package:s_pengaduan/views/home_page.dart';
import 'package:s_pengaduan/views/pengaduan_page.dart';
import 'package:s_pengaduan/views/profile_page.dart';

class NavController extends GetxController {
  // List Page
  List page = [
    HomePage(),
    PengaduanPage(),
    ProfilePage(),
  ];

  Rx<int> selectedPage = 0.obs;

  changePage(int index) => this.selectedPage.value = index;
}
