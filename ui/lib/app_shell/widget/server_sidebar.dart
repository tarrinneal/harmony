import 'package:flutter/material.dart';
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

    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.serverSideBarWidth),
      child: ListView.builder(
        itemCount: serverLabels.length + 1,
        itemBuilder: (context, i) =>
            Column(
              children: [
                SizedBox(height: 10),
                ServerButton(
                  label: i == 0 ? '' : serverLabels[i - 1],
                  iconData: Icons.games_outlined,
                  focused: i == 0 ? selected == '' : serverLabels[i - 1] == selected,
                  onPressed: select,
                  i: i,
                ),
              ],
            )

      ),
    );
  }
}

