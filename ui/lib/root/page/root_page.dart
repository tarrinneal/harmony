import 'package:flutter/material.dart';
import 'package:harmony/home/home.dart';
import 'package:harmony/spec/spec.dart';

// import '../strings.dart' as strings;
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
