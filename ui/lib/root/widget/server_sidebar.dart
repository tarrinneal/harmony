import 'package:flutter/material.dart';
import '../strings.dart' as strings;
import 'package:harmony/spec/spec.dart';
import './server_button.dart';

final serverLabels = [
  strings.appTitle,
  for (var i = 1; i < 11; i++) 'Server $i',
];

class ServerSidebar extends StatefulWidget {
  @override
  _ServerSidebarState createState() => _ServerSidebarState();
}

class _ServerSidebarState extends State<ServerSidebar> {
  String selected = 'Harmony';

  void select(String label) {
    setState(() {
      selected = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.serverSideBarWidth),
      child: Column(
        children: [
          for (final server in serverLabels)
            Expanded(
              child: ServerButton(
                label: server,
                iconData: Icons.games_outlined,
                focused: server == selected,
                onPressed: select,
              ),
            ),
        ],
      ),
    );
  }
}
