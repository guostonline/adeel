import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_me/Logics/Demande.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              instance.signOut();
              Get.to(WelcomePage());
            },
            icon: Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.fill,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/maps.png",
                fit: BoxFit.cover,
              ),
              Text("Economisez jusqu'a 60% sur le transport routier",
                  style: GoogleFonts.abel(fontSize: 30)),
              SizedBox(height: 5),
              myInputField(title: "De?", txtContorller: txtDeController),
              _truckAnimation(),
              myInputField(title: "Vers?", txtContorller: txtVersController),
              SizedBox(height: 15),
              RaisedButton(
                color: Color(0xff0092CC),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  _changeAligment();

                  _controller.localite.value = txtDeController.text;
                  _controller.destination.value = txtVersController.text;
                },
                child: Text(
                  "Etap suivante",
                  style: GoogleFonts.abel(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
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
          Text(txtDeController.text == null ? "" : txtDeController.text,
              style: TextStyle(fontSize: 25)),
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
          Text(
            txtVersController.text == null ? "" : txtVersController.text,
            style: TextStyle(fontSize: 25),
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
