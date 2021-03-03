import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ship_me/Widgets/formWidget.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  myCardHeader(
                      nameClient: "chakib elfil",
                      email: "guostonline@gmail.com",
                      telephone: "0691140000",
                      localite: "Rabat",
                      destination: "Casablanca",
                      title: "Inforamtions Client"),
                  SizedBox(height: 20),
                  categorie(),
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
