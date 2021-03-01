import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xffff6f00), secondaryHeaderColor: Colors.orange),
    debugShowCheckedModeBanner: false,
    home: WelcomePage(),
  ));
}
