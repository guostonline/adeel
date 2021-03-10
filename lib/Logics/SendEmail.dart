import 'package:get/get.dart';
import 'package:mailer2/mailer.dart';
import 'package:ship_me/Logics/Demande.dart';
import 'package:ship_me/Logics/MyMessage.dart';

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
    ..ccRecipients.add('zimach.adil@gmail.com')
    ..subject = 'Un nouveau demande bien arriver'
    ..html =
        """<h1>Nom : ${_controller.userName.value}</h1>\n <h2>Email : ${_controller.userEmail.value}</h2>\n <p>Téléphone : ${_controller.userTelephone.value} </p>\n
                   <p> Categorie : ${_controller.categorie.value}.</p> \n
                   <p> Nombre de produits : ${_controller.numberOfProduit.value}. Total Poids : ${_controller.totalweight.value} </p>\n
                   <p> Ville de départ : ${_controller.localite.value} ----------> ${_controller.destination.value} </p>\n
                   <p> Date de : ${_controller.dateDesLe.value} ----------> ${_controller.dateJusqua.value}</p>
                    """;

  // Email it.
  emailTransport
      .send(envelope)
      .then((envelope) => myMessage(
          title: "Statut",
          message: "Demande est bien evoyer notre reponce dans 30min",
          isWhite: false))
      .catchError((e) => print('Error occurred: $e'));
}
