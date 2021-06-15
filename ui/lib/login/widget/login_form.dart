import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

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
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (String? value) {
                return (value != null && value.length > 8
                    ? null
                    : 'Password must be 8 characters or longer');
              },
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //auth
                }
              },
              child: Text('Submit'),
            ),
          ],
        )),
      ),
    );
  }
}
