import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:intl/intl.dart';

Demande _controller = Get.put(Demande());
DateTime selectedDate = DateTime.now();
String formattedDate;
 DateTime picked;
void selectDate(BuildContext context, {bool isJusqua = false}) async {
  picked = await showDatePicker(
    context: context,
    initialDate: selectedDate, // Refer step 1
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != selectedDate) {
    formattedDate = DateFormat("dd/MM/yyyy").format(picked);
    if (!isJusqua) {
      _controller.dateDesLe.value = picked.toString();
      print(picked);
    } else if (isJusqua) _controller.dateJusqua.value = picked.toString();
  }
}

String dateToString(String selectDate){
if(selectDate.isEmpty)return "";
    DateTime dateTime = DateTime.tryParse(selectDate);
    var formatDate = DateFormat("dd/MM/yyyy").format(dateTime);
    print(formatDate);
    return formatDate;

}