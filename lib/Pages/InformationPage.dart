import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import 'package:ship_me/Logics/SaveInformation.dart';
import 'package:ship_me/Pages/readyToSend.dart';
import 'package:ship_me/Widgets/formWidget.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

final myLocaleStorage = GetStorage();
Demande _controller = Get.put(Demande());
TextEditingController txtProduiController;
TextEditingController txtPoidsController;

var _blankFocusNode = FocusNode();

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
    if (localRead("telephone") != null)
      _controller.userTelephone.value = localRead("telephone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_blankFocusNode),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background3.jpg"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: 100),
                    myCardHeader(
                        nameClient: _controller.userName.value,
                        email: _controller.userEmail.value,
                        telephone: _controller.userTelephone.value ??
                            "Pas de téléphone",
                        localite: _controller.localite.value,
                        destination: _controller.destination.value,
                        title: "Inforamtions Client"),
                    SizedBox(height: 20),
                    categorie(
                      controllerPoids: txtPoidsController,
                      controllerProduit: txtProduiController,
                    ),
                    SizedBox(height: 20),
                    disponibilite(context),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.categorie.value ==
                            "Je veux transporter...") {
                          myMessage(
                              title: "Alert",
                              message: "Choisir le categorie de transport!",
                              isWhite: false);
                        } else if (_controller.userTelephone.value.isEmpty) {
                          showMaterialDialog();
                        } else if (_controller.dateDesLe.value.isEmpty ||
                            _controller.dateJusqua.value.isEmpty) {
                          myMessage(
                              title: "Alert",
                              message:
                                  "Choisir les deux dates de disponibilité",
                              isWhite: false);
                        } else
                          Get.to(ReadyToSend());

                        // Get.to(ReadyToSend());
                      },
                      child: Text("Votre devis dans 30min"),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showMaterialDialog() {
    TextEditingController _txtDialogue = TextEditingController();
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Numéro téléphone obligatoire!"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new Text(
                      "Merci de saisie votre numéro de téléphone pour bien communiquer"),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _txtDialogue,
                    decoration: InputDecoration(
                        labelText: "Saisie votre numéro téléphone."),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok voila!'),
                  onPressed: () {
                    _controller.userTelephone.value = _txtDialogue.text;
                    localDbWrite("telephone", _txtDialogue.text);
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
