import 'package:flutter/material.dart';
import 'package:harmony/root/root.dart';

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
      home: RootPage(),
    );
  }
}
