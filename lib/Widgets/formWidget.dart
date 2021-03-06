import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_me/Constant/myList.dart';
import 'package:ship_me/Logics/CategorieFunc.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/TimeFunctions.dart';

Demande _controller = Get.put(Demande());

Widget myCardHeader(
    {String title,
    String nameClient,
    String email,
    String telephone,
    String localite,
    String destination}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.abel(
              fontSize: 25,
            )),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Card(
            color: Colors.white.withOpacity(0.8),
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DefaultTextStyle(
                style: GoogleFonts.actor(
                  fontSize: 16,
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nom : "),
                        Text(nameClient),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email : "),
                        Text(email),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Téléphone : "),
                        Text(telephone),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Text(localite + " "),
                        Expanded(child: Divider(color: Colors.black)),
                        Text("> " + destination),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget disponibilite(
  context,
) {
  return Container(
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Disponibilié", style: GoogleFonts.abel(fontSize: 25)),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Card(
              color: Colors.white.withOpacity(0.8),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultTextStyle(
                  style: GoogleFonts.actor(fontSize: 16, color: Colors.black),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Disponible dés le :"),
                          Text(_controller.dateDesLe.value),
                          IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () => selectDate(context),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Disponible jusqu'à :"),
                          Text(_controller.dateJusqua.value),
                          IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () =>
                                selectDate(context, isJusqua: true),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget categorie() {
  return Container(
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categorie", style: GoogleFonts.abel(fontSize: 25)),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Card(
              color: Colors.white.withOpacity(0.8),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultTextStyle(
                  style: GoogleFonts.actor(fontSize: 15, color: Colors.black),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: DropdownButton<String>(
                              items: actionDemande.map((String value) {
                                return new DropdownMenuItem<String>(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              hint: _controller.categorie.value == ""
                                  ? Text(
                                      "Je veux transporter...",
                                      style: GoogleFonts.abel(),
                                    )
                                  : Text(_controller.categorie.value,
                                      style: GoogleFonts.abel()),
                              isExpanded: true,
                              onChanged: (value1) {
                                _controller.categorie.value = value1;
                                _controller.isCategorieSelect(true);
                                selectCategorieImage(value1);
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(_controller.categorieImage.value),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                  suffixText: "Unités",
                                  labelText: "Nombre de produit"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 30),
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                  suffixText: "Kg", labelText: "Poids total"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
