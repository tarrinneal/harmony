import 'package:flutter/material.dart';
import 'package:harmony/auth/auth.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    Provider<AuthService>(
      create: (context) => AuthService.fake(),
      child: HarmonyApp(),
    ),
  );
}
