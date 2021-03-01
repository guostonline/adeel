import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ship_me/Pages/PageMain.dart';

FirebaseAuth instance = FirebaseAuth.instance;
FirebaseFirestore ds = FirebaseFirestore.instance;

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithEmailAndPassword(
    {String email, String password, String name}) async {
  try {
    var result = await instance.createUserWithEmailAndPassword(
        email: email, password: password);
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
