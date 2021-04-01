import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/SaveInformation.dart';
import 'package:ship_me/Logics/SendEmail.dart';
import 'package:ship_me/Pages/InformationPage.dart';
import 'package:ship_me/Pages/PageMain.dart';

Demande _controller = Get.put(Demande());

class ReadyToSend extends StatelessWidget {
  const ReadyToSend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Text(
            "Adeel est prêt !",
            style: GoogleFonts.aladin(fontSize: 30),
          ),
          Divider(color: Colors.black, endIndent: 30, indent: 30),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                      """Bonjour ${_controller.userName.value}. \n vous demandez : \n  * ${_controller.categorie.value} * \n  Entre le ${_controller.dateDesLe.value} et le ${_controller.dateJusqua.value}.""",
                      minFontSize: 22,
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.bold, height: 2)),
                  SizedBox(height: 100),
                  Divider(color: Colors.black, endIndent: 30, indent: 30),
                  AutoSizeText(
                    "Le détail de votre commande a bien été pris en compte. Souhaitez-vous envoyer votre demande de devis ?",
                    minFontSize: 18,
                  )
                ],
              ),
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () =>
                    Get.to(InformationPage()), //Get.to(InformationPage()),
                child: Text("Modifier"),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.iniAll();
                  Get.to(PageMain());
                },
                child: Text("Ajouter.."),
              ),
              ElevatedButton(
                onPressed: () => sendEmail().then((value) {
                  saveInformationToFireStor(instance.currentUser.uid);
                }),
                child: Text("Envoyer"),
              ),
            ],
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
