import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:harmony/auth/auth.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isDev = const String.fromEnvironment("ENV") == 'DEV';

  await Firebase.initializeApp();
  runApp(
    Provider<AuthService>(
      create: (context) => isDev
          ? AuthServiceFactory.fake()
          : AuthServiceFactory.firebase(FirebaseAuth.instance),
      child: HarmonyApp(),
    ),
  );
}
