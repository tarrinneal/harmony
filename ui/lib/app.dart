import 'package:flutter/material.dart';
import 'package:harmony/app_shell/app_shell.dart';

class HarmonyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harmony',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[900],
      ),
      home: AppShell(),
    );
  }
}
