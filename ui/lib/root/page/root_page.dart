import 'package:flutter/material.dart';
import 'package:harmony/home/home.dart';
import 'package:harmony/spec/spec.dart';

import '../strings.dart' as strings;
import '../widget/home_button.dart';


final serverLabels = [
  strings.appTitle,
  for(var i = 1; i < 11; i++)
    'Server $i',
];

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildserverSideBar(context),
          Expanded(child: HomePage()),
        ],
      ),
    );
  }

   Widget _buildserverSideBar(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.serverSideBarWidth),
      child: Column(
        children: [
          for(final server in serverLabels)
            Expanded(child: HomeButton(label: server, iconData: Icons.games_outlined,)),
        ],
      ),
    );
  }
}
