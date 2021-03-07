import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

DateTime selectedDate = DateTime.now();

class Demande extends GetxController {
  // Demande information
  RxString categorie = "".obs;
  RxString localite = "".obs;
  RxString destination = "".obs;
  RxString dateDesLe = "".obs;
  RxString dateJusqua = "".obs;
  RxInt numberOfProduit = 0.obs;
  RxInt totalweight = 0.obs;
  RxString categorieImage = "images/logo.png".obs;
//User Inforamtion
  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString userTelephone = "".obs;
  RxString userPhoto = "images/user.png".obs;

  //TextField focus variables
  RxBool txtFieldDe = false.obs;
  RxBool txtFieldVers = false.obs;

  RxBool isLoginGoogle = false.obs;
  void isCategorieSelect(bool isDe) {
    isDe ? txtFieldDe.value = true : txtFieldVers.value = true;
  }
}
