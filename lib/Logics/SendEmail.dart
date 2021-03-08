import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> sendMeMail({String body, String suject, String recipients}) async {
  final Email email = Email(
    body: body,
    subject: suject,
    recipients: [recipients],
  );

  String platformResponse;

  try {
    await FlutterEmailSender.send(email);
    platformResponse = 'success';
  } catch (error) {
    platformResponse = error.toString();
  }
  return platformResponse;
}
