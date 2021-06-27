import 'package:flutter/material.dart';

class FormField extends StatefulWidget {
  const FormField({required this.name, required this.validator});

  final String name;
  final String? Function(String?) validator;

  @override
  FormFieldState createState() => FormFieldState();
}

class FormFieldState extends State<FormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      decoration: InputDecoration(labelText: widget.name),
    );
  }
}
