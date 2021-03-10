import 'package:get/get.dart';
import 'package:mailer2/mailer.dart';
import 'package:ship_me/Logics/Demande.dart';

String userEmail = "guostonline@gmail.com";
String accessToken =
    "491711060603-bmthnqdvofde5l2el4r2ah1uoch8trul.apps.googleusercontent.com";
String password = "Haroune123";
Demande _controller = Get.put(Demande());
Future sendEmail() async {
  var options = new GmailSmtpOptions()
    ..username = 'guostonline@gmail.com'
    ..password =
        'whkhhumybmejnydd'; // Note: if you have Google's "app specific passwords" enabled,
  // you need to use one of those here.

  // How you use and store passwords is up to you. Beware of storing passwords in plain.

  // Create our email transport.
  var emailTransport = new SmtpTransport(options);

  // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'guostonline22@gmail.com'
    ..recipients.add('guostonline@gmail.com')
    ..subject = 'Testing the Dart Mailer library'
    ..text =
        """Nom : ${_controller.userName.value} Email : ${_controller.userEmail.value} Téléphone : ${_controller.userTelephone.value} \n
                    Categorie : ${_controller.categorie.value}. \n
                    Nombre de produits : ${_controller.numberOfProduit.value}. Total Poids : ${_controller.totalweight.value} \n
                    Ville de départ : ${_controller.localite.value} ----------> ${_controller.destination.value} \n
                    Date de : ${_controller.dateDesLe.value} ----------> ${_controller.dateJusqua.value}
                    """;

  // Email it.
  emailTransport
      .send(envelope)
      .then((envelope) => print('Email sent!'))
      .catchError((e) => print('Error occurred: $e'));
}
