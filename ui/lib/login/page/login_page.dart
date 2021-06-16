import 'package:flutter/material.dart';
import 'package:harmony/routing/config/harmony_page.dart';
import 'package:harmony/spec/spec.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/login_form.dart';

final String assetName = './Harmony.svg';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.onSubmit,
  });

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
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
          LoginForm(onSubmit: onSubmit),
        ],
      ),
    );
  }
}
