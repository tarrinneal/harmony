import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmony/spec/spec.dart';

import './server_button.dart';
import '../../roundedHexagonalClipper.dart';

final serverLabels = [
  for (var i = 1; i < 11; i++) 'Server $i',
];

final String assetName = './Harmony.svg';

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
    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.serverSideBarWidth),
      child: ListView(
        children: [
          Container(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: selected == ''
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).primaryColorLight,
              ),
              onPressed: () {
                select('');
              },
              child: ClipPath(
                clipper: RoundedHexagonalClipper(),
                child: logoSvg,
              ),
            ),
          ),
          for (final server in serverLabels)
            Column(
              children: [
                SizedBox(height: 10),
                ServerButton(
                  label: server,
                  iconData: Icons.games_outlined,
                  focused: server == selected,
                  onPressed: select,
                ),
              ],
            )
        ],
      ),
    );
  }
}
