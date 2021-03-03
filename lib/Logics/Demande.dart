import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


DateTime selectedDate = DateTime.now();
class Demande extends GetxController {
  RxString categorie = "".obs;
  RxString localite = "".obs;
  RxString destination = "".obs;
  RxString dateDesLe = "".obs;
  RxString dateJusqua = "".obs;
  RxString categorieImage = "images/logo.png".obs;


  //TextField focus variables
  RxBool txtFieldDe = false.obs;
  RxBool txtFieldVers = false.obs;
  
  RxBool isLoginGoogle=false.obs;
  void isCategorieSelect(bool isDe) {
   isDe? txtFieldDe.value = true:txtFieldVers.value=true;
  }
}
