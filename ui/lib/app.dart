import 'package:flutter/material.dart';
import 'package:harmony/auth/auth.dart';
import 'package:harmony/routing/routing.dart';
import 'package:provider/provider.dart';

class HarmonyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: HarmonyRouteInformationParser(
        authService: Provider.of<AuthService>(context),
      ),
      routerDelegate: HarmonyRouterDelegate(
        AppRouteState(
          authenticated: false,
        ),
      ),
      title: 'Harmony',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[900],
      ),
    );
  }
}
