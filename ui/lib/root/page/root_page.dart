import 'package:flutter/material.dart';
import 'package:harmony/home/home.dart';

import '../widget/server_sidebar.dart';

class RootPage extends StatelessWidget {
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
