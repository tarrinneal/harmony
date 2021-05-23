import 'package:flutter/material.dart';

import '../../spec/spec.dart';
import '../widget/home_button.dart';
import '../strings.dart' as strings;

final buttonLabels = [
  strings.homeFriendsButton,
  for(var i = 0; i < 10; i++)
    'Friend $i',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSideBar(context),
          Expanded(child: _buildMain(context)),
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

  // TODO (Issue#7): Replace with Navgation Widget
  Widget _buildMain(BuildContext context) {
    return Center(child: Text('Main Content'));
  }
}
