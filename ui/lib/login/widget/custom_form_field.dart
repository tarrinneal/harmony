import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

final _emailValidator = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class CustomFormField extends StatelessWidget {
  const CustomFormField._({
    required this.labelText,
    required this.validator,
    this.controller,
  });

  factory CustomFormField.email() => CustomFormField._(
        labelText: 'Email',
        validator: (String? value) {
          return (value != null && _emailValidator.hasMatch(value)
              ? null
              : 'Not a valid email');
        },
      );

  factory CustomFormField.passwordConfirm(Validator validator) =>
      CustomFormField._(
        labelText: 'Confirm Password',
        validator: validator,
      );

  final String labelText;
  final Validator validator;
  final TextEditingController? controller;

  // Example for text editing controller validator
  // String? validateConfirmPassword(String? value) {
  //   controller.value == value ? null : 'Passwords don\'t match';
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
