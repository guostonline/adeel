import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void myMessage({@required  String title,@required String message, bool isWhite=true,bool isPorgress=false}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    showProgressIndicator:isPorgress? true:false,
    animationDuration: Duration(seconds: 2),
    icon: Icon(
      FontAwesomeIcons.ban,
      color: Colors.red,
    ),
    colorText: isWhite ? Colors.white : Colors.black,
  );
}
