import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:s_pengaduan/components/navbar.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/models/user.dart';
import 'package:s_pengaduan/services/auth_services.dart';
import 'package:s_pengaduan/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthServices _services = new AuthServices();
  final loginFormKey = GlobalKey<FormState>();
  RxBool isObscure = true.obs;
  RxBool isLogging = false.obs;
  RxString gender = "L".obs;
  TextEditingController userText = new TextEditingController();
  TextEditingController passText = new TextEditingController();
  TextEditingController nameText = new TextEditingController();
  TextEditingController alamatText = new TextEditingController();
  TextEditingController phoneText = new TextEditingController();

  RxString username = "".obs;
  RxString name = "".obs;
  RxString role = "".obs;
  RxString address = "".obs;
  RxString phone = "".obs;
  RxString profilgender = "".obs;

  changeGender(String val) => gender.value = val;

  changeObscure() {
    if (isObscure.value == true) {
      isObscure.value = false;
    } else {
      isObscure.value = true;
    }
  }

  login() {
    if (userText.text == '' ||
        userText.text == null ||
        passText.text == '' ||
        passText.text == null) {
      snackbar('Peringatan', 'Harap Lengkapi Kolom', Colors.orange);
    } else {
      isLogging.value = true;
      _services.login(userText.text, passText.text).then((value) {
        if (value == 1 || value == 0) {
          isLogging.value = false;
          snackbar('Peringatan', 'Data tidak ditemukan', Colors.red);
        } else {
          saveSharedUser(value);
          isLogging.value = false;
          userText.text = '';
          passText.text = '';
          redirect(value);
        }
      });
    }
  }

  register() {
    if (userText.text == '' ||
        userText.text == null ||
        passText.text == '' ||
        passText.text == null ||
        nameText.text == '' ||
        nameText.text == null ||
        alamatText.text == '' ||
        alamatText.text == null ||
        phoneText.text == '' ||
        phoneText.text == null) {
      snackbar('Peringatan', 'Harap Lengkapi Kolom', Colors.orange);
    } else {
      isLogging.value = true;
      _services
          .register(userText.text, passText.text, nameText.text, gender,
              alamatText.text, phoneText.text)
          .then((value) {
        if (value == 1 || value == 0) {
          isLogging.value = false;
          snackbar('Peringatan', 'Username Sudah digunakan', Colors.red);
        } else {
          saveSharedUser(value);
          isLogging.value = false;
          userText.text = '';
          passText.text = '';
          nameText.text = '';
          alamatText.text = '';
          phoneText.text = '';
          snackbar('Success', 'Selamat, Anda telah terdaftar', primaryColor);
          redirect(value);
        }
      });
    }
  }

  redirect(User data) {
    Get.offAll(() => NavigationPage(), transition: Transition.cupertino);
  }

  saveSharedUser(User data) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    _pref.setBool('logged_in', true);
    _pref.setString('user_id', data.userId);
    _pref.setString('username', data.username);
    _pref.setString('role', data.role);
    _pref.setString('warga_id', data.wargaId);
    _pref.setString('warga_name', data.wargaName);
    _pref.setString('warga_alamat', data.wargaAlamat);
    _pref.setString('warga_gender', data.wargaGender);
    _pref.setString('warga_phone', data.wargaPhone);
  }

  setProfile() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    this.username.value = _pref.getString('username');
    this.role.value = _pref.getString('role');
    this.name.value = _pref.getString('warga_name');
    this.address.value = _pref.getString('warga_alamat');
    this.profilgender.value = _pref.getString('warga_gender');
    this.phone.value = _pref.getString('warga_phone');
  }

  logout() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove('logged_in');
    _pref.remove('user_id');
    _pref.remove('username');
    _pref.remove('role');
    _pref.remove('warga_name');
    _pref.remove('warga_alamat');
    _pref.remove('warga_gender');
    _pref.remove('warga_phone');
    Get.offAll(() => LoginPage(), transition: Transition.cupertino);
  }

  snackbar(title, msg, Color color) {
    return Get.snackbar(title, msg,
        backgroundColor: color, colorText: Colors.white);
  }
}
