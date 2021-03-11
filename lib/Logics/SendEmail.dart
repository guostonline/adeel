import 'package:get/get.dart';
import 'package:mailer2/mailer.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';
import 'package:ship_me/Logics/Validation.dart';

String userEmail = "guostonline@gmail.com";
String accessToken =
    "491711060603-bmthnqdvofde5l2el4r2ah1uoch8trul.apps.googleusercontent.com";
String password = 'whkhhumybmejnydd';

Demande _controller = Get.put(Demande());
Future sendEmail() async {
  var options = new GmailSmtpOptions()
    ..username = userEmail
    ..password = password;
  // Note: if you have Google's "app specific passwords" enabled,
  // you need to use one of those here.

  // How you use and store passwords is up to you. Beware of storing passwords in plain.

  // Create our email transport.
  var emailTransport = new SmtpTransport(options);

  // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'guostonline22@gmail.com'
    ..recipients.add('guostonline@gmail.com')
    //..ccRecipients.add('zimach.adil@gmail.com')
    ..subject = 'Un nouveau demande bien arriver'
    ..html = sendByCategory(_controller.categorie.value);

  // Email it.
  emailTransport
      .send(envelope)
      .then((envelope) => myMessage(
          title: "Statut",
          message:
              "Votre demande de devis a bien été envoyée. Vous recevrez notre réponse dans moins de 30min !",
          isWhite: false))
      .catchError((e) => myMessage(
          title: "Alert",
          message: "Il y a une erreur, réessayez plutard!",
          isWhite: false));
}
