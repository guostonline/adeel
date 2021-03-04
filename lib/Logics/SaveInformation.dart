import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';

Demande _controller = Get.put(Demande());
void saveInforamtion(
  String name,
  String email,
  String telephone,
  String userPhoto,
) {
  _controller.userName.value = name;
  _controller.userEmail.value = email;
  if (telephone != null) _controller.userTelephone.value = telephone;
  if (telephone == null) _controller.userTelephone.value = "Numéro inconu";

  _controller.userPhoto.value = userPhoto;
}
