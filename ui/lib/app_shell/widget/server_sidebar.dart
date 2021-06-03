import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmony/spec/spec.dart';

import './server_button.dart';

final serverLabels = [
  for (var i = 1; i < 11; i++) 'Server $i',
];

class ServerSidebar extends StatefulWidget {
  @override
  _ServerSidebarState createState() => _ServerSidebarState();
}

class _ServerSidebarState extends State<ServerSidebar> {
  String selected = '';

  void select(String label) {
    setState(() {
      selected = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logoSvg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Harmony Logo',
      fit: BoxFit.scaleDown,
      height: Sizing.serverSideBarWidth,
    );
    final slothJpg = Image(image: AssetImage('sloth.jpg'));
    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.serverSideBarWidth),
      child: ListView.builder(
        itemCount: serverLabels.length + 1,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.only(top: 10),
          child: ServerButton(
              label: i == 0 ? '' : serverLabels[i - 1],
              focused:
                  i == 0 ? selected == '' : serverLabels[i - 1] == selected,
              onPressed: select,
              child: i == 0 ? logoSvg : slothJpg),
        ),
      ),
    );
  }
}
