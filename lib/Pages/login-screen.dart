import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import 'package:ship_me/Pages/create-new-account.dart';
import 'package:ship_me/Pages/forgot-password.dart';
import 'package:ship_me/Widgets/logoWithTruck.dart';

import '../pallete.dart';
import '../widgets/widgets.dart';
import 'PageMain.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth instance = FirebaseAuth.instance;
  AlignmentGeometry _alignment = Alignment.centerLeft;
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  Demande _controller = Get.put(Demande());
  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User user) {
      if (user.uid != null) {
        Get.to(PageMain());
        myMessage(title: "Bienvenue", message: user.email, isWhite: true);
      } else if (_controller.isLoginGoogle.value == true)
        Get.to(PageMain());
      else
        Get.to(LoginScreen());
      Get.snackbar("Bienvenue ${user.email}", "Vous avez bien enregistré");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'images/background.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 50),
              Flexible(
                child: logoWithTruck(
                    aligment: _alignment,
                    logo: "images/logo.png",
                    truckImage: "images/truck.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    controller: txtEmailController,
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    controller: txtPasswordController,
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(ForgotPassword()),
                    child: Text(
                      'Mot de pass oublié?',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
                    myFunction: () {
                      _changeAligment();
                      singIn(
                          email: txtEmailController.text,
                          password: txtPasswordController.text);
                      print("chakib an error on login");
                    },
                    isGoogle: false,
                  ),
                  SizedBox(height: 10),
                  RoundedButton(
                    buttonName: 'Login avec google',
                    myFunction: () => Get.to(PageMain()),
                    isGoogle: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.to(CreateNewAccount()),
                child: Container(
                  child: Text(
                    'Créer un nouveau compte',
                    style: kBodyTextSmoler,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }

  void _changeAligment() {
    setState(() {
      _alignment = Alignment.centerRight;
    });
  }
}
