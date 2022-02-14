import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/functions.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/pengaduan_controller.dart';
import 'package:s_pengaduan/models/pengaduan.dart';
import 'package:s_pengaduan/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class PengaduanDetailPage extends StatelessWidget {
  final Pengaduan item;
  final Color color;

  PengaduanDetailPage({this.item, this.color});

  @override
  Widget build(BuildContext context) {
    final PengaduanController pengaduanController = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: primaryColor),
            onPressed: () => Get.back()),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Detail Pengaduan",
              style: textStyle.copyWith(
                  fontWeight: FontWeight.bold, color: primaryColor),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
              ),
              child: Text(
                item.pengaduanStatus,
                style: textStyle.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imgPengaduanUrl + item.pengaduanImg,
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: Get.height * 30 / 100,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Bukti Laporan",
                          style: textStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                item.pengaduanTitle,
                style: textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Laporan Pada ' + dateformat(item.pengaduanDate),
                style: textStyle.copyWith(
                  color: accentColor,
                  fontSize: 14,
                ),
              ),
              Divider(),
              Text(
                item.pengaduanDesc,
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
              Divider(),
              ColorButton(
                onPress: () async => await launch(
                  "http://maps.google.com/maps?q=${item.lat},${item.lng}",
                ),
                color: primaryColor,
                icon: Icons.place,
                text: "Tracking Lokasi Kejadian",
              ),
              SizedBox(height: 10),
              item.pengaduanStatus == 'Pending'
                  ? BorderButton(
                      onPress: () => pengaduanController.delPengaduan(
                        item.pengaduanId.toString(),
                      ),
                      icon: Icons.delete,
                      color: Colors.red,
                      borderColor: Colors.red,
                      text: "Hapus Pengaduan",
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 20, bottom: 5),
                          child: Text(
                            "Riwayat Tindak Lanjut:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: item.tindakLanjut.length,
                          itemBuilder: (context, i) {
                            var dt = item.tindakLanjut[i];
                            return Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dateformat(dt.tgl),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            dt.status,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: dt.status == 'Proses'
                                                  ? Colors.orange
                                                  : Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Text(dt.ket +
                                          "hjgvhvhjbvhgj yhvghgvcddhcvjdcvdhcjdvhcdhvcdhcvdchdvchvdghvchdhjchdvcjdbcvhdvcvdcyugducgydgycgdyucfygidgcdjcbdvchbdcukjhdciubdcyudbcuij"),
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
