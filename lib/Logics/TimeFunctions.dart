import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:intl/intl.dart';

Demande _controller = Get.put(Demande());
DateTime selectedDate = DateTime.now();
String formattedDate;
void selectDate(BuildContext context, {bool isJusqua = false}) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: selectedDate, // Refer step 1
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != selectedDate) {
    formattedDate = DateFormat('dd/MM/yyyy').format(picked);
    if (!isJusqua) {
      _controller.dateDesLe.value = formattedDate;
    } else if (isJusqua) _controller.dateJusqua.value = formattedDate;
  }
}
