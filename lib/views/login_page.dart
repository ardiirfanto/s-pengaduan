import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/string.dart';
import 'package:s_pengaduan/constants/theme.dart';
import 'package:s_pengaduan/controllers/auth_controller.dart';
import 'package:s_pengaduan/views/register_page.dart';
import 'package:s_pengaduan/widgets/button.dart';
import 'package:s_pengaduan/widgets/form_container.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController _loginController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Obx(
          () => Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "${imgPath}icon.png",
                  height: 150,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  "SISTEM INFORMASI PENGADUAN INSIDEN",
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 20),
                FormContainer(
                  child: TextFormField(
                    controller: _loginController.userText,
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
                    controller: _loginController.passText,
                    obscureText: _loginController.isObscure.value,
                    style: textStyle,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesome5.lock,
                        color: Colors.grey,
                        size: 17,
                      ),
                      suffixIcon: GestureDetector(
                        child: _loginController.isObscure.value
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
                        onTap: () => _loginController.changeObscure(),
                      ),
                      hintText: "Password",
                      hintStyle: textStyle.copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _loginController.isLogging.value
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
                          onPress: () => _loginController.login(),
                          color: primaryColor,
                          text: 'Login',
                          icon: Icons.login_rounded,
                        ),
                      ),
                SizedBox(height: 10),
                SizedBox(
                  width: Get.width,
                  height: 50,
                  child: BorderButton(
                      onPress: () => Get.to(() => RegisterPage()),
                      text: "Register",
                      color: primaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
