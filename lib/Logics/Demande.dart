import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ship_me/Pages/CategoriePages/AdeelDemenagement.dart';
import 'package:ship_me/Pages/CategoriePages/LivraisonExpress.dart';
import 'package:ship_me/Pages/CategoriePages/TransportDeMarchandise.dart';

DateTime selectedDate = DateTime.now();

class Demande extends GetxController {
  // Demande information
  RxString categorie = "Adeel Déménagement".obs;
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

  //Addel déménagement
  RxBool chargeDecharge = false.obs;
  RxBool montageDementage = false.obs;
  RxBool besoinEmbalage = false.obs;
  RxInt numberSalon = 0.obs;

  //TextField focus variables
  RxBool txtFieldDe = false.obs;
  RxBool txtFieldVers = false.obs;

  RxBool isLoginGoogle = false.obs;

  categorieChange(String categorie) {
    switch (categorie) {
      case "Adeel Déménagement":
        return AdeelDemenagement();
        break;
      case "Livraison Express des Colis":
        return LivraisonExpress();
        break;
      case "Transport de Marchandises":
        return TransportDeMarchandise();
        break;

      default:
        return AdeelDemenagement();
    }
  }
}
