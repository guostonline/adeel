import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Widgets/formWidget.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

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
              image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: SingleChildScrollView(
            child: Obx(
              ()=> Column(
                children: [
                  SizedBox(height: 100),
                  myCardHeader(
                      nameClient: _controller.userName.value,
                      email:  _controller.userEmail.value,
                      telephone:  _controller.userTelephone.value,
                      localite:  _controller.localite.value,
                      destination:  _controller.destination.value,
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
