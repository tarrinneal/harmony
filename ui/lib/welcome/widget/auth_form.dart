import 'package:flutter/material.dart';

typedef AuthFormCallback = void Function(String, String);

class AuthForm extends StatelessWidget {
  AuthForm({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  final String title;
  final AuthFormCallback onSubmit;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 350),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline3),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthFormInput extends StatelessWidget {
  const _AuthFormInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
