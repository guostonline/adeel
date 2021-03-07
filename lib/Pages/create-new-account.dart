import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import '../pallete.dart';
import '../widgets/widgets.dart';
import 'login-screen.dart';

TextEditingController _txtNameController = TextEditingController();
TextEditingController _txtEmailController = TextEditingController();
TextEditingController _txtTelephoneController = TextEditingController();
TextEditingController _txtPassWordController1 = TextEditingController();
TextEditingController _txtPassWordController2 = TextEditingController();

class CreateNewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'images/background.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      controller: _txtNameController,
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _txtEmailController,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _txtTelephoneController,
                      icon: FontAwesomeIcons.phone,
                      hint: 'Téléphone',
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      controller: _txtPassWordController1,
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      controller: _txtPassWordController2,
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        isGoogle: false,
                        buttonName: 'Enregistre',
                        myFunction: () {
                          signUpWithEmailAndPassword(
                            email: _txtEmailController.text.trim(),
                            password: _txtPassWordController1.text.trim(),
                            name: _txtNameController.text,
                            numberPhone: _txtTelephoneController.text,
                          ).then((value) => {
                                saveToFirebase(
                                       userID: value.user.uid,
                                      name: _txtNameController.text,
                                      email: _txtEmailController.text,
                                      telephone:_txtTelephoneController.text,
                                    )
                              });
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(LoginScreen()),
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
