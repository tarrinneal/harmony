import 'package:flutter/material.dart';
import 'package:harmony/routing/widget/harmony_router_delegate.dart';
import 'package:harmony/state/state.dart';

import '../widget/welcome_app_bar.dart';

/// Displays the screen that the user views when they first visit the app
/// and they aren't authenticated.
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = AppRouteScope.of(context);
    return Scaffold(
      appBar: WelcomeAppBar(
        title: 'Harmony',
        actions: [
          ActionButton(
            title: 'Login',
            onPressed: () {
              print('go to login page');
              appState.pushPage(HarmonyPage.login);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            appState.pushPage(HarmonyPage.server, nextServerId: 'home');
          },
          child: Text('Go to AppShell'),
        ),
      ),
    );
  }
}
