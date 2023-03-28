import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailView extends StatefulWidget {
  const EmailView({super.key});

  @override
  State<EmailView> createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              sendMail(
                  recipientEmail: "talhafarooq522446@gmail.com",
                  mailMessage: "Email sent Successfully");

              print("Button Pressed");
            },
            child: const Text("Send Email"))
      ],
    );
  }

  void sendMail(
      {required String recipientEmail, required String mailMessage}) async {
    String username = "aliakber3677@gmail.com";
    String password = "smtp password";
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Order Recieved')
      ..recipients.add(recipientEmail)
      ..subject = "Order Recieved"
      ..text = "$mailMessage";

    try {
      await send(message, smtpServer).then((value) {
        print("Email Sent");
      });
    } on SocketException {
      print("NO Internet");
    } catch (e) {
      print("Error : ${e.toString()}");
    }
  }
}
