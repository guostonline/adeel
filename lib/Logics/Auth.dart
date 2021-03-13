import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import 'package:ship_me/Logics/SaveInformation.dart';

import 'package:ship_me/Pages/login-screen.dart';
DateTime selectedDate = DateTime.now();
FirebaseAuth instance = FirebaseAuth.instance;
FirebaseFirestore ds = FirebaseFirestore.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
final myLocaleStorage = GetStorage();
Demande _controller = Get.put(Demande());

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
    {String email, String password, String name, String numberPhone}) async {
  try {
    var result = await instance
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((value) async {
      await instance.currentUser
          .updateProfile(displayName: name.capitalizeFirst.trim());

      _controller.userEmail.value = email;
      _controller.userName.value = name.capitalizeFirst.trim();
      _controller.userTelephone.value = numberPhone;
      localDbWrite("telephone", numberPhone);
      localDbWrite("userName", name.capitalizeFirst.trim());
      localDbWrite("email", email);
    });

    print("chakib login");
    return result;
  } on FirebaseAuthException catch (e) {
    if (e.message == "The email address is badly formatted.")
      myMessage(
          title: "Alert",
          message: "Invalid email réessayer SVP",
          isWhite: true);

    if (e.message == "The email address is already in use by another account.")
      myMessage(
          title: "Alert",
          message: "L'adresse e-mail est déjà utilisée par un autre compte.",
          isWhite: true);
    if (e.message == "Password should be at least 6 characters")
      myMessage(
          title: "Alert",
          message: "Ce mot de pass est faible. 6 characters ou plus",
          isWhite: true);
    if (e.message ==
        "The password is invalid or the user does not have a password.")
      myMessage(
          title: "Alert",
          message: "Invalide mot de pass réessayer SVP ",
          isWhite: true);

    print(e.message);
  } catch (e) {
    Get.snackbar("Alert", e.message);
  }
  return null;
}

saveToFirebase({String userID, String name, String email, String telephone}) {
  ds.collection("users").doc(userID).set({
    "name": name.trim(),
    "email": email.trim(),
    "telephone": telephone.trim()
  });
  myLocaleStorage.write("name", name.trim());
  myLocaleStorage.write("email", email.trim());
  myLocaleStorage.write("telephone", telephone.trim());
}

String currentUser() {
  return instance.currentUser.uid;
}

Future singIn({String email, String password, String name}) async {
  _controller.userName.value = name;
  _controller.userEmail.value = email;

  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      value.user.updateProfile(displayName: name);
      myLocaleStorage.write("email", value.user.email);
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found')
      myMessage(
        title: "Alert",
        message: "Il-a pas un client avec ce email",
      );
    if (e.code == 'wrong-password')
      myMessage(
        title: "Alert",
        message:
            "Mot de passe incorrect. Réessayez ou cliquez sur Mot de passe oublié. pour le réinitialiser.",
      );
  } catch (e) {
    print("an error");
  }
}

void passWordForgot(String email) async {
  instance.sendPasswordResetEmail(email: email).then((_) => myMessage(
      title: "Email bien envoyer ", message: "Vérifier votre boite email "));
}
