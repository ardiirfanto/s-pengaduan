import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/pengaduan_controller.dart';
import 'package:s_pengaduan/widgets/button.dart';

class PengaduanAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PengaduanController pengaduanController = Get.find();

    pengaduanController.getCurrentLocation();
    pengaduanController.fetchCategory();

    pengaduanController.imgPath.value = '';
    pengaduanController.textTitle.text = '';
    pengaduanController.textDesc.text = '';
    pengaduanController.isLoading.value = false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: primaryColor),
            onPressed: () => Get.back()),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Laporkan Kejadian",
          style: textStyle.copyWith(
              fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              pickImage(pengaduanController),
              TextFormField(
                controller: pengaduanController.textTitle,
                style: textStyle,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  labelText: "Masukan Judul Laporan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: pengaduanController.textDesc,
                style: textStyle,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  labelText: "Masukan Deskripsi Laporan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    items: pengaduanController.listCategory.map((cat) {
                      return DropdownMenuItem(
                        child: Text(cat.categoryPengaduan, style: textStyle),
                        value: cat.categoryPengaduanId,
                      );
                    }).toList(),
                    onChanged: (val) => pengaduanController.catId.value = val,
                    hint: Text('Pilih Kategori Insiden', style: textStyle),
                    // value: pengaduanController.catId.value,
                  ),
                ),
              ),
              SizedBox(height: 20),
              pengaduanController.isLoading.value
                  ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: SpinKitRotatingCircle(
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  : ColorButton(
                      onPress: () => pengaduanController.save(),
                      color: primaryColor,
                      height: 55,
                      text: "Kirim Laporan",
                      rounded: 20,
                    )
            ],
          ),
        ),
      ),
    );
  }

  // Get Image
  Widget pickImage(PengaduanController pengaduanController) {
    return GestureDetector(
      onTap: () => pengaduanController.pickImg(),
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(20),
          width: Get.width * 50 / 100,
          height: 200,
          child: pengaduanController.imgPath.value != ''
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: FileImage(File(pengaduanController.imgPath.value)),
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        size: 100,
                        color: primaryColor,
                      ),
                      Text(
                        "Ambil Gambar",
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.bold, color: primaryColor),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
