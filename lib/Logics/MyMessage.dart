import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void myMessage(
    {@required String title,
    @required String message,
   
    bool isWhite = true,
    bool isPorgress = false}) {
  Get.snackbar(title, message,
      messageText: Text(
        message,
        style: TextStyle(
            color: isWhite ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      snackPosition: SnackPosition.BOTTOM,
      showProgressIndicator: isPorgress ?? false,
      animationDuration: Duration(seconds: 2),
      barBlur: 20,
      duration: Duration(seconds: 5),
      icon: title == "Alert"
          ? Icon(
              FontAwesomeIcons.ban,
              color: Colors.red,
            )
          : Icon(FontAwesomeIcons.info, color: Colors.red),
      colorText: isWhite ? Colors.white : Colors.black,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      backgroundGradient:
          LinearGradient(colors: [Colors.blue, Colors.blueAccent]));
}
