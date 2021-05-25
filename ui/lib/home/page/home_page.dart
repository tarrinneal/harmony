import 'package:flutter/material.dart';

import '../../spec/spec.dart';
import '../widget/home_button.dart';
import '../strings.dart' as strings;

final buttonLabels = [
  strings.homeFriendsButton,
  for(var i = 1; i < 11; i++)
    'Friend $i',
];

final serverLabels = [
  'Home Button',
  for(var i = 1; i < 11; i++)
    'Server $i',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [],
        title: Text(strings.homeTitle)
      ),
      body: Row(
        children: [
          _buildserverSideBar(context),
          _buildSideBar(context),
          Expanded(child: _buildMain(context)),
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

  Widget _buildSideBar(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.homeSideBarWidth),
      child: Column(
        children: [
          for(final label in buttonLabels)
            Expanded(child: HomeButton(label: label)),
        ],
      ),
    );
  }

  // TODO (Issue#7): Replace with Navigation Widget
  Widget _buildMain(BuildContext context) {
    return Center(child: Text('Main Content'));
  }
}
