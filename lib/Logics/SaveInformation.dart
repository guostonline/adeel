import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ship_me/Logics/Demande.dart';

DateTime dateNow = DateTime.now();
FirebaseFirestore ds = FirebaseFirestore.instance;
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

localReset() {
  _myLocalDB.erase();
}

saveInformationToFireStor(String userID) async {
  var formattedDate = DateFormat('hh:mm-dd/MM/yyyy').format(dateNow);
  var myDs = ds.collection("Demandes");
  myDs.add({
    "User": "$userID",
    "Date de comande": Timestamp.now(),
    "Categorie": _controller.categorie.value,
    "Localite": _controller.localite.value,
    "Destination": _controller.destination.value,
    "DesLe":Timestamp.fromDate(DateTime.parse(_controller.dateDesLe.value)) ,
    "Jusqua":Timestamp.fromDate(DateTime.parse(_controller.dateJusqua.value)) ,
    "Chargement-Dechargment": _controller.chargeDecharge.value,
    "Montage-Demontage": _controller.montageDementage.value,
    "Besoin-Embalage": _controller.besoinEmbalage.value,
    "Nombre de salons": _controller.numberSalon.value,
    "Demande de Facture": _controller.avecFacture.value,
    "Quantité": _controller.numberOfProduit.value,
    "Poids": _controller.totalweight.value,
    "Vue": false,
    "Repondu": false,
    "Refus": false,
    "Montant": 0,
    "Valider": false
  }).then((value) => {
        myDs.doc(value.id).update({"ID": value.id}),
      });
  ds
      .collection("Users")
      .doc(userID)
      .update({"Téléphone": _controller.userTelephone.value, "ID": userID});
}

Future saveUserToFireStore(String userID, String name, String email,
    String photoUrl, String numberPhone,String messagingToken) async {
  await ds.collection("Users").doc(userID).set({
    "ID": userID,
    "Nom et prenom": name,
    "Email": email,
    "Photo url": photoUrl,
    "Téléphone": numberPhone,
    "Messaging token":messagingToken
  });
}
