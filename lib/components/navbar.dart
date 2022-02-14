import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/nav_controller.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(() => navController.page[navController.selectedPage.value]),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  // border:
                  //     Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor,
                      offset: Offset.zero,
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  onTap: (index) => navController.changePage(index),
                  currentIndex: navController.selectedPage.value,
                  selectedLabelStyle:
                      textStyle.copyWith(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: textStyle,
                  selectedIconTheme: IconThemeData(
                    size: 27,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Linecons.doc),
                      label: 'Berita',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Linecons.pencil),
                      label: 'Pengaduan',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Linecons.user),
                      label: 'Profil',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
