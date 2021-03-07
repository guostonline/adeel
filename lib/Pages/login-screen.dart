import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import 'package:ship_me/Logics/SaveInformation.dart';
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
  TextEditingController _txtEmailController = TextEditingController();
  TextEditingController _txtPasswordController = TextEditingController();
  Demande _controller = Get.put(Demande());
  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User user) {
      if (user.uid != null) {
        Get.off(PageMain());
        myMessage(title: "Bienvenue", message: user.displayName, isWhite: true);
      } else if (_controller.isLoginGoogle.value == true) {
        Get.off(PageMain());
        myMessage(title: "Bienvenue", message: user.displayName, isWhite: true);
      } else
        Get.to(LoginScreen());
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
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 80),
                    Container(
                      child: logoWithTruck(
                          aligment: _alignment,
                          logo: "images/logo.png",
                          truckImage: "images/truck.png"),
                    ),
                    SizedBox(height: 120),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextInputField(
                            controller: _txtEmailController,
                            icon: FontAwesomeIcons.envelope,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                          ),
                          PasswordInput(
                            controller: _txtPasswordController,
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
                                  email: _txtEmailController.text,
                                  password: _txtPasswordController.text);
                              print("chakib an error on login");
                            },
                            isGoogle: false,
                          ),
                          SizedBox(height: 20),
                          RoundedButton(
                              buttonName: 'Login avec google',
                              isGoogle: true,
                              myFunction: () {
                                signInWithGoogle().then((value) {
                                  saveInforamtion(
                                      value.user.displayName,
                                      value.user.email,
                                      value.user.phoneNumber,
                                      value.user.photoURL);
                                  Get.to(PageMain());
                                });
                              }),
                          SizedBox(
                            height: 25,
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
                                      bottom:
                                          BorderSide(width: 1, color: kWhite))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  void _changeAligment() {
    setState(() {
      _alignment = Alignment.centerRight;
    });
  }
}
