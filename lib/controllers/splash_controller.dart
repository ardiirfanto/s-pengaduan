import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:s_pengaduan/components/navbar.dart';
import 'package:s_pengaduan/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  RxBool isLoggedIn = false.obs;
  Timer _timer;

  @override
  void onInit() {
    super.onInit();
    getAuthState();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  getAuthState() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    bool _loggedIn = _pref.getBool('logged_in');

    return _timer = Timer(Duration(seconds: 3), () {
      if (_loggedIn != null) {
        isLoggedIn.value = true;
        Get.offAll(() => NavigationPage(), transition: Transition.cupertino);
      } else {
        isLoggedIn.value = false;
        Get.offAll(() => LoginPage(), transition: Transition.cupertino);
      }
    });
  }
}
