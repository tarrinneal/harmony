import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:harmony/auth/auth.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    Provider<AuthService>(
      create: (context) => AuthService.fake(),
      child: HarmonyApp(),
    ),
  );
}
