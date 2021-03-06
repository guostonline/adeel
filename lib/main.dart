import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Pages/loginPage.dart';

import 'Pages/login-screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primaryColor: Colors.blue, secondaryHeaderColor: Colors.blueAccent),
    debugShowCheckedModeBanner: false,

    home: LoginScreen(),
  ));
}
