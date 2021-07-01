import 'package:flutter/material.dart';
import 'package:harmony/login/strings.dart';

typedef Validator = String? Function(String?);

final _emailValidator = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class CustomFormField extends StatelessWidget {
  const CustomFormField._({
    required this.labelText,
    required this.validator,
    this.obscureText: false,
    this.enableSuggestions: true,
    this.controller,
  });

  factory CustomFormField.email() => CustomFormField._(
        labelText: loginFormEmail,
        validator: (String? value) {
          return (value != null && _emailValidator.hasMatch(value)
              ? null
              : loginFormEmailError);
        },
      );

  factory CustomFormField.password() => CustomFormField._(
        labelText: loginFormPassword,
        validator: (String? value) {
          return (value != null && value.length >= 8
              ? null
              : loginFormPasswordError);
        },
      );

  factory CustomFormField.passwordConfirm(Validator validator) =>
      CustomFormField._(
        labelText: loginFormConfirmPassword,
        validator: validator,
      );

  factory CustomFormField.username() => CustomFormField._(
        labelText: loginFormUsername,
        validator: (String? value) {
          return (/*check db for username*/ true
              ? null
              : loginFormUsernameError);
        },
      );

  factory CustomFormField.displayName() => CustomFormField._(
        labelText: loginFormDisplayName,
        validator: (String? value) {
          return (value != null
              ? null
              : loginFormDisplayNameError);
        },
      );

  final String labelText;
  final Validator validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enableSuggestions;

  // Example for text editing controller validator
  // String? validateConfirmPassword(String? value) {
  //   controller.value == value ? null : 'Passwords don\'t match';
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autocorrect: false,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
