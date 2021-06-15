import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.label,
    this.iconData,
  });

  final String label;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.contain,
        child: Form(
            child: Column(
          children: <Widget>[
            TextFormField(
              validator: (String? value) {
                return (value != null &&
                        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)
                    ? null
                    : 'Not a valid email');
              },
            )
          ],
        )),
      ),
    );
  }
}
