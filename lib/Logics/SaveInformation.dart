import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ship_me/Logics/Demande.dart';

var _myLocalDB = GetStorage();
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

  _controller.userPhoto.value = userPhoto;
}

localDbWrite(String key, String value) async {
  await _myLocalDB.write(key, value);
  print(_myLocalDB.read(key));
}

String localRead(String key) {
  var test = _myLocalDB.read(key);
  return test;
}
