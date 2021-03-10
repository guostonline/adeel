import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/SendEmail.dart';
import 'package:ship_me/Pages/InformationPage.dart';

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
            "Les informations Finale",
            style: GoogleFonts.aladin(fontSize: 30),
          ),
          Divider(color: Colors.black),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                  "Bonjour ${_controller.userName.value} vous demandez de transporter ${_controller.categorie.value} avec nombre de produits (${_controller.numberOfProduit} unités), total piods (${_controller.totalweight.value} kg). de bien transporter entre ${_controller.dateDesLe.value} au ${_controller.dateJusqua.value}. vous voulez envoyer cette commande?",
                  minFontSize: 22,
                  style:
                      GoogleFonts.abel(fontWeight: FontWeight.bold, height: 2)),
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Get.to(InformationPage()),
                child: Text("Modifier"),
              ),
              ElevatedButton(
                onPressed: () =>sendEmail(),

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
