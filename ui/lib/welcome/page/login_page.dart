import 'package:flutter/material.dart';
// import 'package:harmony/auth/auth.dart';
import 'package:harmony/spec/spec.dart';
// import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300, 200)),
                child: Container(color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
