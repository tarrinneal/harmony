import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmony/state/config/harmony_page.dart';
import 'package:harmony/routing/widget/harmony_router_delegate.dart';

import '../widget/login_form.dart';

final String assetName = './Harmony.svg';

class LoginPage extends StatelessWidget {
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
            LoginForm(
              onSubmit: () =>
                  {AppRouteScope.of(context).selectedPage = HarmonyPage.server},
            ),
          ],
        ),
      ),
    );
  }
}
