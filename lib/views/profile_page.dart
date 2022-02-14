import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/auth_controller.dart';
import 'package:s_pengaduan/widgets/button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    authController.setProfile();

    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      itemRow(
                          "Nama Pengguna", authController.name.value ?? "-"),
                      Divider(),
                      itemRow("Username", authController.username.value ?? "-"),
                      Divider(),
                      itemRow("Role", authController.role.value ?? "-"),
                      Divider(),
                      itemRow("Gender", authController.gender.value ?? "-"),
                      Divider(),
                      itemRow("Alamat", authController.address.value ?? "-"),
                      Divider(),
                      itemRow("Phone", authController.phone.value ?? "-"),
                    ],
                  ),
                ),
              ),
              Divider(),
              BorderButton(
                onPress: () => authController.logout(),
                text: "Logout",
                color: primaryColor,
                rounded: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemRow(String title, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          name,
          style: textStyle.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
