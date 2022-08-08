import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:sheets_data/models/feedback_forms.dart';

class FormController {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbzLTw57nhS7ELGkxfxD_AG2VkfGLwkR1jO3hD32kTRFAWaBs1g/exec";

  static const STATUS_SUCCESS = 'SUCCESS';

  FormController(this.callback);

  Future submitForm(FeedbackForms feedbackForm) async {
    try {
      await http.get(Uri.parse(URL + feedbackForm.toParams())).then(
        (response) {
          callback(
            convert.jsonDecode(response.body)['status'],
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
