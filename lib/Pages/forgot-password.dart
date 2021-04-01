import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ship_me/Logics/Auth.dart';
import '../pallete.dart';
import '../widgets/background-image.dart';
import '../widgets/rounded-button.dart';
import '../widgets/text-field-input.dart';

TextEditingController _txtEmailController;

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/login_bg.png'),
        
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: Text(
              'Mot de pass oublier.',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'Entrez votre e-mail, nous vous enverrons des instructions pour réinitialiser votre mot de passe',
                        style: kBodyText,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInputField(
                      controller: _txtEmailController,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      isGoogle: false,
                      buttonName: 'Envoyer',
                      myFunction: () {
                        passWordForgot(_txtEmailController.text);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
