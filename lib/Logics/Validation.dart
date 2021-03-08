import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/Demande.dart';

Demande _controller = Get.put(Demande());
var myStocage = GetStorage();

class Validation {
  static void isShortPassword(String password) {
    if (password.length < 6) print("is not ok");
  }

  static String testTelephone() {
    if (myStocage.read("telephone") != null)
      return myStocage.read("telephone");
    else
      return "Pas de téléphone";
  }
}
