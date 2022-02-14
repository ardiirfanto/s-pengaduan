import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/functions.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/pengaduan_controller.dart';
import 'package:s_pengaduan/views/pengaduan_add_page.dart';
import 'package:s_pengaduan/views/pengaduan_detail_page.dart';

class PengaduanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PengaduanController pengaduanController =
        Get.put(PengaduanController());

    pengaduanController.fetchPengaduan();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Daftar Pengaduan",
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: Get.height * 10 / 100),
        child: FloatingActionButton(
          onPressed: () => Get.to(() => PengaduanAddPage()),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: primaryColor,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(() => pengaduanController.listPengaduan.length > 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (ctx, i) => Divider(),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pengaduanController.listPengaduan.length,
                      itemBuilder: (ctx, i) {
                        var val = pengaduanController.listPengaduan[i];
                        var iconColor;
                        var icon;

                        if (val.pengaduanStatus == 'Pending') {
                          iconColor = Colors.amber;
                          icon = Icons.warning_rounded;
                        } else if (val.pengaduanStatus == 'Proses') {
                          iconColor = Colors.lightBlue;
                          icon = Icons.refresh;
                        } else {
                          iconColor = Colors.green;
                          icon = Icons.check_box;
                        }
                        return InkWell(
                          onTap: () => Get.to(() =>
                              PengaduanDetailPage(item: val, color: iconColor)),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Icon(icon, color: Colors.white),
                              backgroundColor: iconColor,
                            ),
                            title: Text(
                              val.pengaduanTitle,
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              dateformat(val.pengaduanDate),
                              style: textStyle.copyWith(
                                color: accentColor,
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: Get.height * 10 / 100,
                  )
                ],
              ),
            )
          : Center(
              child: Text(
                "Belum Ada Pengaduan",
                style: textStyle,
              ),
            )),
    );
  }
}
