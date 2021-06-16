import 'package:flutter/material.dart';
// import 'package:harmony/auth/auth.dart';
import 'package:harmony/spec/spec.dart';
import 'package:harmony/welcome/widget/auth_form.dart';
// import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void _handleSubmit(String email, String password) {}

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizing.defaultLRMargin,
          vertical: Sizing.defaultTBMargin,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthForm(title: 'Already One of Us!', onSubmit: _handleSubmit)
            ],
          ),
        ),
      ),
    );
  }
}
