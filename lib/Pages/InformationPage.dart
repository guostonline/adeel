import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Widgets/formWidget.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

final myLocaleStorage = GetStorage();
Demande _controller = Get.put(Demande());

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      nameClient: instance.currentUser.displayName,
                      email: instance.currentUser.email,
                      telephone: instance.currentUser.phoneNumber == null
                          ? "Pas de téléphone"
                          : instance.currentUser.phoneNumber.toString(),
                      localite: _controller.localite.value,
                      destination: _controller.destination.value,
                      title: "Inforamtions Client"),
                  SizedBox(height: 20),
                  categorie(),
                  SizedBox(height: 20),
                  disponibilite(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
