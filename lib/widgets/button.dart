import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_pengaduan/constants/theme.dart';

// Class Widget Color Button
class ColorButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final Color color;
  final Function onPress;
  final String text;
  final double rounded;
  final double textSize;

  ColorButton(
      {this.height = 50,
      this.width,
      this.icon,
      this.color,
      this.onPress,
      this.text,
      this.rounded = 10,
      this.textSize = 15});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width != null ? width : Get.width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rounded),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon) : Container(),
            SizedBox(width: 5),
            Text(
              text,
              style: textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Class Widget Outline Button
class BorderButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final Color color;
  final Function onPress;
  final String text;
  final double rounded;
  final double textSize;
  final Color borderColor;
  final double borderWidth;

  BorderButton({
    this.height = 50,
    this.width,
    this.icon,
    this.color = Colors.white,
    this.onPress,
    this.text,
    this.borderColor = primaryColor,
    this.borderWidth = 2,
    this.rounded = 10,
    this.textSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width != null ? width : Get.width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded),
            ),
            side: BorderSide(color: borderColor, width: borderWidth)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon, color: color) : Container(),
            SizedBox(width: 5),
            Text(
              text,
              style: textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: textSize,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
