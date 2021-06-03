import 'package:flutter/material.dart';
import 'package:harmony/spec/spec.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../roundedHexagonalClipper.dart';

final String assetName = './Harmony.svg';

class ServerButton extends StatelessWidget {
  const ServerButton({
    required this.focused,
    required this.label,
    required this.onPressed,
    required this.i,
    this.iconData,
  });

  final String label;
  final bool focused;
  final void Function(String) onPressed;
  final int i;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    final logoSvg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Harmony Logo',
      fit: BoxFit.scaleDown,
      height: Sizing.serverSideBarWidth,
    );
    return SizedBox.fromSize(
      size: Size.square(Sizing.serverSideBarWidth),
      child: i == 0 ? Container(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: focused
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).primaryColorLight,
              ),
              onPressed: () {
                onPressed('');
              },
              child: ClipPath(
                clipper: RoundedHexagonalClipper(),
                child: logoSvg,
              ),
            ),
          ) : Container(
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
    );
  }
}


