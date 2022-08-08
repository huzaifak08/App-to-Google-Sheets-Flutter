import 'package:flutter/material.dart';
import 'package:sheets_data/controller.dart';

import 'package:sheets_data/models/feedback_forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FeedbackForms feedbackForm = FeedbackForms(
          name: nameController.text,
          email: emailController.text,
          mobileNo: phoneController.text,
          feedback: feedbackController.text);

      FormController formController = FormController(
        (String response) {
          print(response);

          if (response == FormController.STATUS_SUCCESS) {
            _showSnackBar('Feedbck Submitted');
          } else {
            _showSnackBar('Error Occoured');
          }
        },
      );
      _showSnackBar('Submitting Feedback');
      formController.submitForm(feedbackForm);
    }
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Store data To Google Sheets'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter valid name';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter valid email';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'email'),
              ),
              TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter valid phone no.';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'Mobile No'),
              ),
              TextFormField(
                controller: feedbackController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter valid feedback';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'Feedback'),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                  _showSnackBar('Submitted');
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
