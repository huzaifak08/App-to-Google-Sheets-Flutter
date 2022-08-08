import 'package:flutter/material.dart';

class FeedbackForms {
  final String name;
  final String email;
  final String mobileNo;
  final String feedback;

  FeedbackForms(
      {required this.name,
      required this.email,
      required this.mobileNo,
      required this.feedback});

  String toParams() =>
      "?name = $name, ?email = $email, ?mobileNo = $mobileNo, ?feedback = $feedback";
}
