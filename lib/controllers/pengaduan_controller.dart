import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/models/category_pengaduan.dart';
import 'package:s_pengaduan/models/pengaduan.dart';
import 'package:s_pengaduan/services/pengaduan_services.dart';
import 'package:s_pengaduan/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PengaduanController extends GetxController {
  RxList<Pengaduan> listPengaduan = RxList<Pengaduan>();
  RxList<CategoryPengaduan> listCategory = RxList<CategoryPengaduan>();

  PengaduanServices api = new PengaduanServices();
  // Konstruktor untuk dikirim ke Server
  TextEditingController textTitle = new TextEditingController();
  TextEditingController textDesc = new TextEditingController();
  RxString wargaId = "".obs;
  RxString catId = "".obs;
  RxString imgPath = "".obs;
  RxString lat = "".obs;
  RxString lng = "".obs;

  RxBool isLoading = false.obs;

  save() {
    if (textTitle.text == '' ||
        textTitle.text == null ||
        textDesc.text == '' ||
        textDesc.text == null ||
        catId.value == '' ||
        catId.value == null) {
      snackbar('Peringatan', 'Harap Lengkapi Kolom', Colors.orange);
    } else {
      isLoading.value = true;
      api
          .addPengaduan(wargaId.value, catId.value, textTitle.text,
              textDesc.text, imgPath.value, lat, lng)
          .then((value) {
        if (value == 1 || value == 0) {
          isLoading.value = false;
          snackbar('Peringatan', 'Gagal Menambah Laporan', Colors.red);
        } else {
          isLoading.value = false;
          textTitle.text = '';
          textDesc.text = '';
          catId.value = '';
          this.fetchPengaduan();
          Get.back();
          snackbar('Success', 'Laporan Berhasil disimpan', primaryColor);
        }
      });
    }
  }

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then(
      (Position pos) {
        this.lat.value = pos.latitude.toString();
        this.lng.value = pos.longitude.toString();
      },
    );
  }

  pickImg() async {
    final picked = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 80);

    if (picked != null) {
      this.imgPath.value = picked.path;
    }
  }

  fetchCategory() =>
      api.fetchCategory().then((value) => this.listCategory.assignAll(value));

  fetchPengaduan() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    this.wargaId.value = _pref.getString('warga_id');

    api
        .fetchPengaduan(wargaId.value)
        .then((value) => this.listPengaduan.assignAll(value));
  }

  delPengaduan(String pengId) {
    return Get.dialog(
      AlertDialog(
        title: Text("Peringatan", style: textStyle),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          ColorButton(
            text: "Hapus",
            rounded: 20,
            color: Colors.red,
            onPress: () {
              Get.back();
              api.delPengaduan(pengId).then((value) {
                if (value == 1 || value == 0) {
                  snackbar("Error", "Proses Gagal", Colors.red);
                } else {
                  Get.back();
                  snackbar("Success", value.toString(), Colors.green);
                }
                this.fetchPengaduan();
              });
            },
          ),
          SizedBox(height: 5),
          BorderButton(
            rounded: 20,
            text: "Batal",
            color: primaryColor,
            onPress: () => Get.back(),
          )
        ],
        content: Text(
          "Anda Yakin ingin Menghapus Pengaduan ini?",
          style: textStyle,
        ),
      ),
    );
  }

  snackbar(title, msg, Color color) {
    return Get.snackbar(title, msg,
        backgroundColor: color, colorText: Colors.white);
  }
}
