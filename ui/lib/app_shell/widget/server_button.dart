import 'package:flutter/material.dart';
import 'package:harmony/spec/spec.dart';

import '../../roundedHexagonalClipper.dart';

final String assetName = './Harmony.svg';

class ServerButton extends StatelessWidget {
  const ServerButton({
    required this.focused,
    required this.label,
    required this.onPressed,
    required this.child,
  });

  final String label;
  final bool focused;
  final void Function(String) onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(Sizing.serverSideBarWidth),
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
          child: child,
        ),
      ),
    );
  }
}
