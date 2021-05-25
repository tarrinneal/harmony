import 'package:flutter/material.dart';
import 'package:harmony/home/home.dart';

import '../widget/server_sidebar.dart';

/// `AppShell` contains the basic setup for the application.
///
/// It renders the ServerSidebar and contains the nested routes for the Harmony
/// App
class AppShell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ServerSidebar(),
          Expanded(child: HomePage()),
        ],
      ),
    );
  }
}
