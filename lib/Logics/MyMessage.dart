import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void myMessage(
    {@required String title,
    @required String message,
    bool isWhite = true,
    bool isPorgress = false}) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      showProgressIndicator: isPorgress ?? false,
      animationDuration: Duration(seconds: 2),
      icon: title == "Alert"
          ? Icon(
              FontAwesomeIcons.ban,
              color: Colors.red,
            )
          : Icon(FontAwesomeIcons.info, color: Colors.red),
      colorText: isWhite ? Colors.white : Colors.black,
      backgroundGradient:
          LinearGradient(colors: [Colors.blue, Colors.blueAccent]));
}
