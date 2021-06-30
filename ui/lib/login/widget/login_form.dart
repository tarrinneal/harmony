import 'package:flutter/material.dart';

import 'custom_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onSubmit,
    this.formFields = const [],
  });

  final List<CustomFormField> formFields;

  final Function onSubmit;
  @override
  LoginFormState createState() => LoginFormState(onSubmit: onSubmit);
}

class LoginFormState extends State<LoginForm> {
  LoginFormState({
    required this.onSubmit,
  });

  final Function onSubmit;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.cover,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 300,
                child: CustomFormField.email(),
              ),
              Container(
                width: 300,
                child: CustomFormField.password(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onSubmit();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
