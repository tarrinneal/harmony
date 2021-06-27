import 'package:flutter/material.dart';

class FormField extends StatelessWidget {
  const FormField({required this.name, required this.validator});

  final String name;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(labelText: name),
    );
  }
}
