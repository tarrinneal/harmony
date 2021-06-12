import 'package:flutter/material.dart';
import 'package:harmony/routing/widget/harmony_router_delegate.dart';
import 'package:harmony/state/state.dart';

/// Displays the screen that the user views when they first visit the app
/// and they aren't authenticated.
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = AppRouteScope.of(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            appState.pushPage(HarmonyPage.server, 'home');
          },
          child: Text('Go to AppShell'),
        ),
      ),
    );
  }
}
