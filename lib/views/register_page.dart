import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/auth_controller.dart';
import 'package:s_pengaduan/widgets/button.dart';
import 'package:s_pengaduan/widgets/form_container.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Kembali",
          style: textStyle.copyWith(color: primaryColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Obx(
          () => Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Daftar Akun Warga",
                    style: textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  FormContainer(
                    child: TextFormField(
                      controller: authController.userText,
                      style: textStyle,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesome5.user,
                          color: Colors.grey,
                          size: 17,
                        ),
                        hintText: "Username",
                        hintStyle: textStyle.copyWith(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FormContainer(
                    child: TextFormField(
                      controller: authController.passText,
                      obscureText: authController.isObscure.value,
                      style: textStyle,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesome5.lock,
                          color: Colors.grey,
                          size: 17,
                        ),
                        suffixIcon: GestureDetector(
                          child: authController.isObscure.value
                              ? Icon(
                                  FontAwesome5.eye_slash,
                                  color: Colors.grey,
                                  size: 17,
                                )
                              : Icon(
                                  FontAwesome5.eye,
                                  color: primaryColor,
                                  size: 17,
                                ),
                          onTap: () => authController.changeObscure(),
                        ),
                        hintText: "Password",
                        hintStyle: textStyle.copyWith(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FormContainer(
                    child: TextFormField(
                      controller: authController.nameText,
                      style: textStyle,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesome5.id_badge,
                          color: Colors.grey,
                          size: 17,
                        ),
                        hintText: "Nama",
                        hintStyle: textStyle.copyWith(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FormContainer(
                    child: TextFormField(
                      controller: authController.phoneText,
                      style: textStyle,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesome5.phone,
                          color: Colors.grey,
                          size: 17,
                        ),
                        hintText: "No.HP",
                        hintStyle: textStyle.copyWith(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FormContainer(
                    child: TextFormField(
                      controller: authController.alamatText,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: textStyle,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.place,
                          color: Colors.grey,
                        ),
                        hintText: "Alamat",
                        hintStyle: textStyle.copyWith(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesome5.transgender,
                              size: 17,
                              color: Colors.grey,
                            ),
                            Text(
                              "Jenis Kelamin :",
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Radio(
                          value: "L",
                          groupValue: authController.gender.value,
                          activeColor: primaryColor,
                          onChanged: (val) => authController.changeGender(val),
                        ),
                        Text(
                          "Laki-Laki",
                          style: textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        Radio(
                          value: "P",
                          groupValue: authController.gender.value,
                          activeColor: primaryColor,
                          onChanged: (val) => authController.changeGender(val),
                        ),
                        Text(
                          "Perempuan",
                          style: textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  authController.isLogging.value
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
                      : SizedBox(
                          width: Get.width,
                          height: 50,
                          child: ColorButton(
                            onPress: () => authController.register(),
                            color: primaryColor,
                            text: 'Register',
                            icon: Icons.login_rounded,
                          ),
                        ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: Get.width,
                    height: 50,
                    child: BorderButton(
                      onPress: () => Get.back(),
                      text: "Kembali Ke Login",
                      color: primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
