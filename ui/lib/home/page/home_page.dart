import 'package:flutter/material.dart';
import 'package:harmony/server/page/server_page.dart';
import 'package:harmony/spec/spec.dart';

import '../strings.dart' as strings;
import '../widget/home_button.dart';

final buttonLabels = [
  strings.homeFriendsButton,
  for (var i = 1; i < 110; i++) 'Friend $i',
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
      child: ListView.builder(
        itemBuilder: (context, i) => HomeButton(label: buttonLabels[i]),
      ),
    );
  }

  // TODO (Issue#7): Replace with Navigation Widget
  Widget _buildMain(BuildContext context) {
    return Center(child: ServerPage());
  }
}
