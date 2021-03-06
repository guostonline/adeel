import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import 'package:ship_me/Pages/PageMain.dart';
import 'package:ship_me/Pages/login-screen.dart';
import 'package:ship_me/Pages/welcomePage.dart';

FirebaseAuth instance = FirebaseAuth.instance;
FirebaseFirestore ds = FirebaseFirestore.instance;
GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  GoogleAuthCredential credential;
  // Trigger the authentication flow
  try {
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  } catch (e) {
    Get.snackbar("Alert", e.message);
  }

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> googleLogOut() async {
  await googleSignIn.signOut();
  await instance.signOut();
  Get.to(LoginScreen());
  print("google log out");
}

Future<UserCredential> signUpWithEmailAndPassword(
    {String email, String password}) async {
  try {
    var result = await instance.createUserWithEmailAndPassword(
        email: email, password: password);
    print(result.user.email + "is login");
    Get.off(PageMain());
    return result;
  } on FirebaseAuthException catch (e) {
    if (e.message == "The email address is badly formatted.")
      Get.snackbar("Alert", "Invalid email réessayer SVP");
    if (e.message == "The email address is already in use by another account.")
      Get.snackbar("Alert", "Ce email est déja enregistrer");
    if (e.message == "Password should be at least 6 characters")
      Get.snackbar("Alert", "Ce mot de pass est faible. 6 characters ou plus");
    if (e.message ==
        "The password is invalid or the user does not have a password.")
      Get.snackbar("Alert", "Invalide mot de pass réessayer SVP ");
    print(e.message);
  } catch (e) {
    Get.snackbar("Alert", e.message);
  }
  return null;
}

saveToFirebase(String userID, myMap) {
  ds.collection("users").doc(userID).set(myMap);
}

String currentUser() {
  return instance.currentUser.uid;
}

Future singIn({String email, String password}) async {
  try {
    var instane = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    myMessage(
      title: "Loging",
      message: "Attendez SVP.....",
      isPorgress: true,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found')
      myMessage(
        title: "Alert",
        message: "Il-a pas un client avec ce email",
      );
    if (e.code == 'wrong-password')
      myMessage(
        title: "Alert",
        message: "mot de pass est incorrect",
      );
  } catch (e) {
    print("an error");
  }
}
