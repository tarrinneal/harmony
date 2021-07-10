import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmony/auth/auth.dart';
import 'package:harmony/login/widget/custom_form_field.dart';
import 'package:harmony/state/config/harmony_page.dart';
import 'package:harmony/routing/widget/harmony_router_delegate.dart';
import 'package:provider/provider.dart';

import '../widget/auth_form.dart';
import '../strings.dart' as strings;

final String assetName = './Harmony.svg';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  late final TextEditingController displayNameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    displayNameController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SvgPicture.asset(
              assetName,
              semanticsLabel: 'Harmony Logo',
              fit: BoxFit.fill,
            ),
            AuthForm(
              formKey: _formKey,
              onSubmit: _handleRegisterSubmit,
              formFields: [
                CustomFormField.email(controller: emailController),
                CustomFormField.displayName(controller: displayNameController),
                CustomFormField.password(
                  controller: passwordController,
                ),
                CustomFormField.passwordConfirm(_verifyPassword),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _verifyPassword(String? passwordConfrimation) {
    if (passwordConfrimation != null &&
        passwordConfrimation == passwordController.text) return null;
    print(passwordConfrimation);
    return strings.loginFormConfirmPasswordError;
  }

  void _handleRegisterSubmit() async {
    final routeScope = AppRouteScope.of(context);
    final authService = context.read<AuthService>();

    final email = emailController.text;
    final password = passwordController.text;
    final displayName = displayNameController.text;

    final result = await authService.register(
      email: email,
      password: password,
      displayName: displayName,
    );

    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null || !messenger.mounted) return;
    if (!result) {
      messenger.showSnackBar(SnackBar(content: Text('Error Signing up')));
      return;
    }

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          'Succesfully signed up as $email with display name $displayName',
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));
    // If successful register
    routeScope.selectedPage = HarmonyPage.server;
  }
}
