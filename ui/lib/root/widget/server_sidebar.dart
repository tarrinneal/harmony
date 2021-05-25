import 'package:flutter/material.dart';
import '../strings.dart' as strings;
import 'package:harmony/spec/spec.dart';
import './server_button.dart';

final serverLabels = [
  strings.appTitle,
  for(var i = 1; i < 11; i++)
    'Server $i',
];

class ServerSideBar extends StatelessWidget {
  const ServerSideBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromWidth(Sizing.serverSideBarWidth),
      child: Column(
        children: [
          for(final server in serverLabels)
            Expanded(child: ServerButton(label: server,
            iconData: Icons.games_outlined,
            focused: server == strings.appTitle,),),
        ],
      ),
    );
  }
}
