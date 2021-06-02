import 'package:flutter/material.dart';
import 'package:harmony/spec/spec.dart';

import '../../roundedHexagonalClipper.dart';

class ServerButton extends StatelessWidget {
  const ServerButton({
    required this.focused,
    required this.label,
    required this.onPressed,
    this.iconData,
  });

  final String label;
  final IconData? iconData;
  final bool focused;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(Sizing.serverSideBarWidth),
      child: Container(
        child: TextButton(
          onPressed: () {
            onPressed(label);
          },
          style: TextButton.styleFrom(
            backgroundColor: focused
                ? Theme.of(context).backgroundColor
                : Theme.of(context).primaryColorLight,
          ),
          child: ClipPath(
            clipper: RoundedHexagonalClipper(),
            child: Image(image: AssetImage('sloth.jpg')),
          ),
        ),
      ),

      // TextButton.icon(
      //   icon: Icon(iconData ?? Icons.person_outline),
      //   onPressed: () => onPressed(label),
      //   label: Text(label),
      //   style: TextButton.styleFrom(
      //     backgroundColor: focused
      //         ? Theme.of(context).backgroundColor
      //         : Theme.of(context).primaryColorLight,
      // ),
    );
  }
}
