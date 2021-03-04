import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Pages/PageMain.dart';
import 'package:ship_me/Pages/signup.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:ship_me/Widgets/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

TextEditingController txtEmailController = TextEditingController();
TextEditingController txtPasswordController = TextEditingController();
FirebaseAuth instance = FirebaseAuth.instance;

Demande _controller = Get.put(Demande());

class _LoginPageState extends State<LoginPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Retour',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(TextEditingController txtContorller, String title,
      {bool isPassword = false, Icon icon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextField(
                controller: txtContorller,
                obscureText: isPassword,
                decoration: InputDecoration(
                    prefixIcon: icon,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        try {
          FirebaseAuth.instance.signInWithEmailAndPassword(
              email: txtEmailController.text.trim(),
              password: txtPasswordController.text.trim());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Get.snackbar("Alert", "utilisateur non trouver!");
          } else if (e.code == 'wrong-password') {
            Get.snackbar("Alert", "mot de pass incorrect");
          } else if (e.code == 'invalid-email') {
            Get.snackbar(
              "Alert",
              "Email incorrect",
            );
          }
        } catch (e) {
          Get.snackbar("Alert", "Vérifier la connexion");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red.shade600, Colors.red])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('ou'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return InkWell(
        onTap: ()  {
           signInWithGoogle().then(
            (value) => Get.to((PageMain)),
          );
          //  if (_controller.isLoginGoogle.value=true) Get.to(PageMain());
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("images/google_logo.png"))),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Text('Login avec Google',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'vous avez pas un compte. inscrivez vous ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Enregistre',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Entree ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Email ',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'et ',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
            TextSpan(
              text: 'Password',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(txtEmailController, "Email", icon: Icon(Icons.email)),
        _entryField(txtPasswordController, "Password",
            isPassword: true, icon: Icon(Icons.admin_panel_settings_outlined)),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User user) {
      if (user.uid != null) {
        _controller.isLoginGoogle.value = true;
        Get.to(PageMain());
        print("Bien entree");
      } else if (_controller.isLoginGoogle.value == true)
        Get.to(PageMain());
      else
        Get.to(PageMain());
      Get.snackbar("Bienvenue ${user.email}", "Vous avez bien enregistré");
      //Get.snackbar("Bienvenue", "Tu peu envoyer un demande");
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  SizedBox(height: 20),
                  _divider(),
                  _facebookButton(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
