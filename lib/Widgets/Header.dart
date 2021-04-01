import 'package:flutter/material.dart';

Widget myHeader(
    {context, String categorie, String locatite, String destination}) {
  /// Is my header widget to show information on all processe
  return Container(
    padding: EdgeInsets.all(15),
    height: 150,
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              blurRadius: 10, color: Colors.black87, offset: Offset(10.0, 10.0))
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Type de livraison:"),
            Text(categorie),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Localité :"),
            Text(locatite),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Destination:"),
            Text(destination),
          ],
        ),
      ],
    ),
  );
}
