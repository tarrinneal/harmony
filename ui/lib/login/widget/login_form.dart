import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onSubmit,
  });

  final Function onSubmit;
  @override
  LoginFormState createState() => LoginFormState(onSubmit: onSubmit);

}

class LoginFormState extends State<LoginForm> {
  LoginFormState({
    required this.onSubmit,
  });

  final emailValidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
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
                child: TextFormField(
                  validator: (String? value) {
                    return (value != null && emailValidator.hasMatch(value)
                        ? null
                        : 'Not a valid email');
                  },
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
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
