import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ship_me/Logics/Auth.dart';
import 'package:ship_me/Logics/SaveInformation.dart';
import 'package:ship_me/Widgets/bezierContainer.dart';

import 'PageMain.dart';
import 'loginPage.dart';

TextEditingController txtNameController = TextEditingController();
TextEditingController txtEmailController = TextEditingController();
TextEditingController txtPasswordController = TextEditingController();
TextEditingController txtTelephoneController = TextEditingController();

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  Widget _entryField(TextEditingController txtController, String title,
      {bool isPassword = false, bool isPhone = false, Icon icon}) {
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
          TextField(
              controller: txtController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  prefixIcon: icon,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        await signInWithEmailAndPassword(
                email: txtEmailController.text,
                password: txtPasswordController.text,
                name: txtNameController.text)
            .then((value) {
          saveToFirebase(value.user.uid, {
            "Name": txtNameController.text,
            "email": txtEmailController.text,
            "Téléphone": txtTelephoneController.text,
          });
          print("new user enregistré");
        });
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
          'Registre maintenant',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

//TODO google
  Widget _googleButton() {
    return InkWell(
        onTap: () {
          signInWithGoogle().then((value) {
            if (value.user.displayName != null) {
              saveToFirebase(value.user.uid, {
                "Name": value.user.displayName,
                "email": value.user.email,
                "Téléphone": value.user.phoneNumber,
                "Photo": value.user.photoURL
              });
              saveInforamtion(value.user.displayName, value.user.email,
                  value.user.phoneNumber, value.user.photoURL);
              Get.to(PageMain());
              Get.snackbar("Bienvenue", "${value.user.displayName}",
                  backgroundColor: Colors.orange);
            }
            print(value.additionalUserInfo);
          });
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
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        color: Colors.white,
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
                    color: Colors.red.shade800,
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

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vous avez déja ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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
          text: 'Vos ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Informations  ',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(txtNameController, "Nom ", icon: Icon(Icons.account_box)),
        _entryField(txtTelephoneController, "Téléphone ",
            isPhone: true, icon: Icon(Icons.phone)),
        _entryField(txtEmailController, "Email", icon: Icon(Icons.email)),
        _entryField(txtPasswordController, "Password",
            isPassword: true, icon: Icon(Icons.add_moderator)),
      ],
    );
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
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(height: 20),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    _googleButton(),
                    SizedBox(height: 20),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
