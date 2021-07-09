import 'package:flutter/material.dart';
import 'package:h_spec/spec.dart';

import 'custom_form_field.dart';

class AuthForm extends StatelessWidget {
  AuthForm({
    required GlobalKey<FormState> formKey,
    required this.onSubmit,
    this.formFields = const [],
  }) : _formKey = formKey;

  final VoidCallback onSubmit;
  final GlobalKey<FormState> _formKey;
  final List<CustomFormField> formFields;

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
              ...formFields.map(_buildFormField),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
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

  Widget _buildFormField(CustomFormField formField) {
    return Container(
      width: Sizing.loginFormWidth,
      child: formField,
    );
  }
}
