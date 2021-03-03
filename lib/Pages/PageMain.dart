import 'dart:async';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Pages/InformationPage.dart';
import 'package:ship_me/Pages/welcomePage.dart';
import 'package:ship_me/Widgets/inputWidget.dart';

FirebaseAuth instance = FirebaseAuth.instance;
TextEditingController txtDeController = TextEditingController();
TextEditingController txtVersController = TextEditingController();

class PageMain extends StatefulWidget {
  PageMain({Key key}) : super(key: key);

  @override
  _PageMainState createState() => _PageMainState();
}

Demande _controller = Get.put(Demande());
AlignmentGeometry _alignment = Alignment.centerLeft;

class _PageMainState extends State<PageMain> {
  @override
  void initState() {
    super.initState();
  }
final _keyForm=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height ,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0),
                image: DecorationImage(
                  //colorFilter: ColorFilter.mode(Colors.orange, BlendMode.color),
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill,
                )),
            child: Form(
              key: _keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  AutoSizeText(
                    "Choisir votre destination.",
                    style: GoogleFonts.abel(fontSize: 30),
                  ),
                  SizedBox(height: 60),
                  autoComplete(context, txtDeController, "Ville de départ"),
                  SizedBox(height: 30),
                  autoComplete(context, txtVersController, "Ville de livraison"),
                  SizedBox(height: 30),
                  _truckAnimation(),
                  Spacer(),
                  RaisedButton(
                    color: Color(0xff0092CC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    onPressed: () {
                      if(txtDeController.text.isEmpty || txtVersController.text.isEmpty)Get.snackbar("Alert", "Veuillez remplir le formulaire");
                     else{
                       _changeAligment();
                       Timer(Duration(seconds: 2),() {
                         Get.to(InformationPage());
                       });
                      }
                      _controller.localite.value = txtDeController.text;
                      _controller.destination.value = txtVersController.text;
                    },
                    child: Text(
                      "Suivant",
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _truckAnimation() {
    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(txtDeController.text == null ? "" : txtDeController.text,
              maxFontSize: 18),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: AnimatedAlign(
                duration: Duration(seconds: 2),
                curve: Curves.bounceInOut,
                alignment: _alignment,
                child: Image.asset(
                  "images/truck.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AutoSizeText(
            txtVersController.text == null ? "" : txtVersController.text,
            maxFontSize: 18,
          ),
        ],
      ),
    );
  }

  void _changeAligment() {
    setState(() {
      _alignment = Alignment.centerRight;
    });
  }
}
