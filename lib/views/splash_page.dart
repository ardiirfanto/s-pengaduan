import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${imgPath}icon.png",
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitRipple(
              size: 25,
              color: primaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sistem Pengaduan Insiden",
              style: textStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
