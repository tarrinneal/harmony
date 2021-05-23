import 'package:flutter/material.dart';
import '../../spec/spec.dart';

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
          Expanded(child: Center(child: Text('SideColumn'))),
        ],
      ),
    );
  }

  // TODO (Issue#7): Replace with Navgation Widget
  Widget _buildMain(BuildContext context) {
    return Center(child: Text('Main Content'));
  }
}
