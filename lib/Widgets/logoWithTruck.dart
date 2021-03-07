import 'package:flutter/material.dart';

Widget logoWithTruck({Alignment aligment, String logo, String truckImage}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100),
    child: Column(
      children: [

        Image.asset(
          logo,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 40,
          child: AnimatedAlign(
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            alignment: aligment,
            child: Image.asset(
              truckImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}
