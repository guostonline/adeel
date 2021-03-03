import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';

Demande _controller = Get.put(Demande());

selectCategorieImage(String categorie) {
  switch (categorie) {
    case "Démagements":
      _controller.categorieImage.value = "images/demenagement.jpg";
      break;
    case "Bagages":
      _controller.categorieImage.value = "images/bagage.png";
      break;
    case "Caisses ou Cartons":
      _controller.categorieImage.value = "images/carton.png";
      break;
    case "Meuble, élétroménager":
      _controller.categorieImage.value = "images/meuble.png";
      break;
    case "Palettes":
      _controller.categorieImage.value = "images/palette.png";
      break;
    case "Colis":
      _controller.categorieImage.value = "images/coli.png";
      break;

    default:
  }
}
