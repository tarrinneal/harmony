import 'package:flutter/material.dart';
// import 'package:harmony/app_shell/app_shell.dart';
import 'package:harmony/routing/routing.dart';

class HarmonyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: HarmonyRouteInformationParser(),
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
