import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Pages/PageMain.dart';

import 'Pages/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primaryColor: Colors.orange, secondaryHeaderColor: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: WelcomePage(),
  ));
}
