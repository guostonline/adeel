import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';

Demande _controller = Get.put(Demande());

class Validation {
  static void isShortPassword(String password) {
    if (password.length < 6) print("is not ok");
  }
}
